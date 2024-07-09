import 'package:cloud_firestore/cloud_firestore.dart';

class RSVP {
  RSVP({
    required this.name,
    required this.remark,
    required this.attendance,
    required this.dateTime,
  });

  final String name;
  final String remark;
  final bool attendance;
  final int dateTime;

  factory RSVP.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data() ?? {};
    return RSVP(
      name: data['name'] ?? "",
      remark: data['remark'] ?? "",
      attendance: data['attendance'] ?? true,
      dateTime: data["dateTime"] ?? 0,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      "name": name,
      "remark": remark,
      "attendance": attendance,
      "dateTime": dateTime,
    };
  }
}
