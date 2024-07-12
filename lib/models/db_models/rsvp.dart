import 'package:invitation_web/enum/enums.dart';

class RSVP {
  RSVP.message({
    this.id = "",
    required this.invitedGuestsId,
    required this.remark,
    required this.invited,
    required this.attendance,
    required this.avatar,
    required this.dateTime,
    this.guestName = "",
  }) : type = RSVPType.Message;

  RSVP.comment({
    this.id = "",
    required this.invitedGuestsId,
    required this.remark,
    required this.dateTime,
    this.guestName = "",
  }) : type = RSVPType.Comment;

  final RSVPType type;
  final String id;
  final String invitedGuestsId;
  final String remark;
  late final bool invited;
  late final bool attendance;
  late final String avatar;
  final int dateTime;
  final String guestName;

  factory RSVP.fromJson(RSVPType type, Map<String, dynamic> json) {
    return _$RSVPFromJson(type, json);
  }

  Map<String, dynamic> toJson() => _$RSVPToJson(type, this);

  RSVP copyWith({
    String? invitedGuestsId,
    String? remark,
    bool? invited,
    bool? attendance,
    String? avatar,
    int? dateTime,
    String? guestName,
  }) {
    return _$RSVPCopyWith(
      type,
      this,
      invitedGuestsId: invitedGuestsId,
      remark: remark,
      invited: invited,
      attendance: attendance,
      avatar: avatar,
      dateTime: dateTime,
      guestName: guestName,
    );
  }
}

RSVP _$RSVPFromJson(RSVPType type, Map<String, dynamic> json) {
  Map<RSVPType, RSVP> rsvpMap = {
    RSVPType.Message: RSVP.message(
      id: json['id'] as String,
      invitedGuestsId: json['invitedGuestsId'] as String,
      remark: json['data']['remark'] as String,
      invited: json['data']['invited'] as bool,
      attendance: json['data']['attendance'] as bool,
      avatar: json['data']['avatar'] as String,
      dateTime: json['data']['dateTime'] as int,
      guestName: json['data']['guestName'] as String,
    ),
    RSVPType.Comment: RSVP.comment(
      id: json['id'] as String,
      invitedGuestsId: json['invitedGuestsId'] as String,
      remark: json['data']['remark'] as String,
      dateTime: json['data']['dateTime'] as int,
      guestName: json['data']['guestName'] as String,
    ),
  };
  return rsvpMap[type]!;
}

Map<String, dynamic> _$RSVPToJson(RSVPType type, RSVP rsvp) {
  Map<RSVPType, Map<String, dynamic>> rsvpMap = {
    RSVPType.Message: <String, dynamic>{
      "invitedGuestsId": rsvp.invitedGuestsId,
      "remark": rsvp.remark,
      "invited": rsvp.invited,
      "attendance": rsvp.attendance,
      "avatar": rsvp.avatar,
      "dateTime": rsvp.dateTime,
      "guestName": rsvp.guestName,
    },
    RSVPType.Comment: <String, dynamic>{
      "invitedGuestsId": rsvp.invitedGuestsId,
      "remark": rsvp.remark,
      "dateTime": rsvp.dateTime,
      "guestName": rsvp.guestName,
    },
  };

  return rsvpMap[type]!;
}

RSVP _$RSVPCopyWith(
  RSVPType type,
  RSVP rsvp, {
  String? invitedGuestsId,
  String? remark,
  bool? attendance,
  bool? invited,
  String? avatar,
  int? dateTime,
  String? guestName,
}) {
  Map<RSVPType, RSVP> rsvpMap = {
    RSVPType.Message: RSVP.message(
      invitedGuestsId: invitedGuestsId ?? rsvp.invitedGuestsId,
      remark: remark ?? rsvp.remark,
      invited: invited ?? rsvp.invited,
      attendance: attendance ?? rsvp.attendance,
      avatar: avatar ?? rsvp.avatar,
      dateTime: dateTime ?? rsvp.dateTime,
      guestName: guestName ?? rsvp.guestName,
    ),
    RSVPType.Comment: RSVP.comment(
      invitedGuestsId: invitedGuestsId ?? rsvp.invitedGuestsId,
      remark: remark ?? rsvp.remark,
      dateTime: dateTime ?? rsvp.dateTime,
      guestName: guestName ?? rsvp.guestName,
    ),
  };

  return rsvpMap[type]!;
}
