import 'package:shiftend/models/models.dart';
import 'package:shiftend/models/organization/organization.dart';

abstract class OrganizationRepositoryInterface {
  Future<void> create(Organization org);
  Future<void> update(Organization org);
  Future<Organization> getOrganization(String id);
  Stream<Organization> getOrgStream(String id);
  Future<List<Organization>> getOrganizations(String ownerId);
  Future<List<Holiday>> getHolidays(String id);
}
