class RSVP {
  RSVP({
    this.id = "",
    required this.invitedGuestsId,
    required this.remark,
    required this.attendance,
    required this.dateTime,
    this.guestName = "",
  });

  final String id;
  final String invitedGuestsId;
  final String remark;
  final bool attendance;
  final int dateTime;
  final String guestName;

  factory RSVP.fromJson(Map<String, dynamic> json) => _$RSVPFromJson(json);

  Map<String, dynamic> toJson() => _$RSVPToJson(this);

  RSVP copyWith({
    String? invitedGuestsId,
    String? remark,
    bool? attendance,
    int? dateTime,
    String? guestName,
  }) {
    return _$RSVPCopyWith(
      this,
      invitedGuestsId: invitedGuestsId,
      remark: remark,
      attendance: attendance,
      dateTime: dateTime,
      guestName: guestName,
    );
  }
}

RSVP _$RSVPFromJson(Map<String, dynamic> json) {
  return RSVP(
    id: json['id'] as String,
    invitedGuestsId: json['invitedGuestsId'] as String,
    remark: json['data']['remark'] as String,
    attendance: json['data']['attendance'] as bool,
    dateTime: json['data']['dateTime'] as int,
    guestName: json['data']['guestName'] as String,
  );
}

Map<String, dynamic> _$RSVPToJson(RSVP rsvp) {
  return <String, dynamic>{
    "invitedGuestsId": rsvp.invitedGuestsId,
    "remark": rsvp.remark,
    "attendance": rsvp.attendance,
    "dateTime": rsvp.dateTime,
    "guestName": rsvp.guestName,
  };
}

RSVP _$RSVPCopyWith(
  RSVP rsvp, {
  String? invitedGuestsId,
  String? remark,
  bool? attendance,
  int? dateTime,
  String? guestName,
}) {
  return RSVP(
    invitedGuestsId: invitedGuestsId ?? rsvp.invitedGuestsId,
    remark: remark ?? rsvp.remark,
    attendance: attendance ?? rsvp.attendance,
    dateTime: dateTime ?? rsvp.dateTime,
    guestName: guestName ?? rsvp.guestName,
  );
}
