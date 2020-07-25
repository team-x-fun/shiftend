import 'package:flutter/material.dart';
import 'package:shiftend/models/shift/shift.dart';
import 'package:shiftend/repositories/interfaces/shift_repository_interface.dart';

import 'user_repository_mock.dart';

class ShiftRepositoryMock extends ShiftRepositoryInterface {
  ShiftRepositoryMock({@required this.userRepo}) : assert(userRepo != null) {
    shifts = {
      'ten': {
        DateTime(2020, 7): {
          DateTime(2020, 7, 3): <Shift>[
            Shift(
                user: userRepo.users.singleWhere((user) => user.id == '0'),
                start: DateTime.parse('2020-07-03 17:00'),
                end: DateTime.parse('2020-07-03 22:30')),
            Shift(
                user: userRepo.users.singleWhere((user) => user.id == '1'),
                start: DateTime.parse('2020-07-03 17:00'),
                end: DateTime.parse('2020-07-04 02:00')),
          ],
          DateTime(2020, 7, 10): <Shift>[
            Shift(
                user: userRepo.users.singleWhere((user) => user.id == '0'),
                start: DateTime.parse('2020-07-10 17:00'),
                end: DateTime.parse('2020-07-10 22:30')),
            Shift(
                user: userRepo.users.singleWhere((user) => user.id == '1'),
                start: DateTime.parse('2020-07-10 17:00'),
                end: DateTime.parse('2020-07-11 02:00')),
          ],
          DateTime(2020, 7, 20): <Shift>[
            Shift(
                user: userRepo.users.singleWhere((user) => user.id == '0'),
                start: DateTime.parse('2020-07-20 17:00'),
                end: DateTime.parse('2020-07-20 22:30')),
            Shift(
                user: userRepo.users.singleWhere((user) => user.id == '1'),
                start: DateTime.parse('2020-07-20 17:00'),
                end: DateTime.parse('2020-07-21 02:00')),
            Shift(
                user: userRepo.users.singleWhere((user) => user.id == '2'),
                start: DateTime.parse('2020-07-20 18:00'),
                end: DateTime.parse('2020-07-21 00:00')),
          ],
          DateTime(2020, 7, 22): <Shift>[
            Shift(
                user: userRepo.users.singleWhere((user) => user.id == '0'),
                start: DateTime.parse('2020-07-22 17:00'),
                end: DateTime.parse('2020-07-22 22:30')),
            Shift(
                user: userRepo.users.singleWhere((user) => user.id == '1'),
                start: DateTime.parse('2020-07-22 17:00'),
                end: DateTime.parse('2020-07-23 02:00')),
          ],
        }
      }
    };
  }
  UserRepositoryMock userRepo;
  // shifts[orgId][2020年7月][1] = shift_list
  Map<String, Map<DateTime, Map<DateTime, List<Shift>>>> shifts;
  @override
  Future<void> create(String orgId, Shift shift) async {
    final year = shift.start.year;
    final month = shift.start.month;
    final day = shift.start.day;
    final ym = DateTime(year, month);
    final shiftList = shifts[orgId][ym][day];
    bool isExist = false;
    shiftList.forEach((s) {
      if (s.user.id == shift.user.id) {
        isExist = true;
      }
    });
    if (isExist) {
      return;
    }
    shifts[orgId][ym][day].add(shift);
  }

  @override
  Future<void> delete(String orgId, DateTime day, String userId) async {
    final year = day.year;
    final month = day.month;
    final d = day.day;
    final ym = DateTime(year, month);
    shifts[orgId][ym][d].removeWhere((s) => s.user.id == userId);
  }

  @override
  Future<Map<DateTime, List<Shift>>> getShifts(
      String orgId, DateTime month) async {
    final ym = DateTime(month.year, month.month);
    return shifts[orgId][ym];
  }

  @override
  Future<void> update(String orgId, Shift shift) async {
    await delete(orgId, shift.start, shift.user.id);
    await create(orgId, shift);
  }
}
