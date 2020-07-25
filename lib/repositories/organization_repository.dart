import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shiftend/models/models.dart';
import 'package:shiftend/repositories/interfaces/organization_repository_interface.dart';
import 'package:shiftend/repositories/interfaces/user_repository_interface.dart';

class OrganizationRepository extends OrganizationRepositoryInterface {
  OrganizationRepository({@required this.firestore, @required this.userRepo})
      : assert(firestore != null),
        assert(userRepo != null);

  final Firestore firestore;
  final UserRepositoryInterface userRepo;
  static const String collectionName = 'organizations';

  @override
  Future<void> create(Organization org) async {
    final Map<String, dynamic> json = org.toJson()
      ..remove('owners')
      ..remove('members');
    json['owners'] = await _getUsersRef(org.owners);
    json['members'] = await _getUsersRef(org.members);

    await firestore.collection(collectionName).document(org.id).setData(json);
  }

  @override
  Future<Organization> getOrganization(String id) async {
    final Map<String, dynamic> json =
        (await firestore.collection(collectionName).document(id).get()).data;

    return _fromJson(json);
  }

  @override
  Future<List<Organization>> getOrganizations(String ownerId) async {
    final orgs = firestore
        .collection(collectionName)
        .where('owners', arrayContains: await userRepo.getUserRef(ownerId));
    return Future.wait((await orgs.getDocuments())
        .documents
        .map((DocumentSnapshot e) => _fromJson(e.data))
        .toList());
  }

  @override
  Future<void> update(Organization org) async {
    await firestore
        .collection(collectionName)
        .document(org.id)
        .updateData(org.toJson());
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
    final Organization org = Organization.fromJson(result);

    final List<Future<User>> futureOwners =
        (rawJson['owners'].cast<DocumentReference>() as List<DocumentReference>)
            .map(userRepo.fromUserRef)
            .toList();
    final List<User> owners = await Future.wait(futureOwners);

    final List<Future<User>> futureMembers = (rawJson['members']
            .cast<DocumentReference>() as List<DocumentReference>)
        .map(userRepo.fromUserRef)
        .toList();
    final List<User> members = await Future.wait(futureMembers);
    return org.copyWith(owners: owners, members: members);
  }
}
