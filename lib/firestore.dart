import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore db = FirebaseFirestore.instance;

class DBCollection {
  static final invitedGuests = db.collection("INVITED_GUESTs");
  static final rsvps = db.collection("RSVPs");
}

class DBRepository {
  static Future<void> save({
    required Map<String, dynamic> request,
    required DocumentReference<Map<String, dynamic>> docRef,
  }) async {
    final Completer<void> completer = Completer();
    docRef.set(request).then((_) => completer.complete());

    return await completer.future;
  }

  static void get({
    required DocumentReference<Map<String, dynamic>> docRef,
  }) async {
    final docSnap = await docRef.get();
    final data = docSnap.data();
    print(inspect(data));
  }

  static Future<Map<String, dynamic>?> getSome({
    required Query<Map<String, dynamic>> queryRef,
  }) async {
    final Completer<Map<String, dynamic>?> completer = Completer();
    queryRef.get().then((querySnapshot) {
      if (querySnapshot.docs.isNotEmpty) {
        completer.complete({
          "id": querySnapshot.docs[0].id,
          "data": querySnapshot.docs[0].data()
        });
      } else {
        completer.complete();
      }
    }, onError: (e) {
      completer.complete();
    });

    return await completer.future;
  }
}
