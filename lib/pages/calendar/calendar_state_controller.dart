import 'package:intl/intl.dart';
import 'package:shiftend/models/models.dart';
import 'package:shiftend/models/notifier_state.dart';
import 'package:shiftend/pages/calendar/calendar_state.dart';
import 'package:shiftend/pages/login/login_state.dart';
import 'package:shiftend/repositories/interfaces/interfaces.dart';
import 'package:shiftend/util/logger.dart';
import 'package:state_notifier/state_notifier.dart';

class CalendarStateController extends StateNotifier<CalendarState>
    with LocatorMixin {
  CalendarStateController() : super(const CalendarState());

  ShiftRepositoryInterface get shiftRepository =>
      read<ShiftRepositoryInterface>();

  ShiftRequestRepositoryInterface get shiftRequestRepository =>
      read<ShiftRequestRepositoryInterface>();

  UserRepositoryInterface get userRepository => read<UserRepositoryInterface>();

  LoginState get loginState => read<LoginState>();

  final _dateFormatter = DateFormat('yyyy-MM-dd');

  @override
  void initState() {
    logger.info('CalenderStateController.initState');
    super.initState();
    fetchShiftsInitial(DateTime.now());
    state = state.copyWith(selectedDate: DateTime.now());
  }

  // 初回のみ現在日時の月シフトを取得
  Future<void> fetchShiftsInitial(DateTime date) async {
    logger.info('fetchShiftsInitial');
    state = state.copyWith(notifierState: NotifierState.loading);
    if (loginState.selectedOrg == null) {
      state = state.copyWith(notifierState: NotifierState.loaded);
      return;
    }
    logger.info(
        'fetchShiftsInitial: selectedOrg.id = ${loginState.selectedOrg.id}');
    final shifts =
        await shiftRepository.getShifts(loginState.selectedOrg.id, date);

    final requestShifts =
        await shiftRequestRepository.getShifts(loginState.selectedOrg.id, date);
    final formattedNow = _dateFormatter.format(state.selectedDate);
    state = state.copyWith(
        shifts: shifts,
        requestedShifts: requestShifts,
        notifierState: NotifierState.loaded);
    if (shifts[formattedNow] != null) {
      // 起動時，formattedNow(今日の日付)にshiftが存在しなかった場合, nullでエラーになるため回避
      state = state.copyWith(
          selectedShifts: shifts[formattedNow],
          selectedRequestedShifts: requestShifts[formattedNow]);
    }
  }

  // カレンダーで月を変えるごとに月ごとのデータを取得する
  Future<void> fetchShiftsOfMonth(DateTime date) async {
    if (loginState.selectedOrg == null) {
      return;
    }
    final shifts =
        await shiftRepository.getShifts(loginState.selectedOrg.id, date);
    final requestShifts =
        await shiftRequestRepository.getShifts(loginState.selectedOrg.id, date);

    logger.info(
        'fetchShiftsOfMonth: selectedOrg.id = ${loginState.selectedOrg.id}');
    state = state.copyWith(shifts: shifts, requestedShifts: requestShifts);
    logger.info(shifts);
  }

  // 日付が選択されたときに下半分のシフトリストのデータを更新
  void onDaySelected(
      DateTime date, List<Shift> shifts, List<Shift> requestedShifts) {
    state = state.copyWith(selectedDate: date);
    state = state.copyWith(
        selectedShifts: shifts, selectedRequestedShifts: requestedShifts);
  }

  Future<void> fetchLoggedinUserRequestedShifts(DateTime date) async {
    if (loginState.selectedOrg == null) {
      return;
    }
    final requestedShifts =
        await shiftRequestRepository.getShifts(loginState.selectedOrg.id, date);
    final currentUser = await userRepository.getCurrentUser();
    final today = DateTime(date.year, date.month, date.day);
    if (requestedShifts[today] == null) {
      state = state.copyWith(loggedinUserRequestedShifts: <Shift>[]);
    } else {
      state = state.copyWith(
          loggedinUserRequestedShifts: requestedShifts[today]
              .where((shift) => shift.member.user.id == currentUser.id)
              .toList());
    }
  }
}
