import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import 'package:shiftend/models/shift/shift.dart';
import 'package:shiftend/repositories/interfaces/shift_repository_interface.dart';
import 'package:shiftend/repositories/interfaces/user_repository_interface.dart';

class ShiftRepository extends ShiftRepositoryInterface {
  ShiftRepository({@required this.firestore, @required this.userRepo})
      : assert(firestore != null),
        assert(userRepo != null);

  final FirebaseFirestore firestore;
  final UserRepositoryInterface userRepo;
  static const String collectionName = 'organizations';
  static const String shiftsCollectionName = 'shifts';

  final DateFormat formatter = DateFormat('yyyy-MM');

  @override
  Future<void> create(String orgId, Shift shift) async {
    final DocumentReference shiftRef =
        await _getShiftRef(orgId, shift.start, shift.member.user.id);

    await shiftRef.set(await _toJson(shift));
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
    final Map<DateTime, Future<List<Future<Shift>>>> futureMaps =
        <DateTime, Future<List<Future<Shift>>>>{};
    for (int i = 1; i < 32; i++) {
      futureMaps[DateTime(month.year, month.month, i)] = shiftsRef
          .collection(i.toString())
          .get()
          .then<List<Future<Shift>>>((thisMonthShift) =>
              thisMonthShift.docs.map((s) => _fromJson(s.data())).toList());
      count.add(const Duration(days: 1));
      if (count.month != month.month) {
        break;
      }
    }
    for (final DateTime date in futureMaps.keys) {
      final List<Future<Shift>> list = await futureMaps[date];
      if (list.isNotEmpty) {
        shifts[date] = await Future.wait(list);
      }
    }
    return shifts;
  }

  @override
  Future<void> update(String orgId, Shift shift) async {
    final DocumentReference shiftRef =
        await _getShiftRef(orgId, shift.start, shift.member.user.id);
    await shiftRef.update(await _toJson(shift));
  }

  Future<DocumentReference> _getShiftsRef(String orgId, DateTime day) async {
    final year = day.year;
    final month = day.month;
    final ym = DateTime(year, month);
    final ym_str = formatter.format(ym);
    return firestore
        .collection(collectionName)
        .doc(orgId)
        .collection(shiftsCollectionName)
        .doc(ym_str);
  }

  Future<DocumentReference> _getShiftRef(
      String orgId, DateTime day, String userId) async {
    return (await _getShiftsRef(orgId, day))
        .collection(day.day.toString())
        .doc(userId);
  }

  Future<Map<String, dynamic>> _toJson(Shift shift) async {
    final Map<String, dynamic> json = shift.toJson()..remove('userRef');
    json['userRef'] = await userRepo.getUserRef(shift.member.user.id);
    return json;
  }

  Future<Shift> _fromJson(Map<String, dynamic> rawJson) async {
    final Map<String, dynamic> json = <String, dynamic>{...rawJson}
      ..remove('userRef');
    final Shift shift = Shift.fromJson(json);
    return shift.copyWith(
      member: shift.member.copyWith(
        user: await userRepo
            .fromUserRef(rawJson['members']['userRef'] as DocumentReference),
      ),
    );
  }
}
