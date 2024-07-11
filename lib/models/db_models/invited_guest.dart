class InvitedGuest {
  InvitedGuest({
    this.id = "",
    required this.nameInstance,
    required this.name,
    required this.instance,
    this.nickName = "",
    this.avatar = "",
    this.attendance = true,
  });

  final String id;
  final String nameInstance;
  final String name;
  final String instance;
  final String nickName;
  final String avatar;
  final bool attendance;

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
    bool? attendance,
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
    attendance: json['data']['attendance'] as bool,
  );
}

Map<String, dynamic> _$InvitedGuestToJson(InvitedGuest invitedGuests) {
  return <String, dynamic>{
    "nameInstance": invitedGuests.nameInstance,
    "name": invitedGuests.name,
    "instance": invitedGuests.instance,
    "nickName": invitedGuests.nickName,
    "avatar": invitedGuests.avatar,
    "attendance": invitedGuests.attendance,
  };
}

InvitedGuest _$InvitedGuestCopyWith(
  InvitedGuest invitedGuests, {
  String? nameInstance,
  String? name,
  String? instance,
  String? nickName,
  String? avatar,
  bool? attendance,
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
