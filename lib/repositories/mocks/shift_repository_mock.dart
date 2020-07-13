import 'package:shiftend/models/shift/shift.dart';
import 'package:shiftend/repositories/interfaces/shift_repository_interface.dart';

class ShiftRepositoryMock extends ShiftRepositoryInterface {
  // shifts[orgId][2020年7月][1] = shift_list
  Map<String, Map<DateTime, Map<int, List<Shift>>>> shifts = {
    'ten': {
      DateTime(2020, 7): {
        3: <Shift>[
          Shift(
              userId: '0',
              start: DateTime.parse('2020-07-03 17:00'),
              end: DateTime.parse('2020-07-03 22:30')),
          Shift(
              userId: '1',
              start: DateTime.parse('2020-07-03 17:00'),
              end: DateTime.parse('2020-07-04 2:00')),
        ],
        10: <Shift>[
          Shift(
              userId: '0',
              start: DateTime.parse('2020-07-10 17:00'),
              end: DateTime.parse('2020-07-10 22:30')),
          Shift(
              userId: '1',
              start: DateTime.parse('2020-07-10 17:00'),
              end: DateTime.parse('2020-07-11 2:00')),
        ],
        20: <Shift>[
          Shift(
              userId: '0',
              start: DateTime.parse('2020-07-20 17:00'),
              end: DateTime.parse('2020-07-20 22:30')),
          Shift(
              userId: '1',
              start: DateTime.parse('2020-07-20 17:00'),
              end: DateTime.parse('2020-07-21 2:00')),
          Shift(
              userId: '2',
              start: DateTime.parse('2020-07-20 18:00'),
              end: DateTime.parse('2020-07-21 0:00')),
        ],
        22: <Shift>[
          Shift(
              userId: '0',
              start: DateTime.parse('2020-07-22 17:00'),
              end: DateTime.parse('2020-07-22 22:30')),
          Shift(
              userId: '1',
              start: DateTime.parse('2020-07-22 17:00'),
              end: DateTime.parse('2020-07-23 2:00')),
        ],
      }
    }
  };
  @override
  Future<void> create(String orgId, Shift shift) async {
    final year = shift.start.year;
    final month = shift.start.month;
    final day = shift.start.day;
    final ym = DateTime(year, month);
    final shiftList = shifts[orgId][ym][day];
    bool isExist = false;
    shiftList.forEach((s) {
      if (s.userId == shift.userId) {
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
    shifts[orgId][ym][d].removeWhere((s) => s.userId == userId);
  }

  @override
  Future<Map<int, List<Shift>>> getShifts(String orgId, DateTime month) async {
    final ym = DateTime(month.year, month.month);
    return shifts[orgId][ym];
  }

  @override
  Future<void> update(String orgId, Shift shift) async {
    await delete(orgId, shift.start, shift.userId);
    await create(orgId, shift);
  }
}
