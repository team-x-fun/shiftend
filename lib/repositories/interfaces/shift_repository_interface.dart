import 'package:shiftend/models/models.dart';

abstract class ShiftRepositoryInterface {
  Future<void> create(String orgId, Shift shift);
  Future<void> update(String orgId, Shift shift);
  Future<Map<int, List<Shift>>> getShifts(String orgId, DateTime month);
  Future<void> delete(String orgId, DateTime day, String userId);
}
