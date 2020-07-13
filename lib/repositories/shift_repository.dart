import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import 'package:shiftend/models/shift/shift.dart';
import 'package:shiftend/repositories/interfaces/shift_repository_interface.dart';

class ShiftRepository extends ShiftRepositoryInterface {
  ShiftRepository({@required this.firestore}) : assert(firestore != null);

  final Firestore firestore;
  static const String collectionName = 'organizations';
  static const String shiftsCollectionName = 'shifts';

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
  Future<Map<int, List<Shift>>> getShifts(String orgId, DateTime month) async {
    final shiftsRef = await _getShiftsRef(orgId, month);
    final Map<int, List<Shift>> shifts = <int, List<Shift>>{};
    final DateTime count = DateTime(month.year, month.month, 1);
    for (int i = 1; i < 32; i++) {
      final list = await shiftsRef.collection(i.toString()).getDocuments().then(
          (thisMonthShift) => thisMonthShift.documents
              .map((s) => Shift.fromJson(s.data))
              .toList());
      if (list.isNotEmpty) {
        shifts[i] = list;
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
        .collection(collectionName)
        .document(orgId)
        .collection(shiftsCollectionName)
        .document(ym_str);
  }

  Future<DocumentReference> _getShiftRef(
      String orgId, DateTime day, String userId) async {
    final d = day.day;
    return (await _getShiftsRef(orgId, day))
        .collection(d.toString())
        .document(userId);
  }
}
