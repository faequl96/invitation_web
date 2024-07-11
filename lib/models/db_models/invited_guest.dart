class InvitedGuest {
  InvitedGuest({
    this.id = "",
    required this.name,
    required this.instance,
    required this.nameInstance,
    required this.nickName,
  });

  final String id;
  final String name;
  final String instance;
  final String nameInstance;
  final String nickName;

  factory InvitedGuest.fromJson(Map<String, dynamic> json) {
    return _$InvitedGuestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$InvitedGuestToJson(this);

  InvitedGuest copyWith({
    String? name,
    String? instance,
    String? nameInstance,
    String? nickName,
  }) {
    return _$InvitedGuestCopyWith(
      this,
      name: name,
      instance: instance,
      nameInstance: nameInstance,
      nickName: nickName,
    );
  }
}

InvitedGuest _$InvitedGuestFromJson(Map<String, dynamic> json) {
  return InvitedGuest(
    id: json['id'] as String,
    name: json['data']['name'] as String,
    instance: json['data']['instance'] as String,
    nameInstance: json['data']['nameInstance'] as String,
    nickName: json['data']['nickName'] as String,
  );
}

Map<String, dynamic> _$InvitedGuestToJson(InvitedGuest invitedGuests) {
  return <String, dynamic>{
    "name": invitedGuests.name,
    "instance": invitedGuests.instance,
    "nameInstance": invitedGuests.nameInstance,
    "nickName": invitedGuests.nickName,
  };
}

InvitedGuest _$InvitedGuestCopyWith(
  InvitedGuest invitedGuests, {
  String? name,
  String? instance,
  String? nameInstance,
  String? nickName,
}) {
  return InvitedGuest(
    name: name ?? invitedGuests.name,
    instance: instance ?? invitedGuests.instance,
    nameInstance: nameInstance ?? invitedGuests.nameInstance,
    nickName: nickName ?? invitedGuests.nickName,
  );
}
