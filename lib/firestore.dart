import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore db = FirebaseFirestore.instance;
final CollectionReference rsvps = db.collection("RSVPs");
