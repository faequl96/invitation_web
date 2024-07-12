class InvitedGuest {
  InvitedGuest({
    this.id = "",
    required this.nameInstance,
    required this.name,
    required this.instance,
    this.nickName = "",
    this.avatar = "",
    this.attendance = "",
  });

  final String id;
  final String nameInstance;
  final String name;
  final String instance;
  final String nickName;
  final String avatar;
  final String attendance;

  factory InvitedGuest.fromJson(Map<String, dynamic> json) {
    return _$InvitedGuestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$InvitedGuestToJson(this);

  InvitedGuest copyWith({
    String? nameInstance,
    String? name,
    String? instance,
    String? nickName,
    String? avatar,
    String? attendance,
  }) {
    return _$InvitedGuestCopyWith(
      this,
      nameInstance: nameInstance,
      name: name,
      instance: instance,
      nickName: nickName,
      avatar: avatar,
      attendance: attendance,
    );
  }
}

InvitedGuest _$InvitedGuestFromJson(Map<String, dynamic> json) {
  return InvitedGuest(
    id: json['id'] as String,
    nameInstance: json['data']['nameInstance'] as String,
    name: json['data']['name'] as String,
    instance: json['data']['instance'] as String,
    nickName: json['data']['nickName'] as String,
    avatar: json['data']['avatar'] as String,
    attendance: json['data']['attendance'] as String,
  );
}

Map<String, dynamic> _$InvitedGuestToJson(InvitedGuest invitedGuest) {
  return <String, dynamic>{
    "nameInstance": invitedGuest.nameInstance,
    "name": invitedGuest.name,
    "instance": invitedGuest.instance,
    "nickName": invitedGuest.nickName,
    "avatar": invitedGuest.avatar,
    "attendance": invitedGuest.attendance,
  };
}

InvitedGuest _$InvitedGuestCopyWith(
  InvitedGuest invitedGuests, {
  String? nameInstance,
  String? name,
  String? instance,
  String? nickName,
  String? avatar,
  String? attendance,
}) {
  return InvitedGuest(
    nameInstance: nameInstance ?? invitedGuests.nameInstance,
    name: name ?? invitedGuests.name,
    instance: instance ?? invitedGuests.instance,
    nickName: nickName ?? invitedGuests.nickName,
    avatar: avatar ?? invitedGuests.avatar,
    attendance: attendance ?? invitedGuests.attendance,
  );
}
