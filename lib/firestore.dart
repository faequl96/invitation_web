import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore db = FirebaseFirestore.instance;

class DBCollection {
  static final invitedGuests = db.collection("INVITED_GUESTs");
  static final rsvps = db.collection("RSVPs");
}

class DBOrderBy {
  DBOrderBy({required this.field, this.descending = false});

  final String field;
  final bool descending;
}

class DBRepository {
  static Future<void> create({
    required Map<String, dynamic> request,
    required CollectionReference<Map<String, dynamic>> collectionRef,
  }) async {
    final Completer<void> completer = Completer();

    collectionRef.doc().set(request).then((_) {
      completer.complete();
    }, onError: (e) {
      completer.complete();
    });

    return await completer.future;
  }

  static Future<void> update({
    required Map<String, dynamic> request,
    required CollectionReference<Map<String, dynamic>> collectionRef,
    required String documentId,
  }) async {
    final Completer<void> completer = Completer();

    collectionRef.doc(documentId).set(request).then((_) {
      completer.complete();
    }, onError: (e) {
      completer.complete();
    });

    return await completer.future;
  }

  static Future<List<Map<String, dynamic>>?> getAll({
    required CollectionReference<Map<String, dynamic>> collectionRef,
    DBOrderBy? orderBy,
  }) async {
    final Completer<List<Map<String, dynamic>>?> completer = Completer();

    if (orderBy != null) {
      final collectionRefOrderedBy = collectionRef.orderBy(
        orderBy.field,
        descending: orderBy.descending,
      );
      collectionRefOrderedBy.get().then((querySnapshot) {
        if (querySnapshot.docs.isNotEmpty) {
          List<Map<String, dynamic>> docs = [];
          for (var docSnapshot in querySnapshot.docs) {
            docs.add({"id": docSnapshot.id, "data": docSnapshot.data()});
          }
          completer.complete(docs);
        } else {
          completer.complete();
        }
      }, onError: (e) {
        completer.complete();
      });
    } else {
      collectionRef.get().then((querySnapshot) {
        if (querySnapshot.docs.isNotEmpty) {
          List<Map<String, dynamic>> docs = [];
          for (var docSnapshot in querySnapshot.docs) {
            docs.add({"id": docSnapshot.id, "data": docSnapshot.data()});
          }
          completer.complete(docs);
        } else {
          completer.complete();
        }
      }, onError: (e) {
        completer.complete();
      });
    }

    return await completer.future;
  }

  static Future<Map<String, dynamic>?> getOne({
    required CollectionReference<Map<String, dynamic>> collectionRef,
    required String documentId,
  }) async {
    final Completer<Map<String, dynamic>?> completer = Completer();

    collectionRef.doc(documentId).get().then((docSnapshot) {
      if (docSnapshot.data() != null) {
        completer.complete({
          "id": docSnapshot.id,
          "data": docSnapshot.data(),
        });
      } else {
        completer.complete();
      }
    }, onError: (e) {
      completer.complete();
    });

    return await completer.future;
  }

  static Future<Map<String, dynamic>?> getSome({
    required Query<Map<String, dynamic>> queryRef,
    DBOrderBy? orderBy,
  }) async {
    final Completer<Map<String, dynamic>?> completer = Completer();

    if (orderBy != null) {
      final queryRefOrderedBy = queryRef.orderBy(
        orderBy.field,
        descending: orderBy.descending,
      );
      queryRefOrderedBy.get().then((querySnapshot) {
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
    } else {
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
    }

    return await completer.future;
  }
}
