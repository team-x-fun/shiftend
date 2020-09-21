import 'package:intl/intl.dart';
import 'package:shiftend/models/models.dart';
import 'package:shiftend/models/notifier_state.dart';
import 'package:shiftend/pages/calendar/calendar_state.dart';
import 'package:shiftend/repositories/mocks/shift_repository_mock.dart';
import 'package:shiftend/repositories/shift_request_repository.dart';
import 'package:shiftend/repositories/shift_repository.dart';
import 'package:shiftend/repositories/user_repository.dart';
import 'package:state_notifier/state_notifier.dart';

class CalendarStateController extends StateNotifier<CalendarState>
    with LocatorMixin {
  CalendarStateController() : super(const CalendarState());

  ShiftRepository get shiftRepository => read<ShiftRepository>();

  ShiftRepositoryMock get shiftRepositoryMock => read<ShiftRepositoryMock>();

  ShiftRequestRepository get shiftRequestRepository =>
      read<ShiftRequestRepository>();

  UserRepository get userRepository => read<UserRepository>();

  final _dateFormatter = DateFormat('yyyy-MM-dd');

  @override
  void initState() {
    super.initState();
    fetchShiftsInitial(DateTime.now());
    state = state.copyWith(selectedDate: DateTime.now());
  }

  // 初回のみ現在日時の月シフトを取得
  Future<void> fetchShiftsInitial(DateTime date) async {
    state = state.copyWith(notifierState: NotifierState.loading);

    final shifts = await shiftRepository.getShifts('refOrg', date);
    final formattedNow = _dateFormatter.format(state.selectedDate);
    state = state.copyWith(shifts: shifts, notifierState: NotifierState.loaded);
    state = state.copyWith(selectedShifts: shifts[formattedNow]);
  }

  // カレンダーで月を変えるごとに月ごとのデータを取得する
  Future<void> fetchShiftsOfMonth(DateTime date) async {
    // TODO: getShiftsのorgIdは今後動的に変えられるようにする．今は固定
    final shifts = await shiftRepository.getShifts('refOrg', date);
    state = state.copyWith(shifts: shifts);
    print(shifts);
  }

  // 日付が選択されたときに下半分のシフトリストのデータを更新
  void onDaySelected(DateTime date, List<Shift> shifts) {
    state = state.copyWith(selectedDate: date);
    state = state.copyWith(selectedShifts: shifts);
  }

  Future<void> fetchLoggedinUserRequestedShifts(DateTime date) async {
    final requestedShifts =
        await shiftRequestRepository.getShifts('refOrg', date);
    final currentUser = await userRepository.getCurrentUser();
    state = state.copyWith(
        loggedinUserRequestedShifts:
            requestedShifts[DateTime(date.year, date.month, date.day)]
                .where((shift) => shift.user.id == currentUser.id)
                .toList());
  }
}
