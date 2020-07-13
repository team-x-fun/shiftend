import 'package:intl/intl.dart';
import 'package:shiftend/models/models.dart';
import 'package:shiftend/pages/calendar/calendar_state.dart';
import 'package:state_notifier/state_notifier.dart';

class CalendarStateController extends StateNotifier<CalendarState>
    with LocatorMixin {
  CalendarStateController() : super(const CalendarState());

  @override
  void initState() {
    super.initState();
    final Map<DateTime, List<User>> _dummyAttendees = {
      DateTime.parse('2020-07-10'): [
        const User(
            id: '0',
            email: '',
            name: '未来太郎',
            role: 'バイトリーダー',
            level: '50',
            iconUrl: ''),
        const User(
            id: '1',
            email: '',
            name: '未来花子',
            role: '',
            level: '50',
            iconUrl: ''),
      ],
      DateTime.parse('2020-07-20'): [
        const User(
            id: '0',
            email: '',
            name: '未来太郎',
            role: 'バイトリーダー',
            level: '50',
            iconUrl: ''),
        const User(
            id: '1',
            email: '',
            name: '未来花子',
            role: '',
            level: '50',
            iconUrl: ''),
        const User(
            id: '2',
            email: '',
            name: '未来次郎',
            role: '',
            level: '50',
            iconUrl: ''),
      ],
      DateTime.parse('2020-07-22'): [
        const User(
            id: '0',
            email: '',
            name: '未来太郎',
            role: 'バイトリーダー',
            level: '50',
            iconUrl: ''),
        const User(
            id: '1',
            email: '',
            name: '未来花子',
            role: '',
            level: '50',
            iconUrl: ''),
      ],
    };
    state = state.copyWith(attendees: _dummyAttendees);
    state = state.copyWith(selectedDate: DateTime.now());
    final _dateFormatter = DateFormat('yyyy-MM-dd');
    final _formattedNow = _dateFormatter.format(state.selectedDate);
    state = state.copyWith(
        selectedAttendees: state.attendees[DateTime.parse(_formattedNow)]);
  }

  void onDaySelected(DateTime day, List<User> attendees) {
    state = state.copyWith(selectedDate: day);
    state = state.copyWith(selectedAttendees: attendees);
  }
}
