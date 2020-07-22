import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import 'package:shiftend/models/shift/shift.dart';
import 'package:shiftend/repositories/interfaces/shift_repository_interface.dart';

class ShiftRepository extends ShiftRepositoryInterface {
  ShiftRepository({@required this.firestore, @required this.collectionName})
      : assert(firestore != null),
        assert(collectionName == SHIFTS_COLLECTION ||
            collectionName == SHIFTS_REQUEST_COLLECTION);

  final Firestore firestore;
  final String orgCollectionName = 'organizations';
  final String collectionName;

  static const String SHIFTS_COLLECTION = 'shifts';
  static const String SHIFTS_REQUEST_COLLECTION = 'shift-requests';

  final DateFormat formatter = DateFormat('yyyy-MM');

  @override
  Future<void> create(String orgId, Shift shift) async {
    final shiftRef = await _getShiftRef(orgId, shift.start, shift.userId);
    await shiftRef.setData(shift.toJson());
  }

  @override
  Future<void> delete(String orgId, DateTime day, String userId) async {
    final shiftRef = await _getShiftRef(orgId, day, userId);
    await shiftRef.delete();
  }

  @override
  Future<Map<DateTime, List<Shift>>> getShifts(
      String orgId, DateTime month) async {
    final shiftsRef = await _getShiftsRef(orgId, month);
    final Map<DateTime, List<Shift>> shifts = <DateTime, List<Shift>>{};
    final DateTime count = DateTime(month.year, month.month, 1);
    for (int i = 1; i < 32; i++) {
      final list = await shiftsRef.collection(i.toString()).getDocuments().then(
          (thisMonthShift) => thisMonthShift.documents
              .map((s) => Shift.fromJson(s.data))
              .toList());
      if (list.isNotEmpty) {
        shifts[DateTime(month.year, month.month, i)] = list;
      }
      count.add(const Duration(days: 1));
      if (count.month != month.month) {
        break;
      }
    }
    return shifts;
  }

  @override
  Future<void> update(String orgId, Shift shift) async {
    final shiftRef = await _getShiftRef(orgId, shift.start, shift.userId);
    await shiftRef.updateData(shift.toJson());
  }

  Future<DocumentReference> _getShiftsRef(String orgId, DateTime day) async {
    final year = day.year;
    final month = day.month;
    final ym = DateTime(year, month);
    final ym_str = formatter.format(ym);
    return firestore
        .collection(orgCollectionName)
        .document(orgId)
        .collection(collectionName)
        .document(ym_str);
  }

  Future<DocumentReference> _getShiftRef(
      String orgId, DateTime day, String userId) async {
    return (await _getShiftsRef(orgId, day))
        .collection(day.day.toString())
        .document(userId);
  }
}
