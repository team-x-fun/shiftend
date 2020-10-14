import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shiftend/models/models.dart';
import 'package:shiftend/repositories/interfaces/organization_repository_interface.dart';
import 'package:shiftend/repositories/interfaces/user_repository_interface.dart';
import 'package:shiftend/util/logger.dart';

class OrganizationRepository extends OrganizationRepositoryInterface {
  OrganizationRepository({@required this.firestore, @required this.userRepo})
      : assert(firestore != null),
        assert(userRepo != null);

  final FirebaseFirestore firestore;
  final UserRepositoryInterface userRepo;
  static const String collectionName = 'organizations';

  @override
  Future<void> create(Organization org) async {
    final json = await _toJson(org);

    await firestore.collection(collectionName).doc(org.id).set(json);
  }

  @override
  Future<Organization> getOrganization(String id) async {
    final Map<String, dynamic> json =
        (await firestore.collection(collectionName).doc(id).get()).data();
    if (json == null) {
      return const Organization();
    }
    return _fromJson(json);
  }

  @override
  Stream<Organization> getOrgStream(String id) {
    final Stream<DocumentSnapshot> orgStream =
        firestore.collection(collectionName).doc(id).snapshots();
    return orgStream.asyncMap((snapshot) async {
      final json = snapshot.data();
      if (json == null) {
        return const Organization();
      }
      final org = await _fromJson(json);
      return org;
    });
  }

  @override
  Future<List<Organization>> getOrganizations(String ownerId) async {
    final orgs = firestore
        .collection(collectionName)
        .where('owners', arrayContains: await userRepo.getUserRef(ownerId));
    return Future.wait((await orgs.get())
            .docs
            .map((DocumentSnapshot e) => _fromJson(e.data()))
            .toList())
        .then(
      (orgs) {
        logger.info(orgs.length);
        return orgs.where((org) => org.members.isNotEmpty).toList();
      },
    );
  }

  @override
  Future<void> update(Organization org) async {
    final json = await _toJson(org);
    await firestore.collection(collectionName).doc(org.id).update(json);
  }

  Future<List<DocumentReference>> _getUsersRef(List<User> users) async {
    final List<DocumentReference> usersRef = <DocumentReference>[];
    for (final User user in users) {
      usersRef.add(await userRepo.getUserRef(user.id));
    }
    return usersRef;
  }

  Future<Organization> _fromJson(Map<String, dynamic> rawJson) async {
    final Map<String, dynamic> result = <String, dynamic>{...rawJson}
      ..remove('owners')
      ..remove('members');
    result['owners'] = <String>[];
    result['members'] = <String>[];
    final Organization org = Organization.fromJson(result);

    final List<Future<User>> futureOwners =
        (rawJson['owners'].cast<DocumentReference>() as List<DocumentReference>)
            .map(userRepo.fromUserRef)
            .toList();
    final List<User> owners = await Future.wait(futureOwners);
    if (_validateMembers(rawJson['members'].cast<dynamic>() as List<dynamic>)) {
      final futureMembers = (rawJson['members'].cast<Map<String, dynamic>>()
              as List<Map<String, dynamic>>)
          .map(_memberFromJson)
          .toList();
      final List<Member> members = await Future.wait(futureMembers);
      return org.copyWith(owners: owners, members: members);
    } else {
      logger
        ..warning('member is invalid schema.')
        ..info('rawJson[\'members\'] = ${rawJson['members'].runtimeType}');
      return org.copyWith(owners: owners);
    }
  }

  bool _validateMembers(List<dynamic> json) {
    var isValid = true;
    json.forEach((dynamic element) {
      if (!(element is Map<String, dynamic>)) {
        isValid = false;
      }
    });
    return isValid;
  }

  Future<Map<String, dynamic>> _toJson(Organization org) async {
    final Map<String, dynamic> json = org.toJson()
      ..remove('owners')
      ..remove('members');
    json['owners'] = await _getUsersRef(org.owners);
    final membersJson = org.members.map(_memberToJson).toList();

    json['members'] = await Future.wait(membersJson);
    logger.info('_toJson = ${json.toString()}');
    return json;
  }

  Future<Map<String, dynamic>> _memberToJson(Member member) async {
    final json = member.toJson()..remove('user');
    json['userRef'] = await userRepo.getUserRef(member.user.id);
    return json;
  }

  Future<Member> _memberFromJson(Map<String, dynamic> memberJson) async {
    final json = <String, dynamic>{...memberJson}..remove('userRef');
    final member = Member.fromJson(json);
    logger.info(member);
    final userRef = memberJson['userRef'] as DocumentReference;
    logger.info(userRef);
    if (userRef == null) {
      return member;
    }
    return member.copyWith(
      user: await userRepo
          .fromUserRef(memberJson['userRef'] as DocumentReference),
    );
  }

  @override
  Future<List<Holiday>> getHolidays(String id) {
    return getOrganization(id).then((value) => value.defaultHolidays);
  }
}
