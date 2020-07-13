import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shiftend/models/organization/organization.dart';
import 'package:shiftend/repositories/interfaces/organization_repository_interface.dart';

class OrganizationRepository extends OrganizationRepositoryInterface {
  OrganizationRepository({@required this.firestore})
      : assert(firestore != null);

  final Firestore firestore;
  static const String collectionName = 'organizations';

  @override
  Future<void> create(Organization org) async {
    await firestore
        .collection(collectionName)
        .document(org.id)
        .setData(org.toJson());
  }

  @override
  Future<Organization> getOrganization(String id) async {
    final snapshot =
        await firestore.collection(collectionName).document(id).get();
    return Organization.fromJson(snapshot.data);
  }

  @override
  Future<List<Organization>> getOrganizations(String ownerId) async {
    final orgs = firestore
        .collection(collectionName)
        .where('owner_ids', arrayContains: ownerId);
    return (await orgs.getDocuments())
        .documents
        .map((DocumentSnapshot e) => Organization.fromJson(e.data))
        .toList();
  }

  @override
  Future<void> update(Organization org) async {
    await firestore
        .collection(collectionName)
        .document(org.id)
        .updateData(org.toJson());
  }
}
