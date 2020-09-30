import 'dart:math';

import 'package:shiftend/debug_views/globals.dart';
import 'package:shiftend/models/models.dart';
import 'package:shiftend/util/logger.dart';

class TestData {
  final owners = <User>[];
  final members = <User>[];
  final org = const Organization(
    id: 'imple_basic_personnel',
    defaultHolidays: <Holiday>[
      Holiday(dayOfWeek: 0, nWeek: 0), // 毎週日曜日
      Holiday(dayOfWeek: 1, nWeek: 1), // 第1月曜日
      Holiday(dayOfWeek: 1, nWeek: 3), // 第3月曜日
    ],
    owners: <User>[],
    members: <User>[],
    defaultPersonnel: Personnel(
      number: 2,
      totalLevel: 4,
    ),
  );
  final requests = <Shift>[];
  final shifts = <Shift>[];
  Future insert() async {
    logger.info('makeUserList');
    await makeUserList();
    // orgがなければ作成する
    logger..info('make org');
    final tmp = await orgRepo.getOrganization(org.id);
    logger.info('tmp = ${tmp.toString()}');
    if (tmp?.id == null) {
      await orgRepo.create(org.copyWith(owners: owners, members: members));
    }
    logger.info('makeShiftRequest()');
    await makeShiftRequest();
    logger.info('makeShift()');
    await makeShift();
  }

  Future makeUserList() async {
    owners.add(await userRepo.findByEmail('owner@example.com'));
    members
      ..add(await userRepo.findByEmail('owner@example.com'))
      ..add(await userRepo.findByEmail('member1@example.com'))
      ..add(await userRepo.findByEmail('member2@example.com'))
      ..add(await userRepo.findByEmail('member3@example.com'));
    return;
  }

  Future makeShiftRequest() async {
    final year = DateTime.now().year;
    final month = DateTime.now().month;
    final owner =
        members.firstWhere((user) => user.email == 'owner@example.com');
    final member1 =
        members.firstWhere((user) => user.email == 'member1@example.com');
    final member2 =
        members.firstWhere((user) => user.email == 'member2@example.com');
    final member3 =
        members.firstWhere((user) => user.email == 'member3@example.com');
    final random = Random();
    for (DateTime day = DateTime(year, month, 1);
        day.month == month;
        day = day.add(const Duration(days: 1))) {
      logger.info(day);
      // 休みをスキップ
      if (day.weekday == DateTime.sunday) {
        continue;
      }
      if (day.weekday == DateTime.monday) {
        if (day.day / 7 <= 1 || (day.day / 7 > 2 && day.day / 7 <= 3)) {
          continue;
        }
      }
      // ownerは確定演出
      requests.add(
        Shift(
          user: owner,
          start: DateTime(year, month, day.day, 17),
          end: DateTime(year, month, day.day + 1, 3),
        ),
      );
      if (random.nextInt(2) == 0) {
        // 50 %の確率でmember1
        requests.add(
          Shift(
            user: member1,
            start: DateTime(year, month, day.day, 17),
            end: DateTime(year, month, day.day + 1, 3),
          ),
        );
      }
      if (random.nextInt(2) == 0) {
        // 50 %の確率でmember2
        requests.add(
          Shift(
            user: member2,
            start: DateTime(year, month, day.day, 17),
            end: DateTime(year, month, day.day + 1, 3),
          ),
        );
      }
      if (random.nextInt(2) == 0) {
        // 50 %の確率でmember3
        requests.add(
          Shift(
            user: member3,
            start: DateTime(year, month, day.day, 17),
            end: DateTime(year, month, day.day + 1, 3),
          ),
        );
      }
    }
    final futurelist = <Future<void>>[];
    requests.forEach((request) {
      futurelist.add(shiftReqRepo.create(org.id, request));
    });
    await Future.wait(futurelist);
    return;
  }

  Future makeShift() async {
    final year = DateTime.now().year;
    final month = DateTime.now().month;
    final owner =
        members.firstWhere((user) => user.email == 'owner@example.com');
    for (DateTime day = DateTime(year, month, 1);
        day.month == month;
        day = day.add(const Duration(days: 1))) {
      logger.info(day);
      //オーナー確定
      final ownerShift = requests.firstWhere(
        (req) => req.start.day == day.day && req.user.id == owner.id,
        orElse: () {
          return null;
        },
      );
      if (ownerShift != null) {
        shifts.add(ownerShift);
      }
      //オーナー以外のリクエスト抽出
      final dayReq = requests.firstWhere(
        (req) =>
            req.start.day == day.day && req.user.email != 'owner@example.com',
        orElse: () {
          return null;
        },
      );
      if (dayReq != null) {
        shifts.add(dayReq);
      }
    }
    final futureList = <Future<void>>[];
    shifts.forEach((shift) {
      futureList.add(shiftRepo.create(org.id, shift));
    });
    await Future.wait(futureList);
  }
}
