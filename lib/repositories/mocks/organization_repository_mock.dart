import 'package:shiftend/models/holiday/holiday.dart';
import 'package:shiftend/models/organization/organization.dart';
import 'package:shiftend/repositories/interfaces/organization_repository_interface.dart';
import 'package:shiftend/repositories/mocks/user_repository_mock.dart';

class OrganizationRepositoryMock extends OrganizationRepositoryInterface {
  List<Organization> orgs = <Organization>[];

  OrganizationRepositoryMock() {
    UserRepositoryMock _userRepo = UserRepositoryMock();
    orgs.add(
      Organization(
        id: 'test_id',
        ownerIds: <String>[_userRepo.currentUser.id],
        memberIds: <String>[_userRepo.currentUser.id],
        defaultHolidays: <Holiday>[
          Holiday(dayOfWeek: 0, nWeek: 0),
          Holiday(dayOfWeek: 1, nWeek: 1),
          Holiday(dayOfWeek: 1, nWeek: 3)
        ],
      ),
    );
  }

  @override
  Future<void> create(Organization org) async {
    orgs.add(org);
    return;
  }

  @override
  Future<Organization> getOrganization(String id) async {
    for (var org in orgs) {
      if (org.id == id) {
        return org;
      }
    }
    throw Exception('not found organization');
  }

  @override
  Future<List<Organization>> getOrganizations(String ownerId) async {
    List<Organization> ownedOrgs;
    for (var org in orgs) {
      if (org.ownerIds.contains(ownerId)) {
        ownedOrgs.add(org);
      }
    }
    return ownedOrgs;
  }

  @override
  Future<void> update(Organization org) async {
    orgs.asMap().forEach((index, _org) {
      if (org.id == _org.id) {
        orgs[index] = org;
        return;
      }
    });
    return;
  }
}
