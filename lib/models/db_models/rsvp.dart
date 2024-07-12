import 'package:invitation_web/enum/enums.dart';

class RSVP {
  RSVP.message({
    this.id = "",
    required this.invitedGuestId,
    this.guestName = "",
    required this.avatar,
    required this.invited,
    required this.attendance,
    required this.remark,
    required this.dateTime,
  }) : type = RSVPType.Message;

  RSVP.comment({
    this.id = "",
    required this.invitedGuestId,
    this.guestName = "",
    required this.remark,
    required this.dateTime,
  }) : type = RSVPType.Comment;

  final RSVPType type;
  final String id;
  final String invitedGuestId;
  final String guestName;
  late final String avatar;
  late final bool invited;
  late final String attendance;
  final String remark;
  final int dateTime;

  factory RSVP.fromJson(RSVPType type, Map<String, dynamic> json) {
    return _$RSVPFromJson(type, json);
  }

  Map<String, dynamic> toJson() => _$RSVPToJson(type, this);

  RSVP copyWith({
    String? invitedGuestId,
    String? guestName,
    String? avatar,
    bool? invited,
    String? attendance,
    String? remark,
    int? dateTime,
  }) {
    return _$RSVPCopyWith(
      type,
      this,
      invitedGuestId: invitedGuestId,
      guestName: guestName,
      avatar: avatar,
      invited: invited,
      attendance: attendance,
      remark: remark,
      dateTime: dateTime,
    );
  }
}

RSVP _$RSVPFromJson(RSVPType type, Map<String, dynamic> json) {
  Map<RSVPType, RSVP> rsvpMap = {
    RSVPType.Message: RSVP.message(
      id: json['id'] as String,
      invitedGuestId: json['data']['invitedGuestId'] as String,
      guestName: json['data']['guestName'] as String,
      avatar: json['data']['avatar'] as String,
      invited: json['data']['invited'] as bool,
      attendance: json['data']['attendance'] as String,
      remark: json['data']['remark'] as String,
      dateTime: json['data']['dateTime'] as int,
    ),
    RSVPType.Comment: RSVP.comment(
      id: json['id'] as String,
      invitedGuestId: json['data']['invitedGuestId'] as String,
      guestName: json['data']['guestName'] as String,
      remark: json['data']['remark'] as String,
      dateTime: json['data']['dateTime'] as int,
    ),
  };
  return rsvpMap[type]!;
}

Map<String, dynamic> _$RSVPToJson(RSVPType type, RSVP rsvp) {
  Map<RSVPType, Map<String, dynamic>> rsvpMap = {
    RSVPType.Message: <String, dynamic>{
      "invitedGuestId": rsvp.invitedGuestId,
      "guestName": rsvp.guestName,
      "avatar": rsvp.avatar,
      "invited": rsvp.invited,
      "attendance": rsvp.attendance,
      "remark": rsvp.remark,
      "dateTime": rsvp.dateTime,
    },
    RSVPType.Comment: <String, dynamic>{
      "invitedGuestId": rsvp.invitedGuestId,
      "guestName": rsvp.guestName,
      "remark": rsvp.remark,
      "dateTime": rsvp.dateTime,
    },
  };

  return rsvpMap[type]!;
}

RSVP _$RSVPCopyWith(
  RSVPType type,
  RSVP rsvp, {
  String? invitedGuestId,
  String? guestName,
  String? avatar,
  bool? invited,
  String? attendance,
  String? remark,
  int? dateTime,
}) {
  Map<RSVPType, RSVP> rsvpMap = {
    RSVPType.Message: RSVP.message(
      invitedGuestId: invitedGuestId ?? rsvp.invitedGuestId,
      guestName: guestName ?? rsvp.guestName,
      avatar: avatar ?? rsvp.avatar,
      invited: invited ?? rsvp.invited,
      attendance: attendance ?? rsvp.attendance,
      remark: remark ?? rsvp.remark,
      dateTime: dateTime ?? rsvp.dateTime,
    ),
    RSVPType.Comment: RSVP.comment(
      invitedGuestId: invitedGuestId ?? rsvp.invitedGuestId,
      guestName: guestName ?? rsvp.guestName,
      remark: remark ?? rsvp.remark,
      dateTime: dateTime ?? rsvp.dateTime,
    ),
  };

  return rsvpMap[type]!;
}
