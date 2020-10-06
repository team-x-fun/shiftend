import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shiftend/models/models.dart';

class MemberConverter<T>
    implements JsonConverter<Member, Map<String, dynamic>> {
  const MemberConverter();

  @override
  Member fromJson(Map<String, dynamic> json) {
    if (json != null) {
      return Member.fromJson(json);
    } else {
      return null;
    }
  }

  @override
  Map<String, dynamic> toJson(Member member) => member?.toJson();
}
