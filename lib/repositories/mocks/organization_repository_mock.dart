import 'package:shiftend/models/holiday/holiday.dart';
import 'package:shiftend/models/models.dart';
import 'package:shiftend/models/organization/organization.dart';
import 'package:shiftend/repositories/interfaces/organization_repository_interface.dart';
import 'package:shiftend/repositories/mocks/user_repository_mock.dart';

class OrganizationRepositoryMock extends OrganizationRepositoryInterface {
  OrganizationRepositoryMock() {
    final UserRepositoryMock _userRepo = UserRepositoryMock();
    orgs.add(
      Organization(
        id: 'test_id',
        owners: _userRepo.users
            .where((user) => user.email == 'owner@example.com')
            .toList(),
        members: _userRepo.users
            .map<Member>((user) => Member(
                  level: 1,
                  role: 'member',
                  user: user,
                ))
            .toList(),
        defaultHolidays: <Holiday>[
          const Holiday(dayOfWeek: 0, nWeek: 0),
          const Holiday(dayOfWeek: 1, nWeek: 1),
          const Holiday(dayOfWeek: 1, nWeek: 3)
        ],
      ),
    );
  }

  List<Organization> orgs = <Organization>[];

  @override
  Future<void> create(Organization org) async {
    orgs.add(org);
    return;
  }

  @override
  Future<Organization> getOrganization(String id) async {
    for (final org in orgs) {
      if (org.id == id) {
        return org;
      }
    }
    throw Exception('not found organization');
  }

  @override
  Future<List<Organization>> getOrganizations(String ownerId) async {
    final List<Organization> ownedOrgs = <Organization>[];
    for (final org in orgs) {
      final int ownerIndex =
          org.owners.indexWhere((user) => user.id == ownerId);
      if (ownerIndex == -1) {
        continue;
      }
      ownedOrgs.add(org);
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

  @override
  Future<List<Holiday>> getHolidays(String id) {
    // TODO: implement getHolidays
    throw UnimplementedError();
  }
}
