import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore db = FirebaseFirestore.instance;

class DBCollection {
  static CollectionReference<Map<String, dynamic>> get invitedGuests {
    return db.collection("INVITED_GUESTs");
  }

  static CollectionReference<Map<String, dynamic>> get rsvps {
    return db.collection("RSVPs");
  }

  CollectionReference<Map<String, dynamic>> comments(String rsvpDocumentId) {
    return rsvps.doc(rsvpDocumentId).collection("COMMENTs");
  }
}

class DBOrderBy {
  DBOrderBy({required this.field, this.descending = false});

  final String field;
  final bool descending;
}

class DBQueryFilter {
  DBQueryFilter({this.orderBy, this.limit});

  final DBOrderBy? orderBy;
  final int? limit;
}

class DBRepository {
  static Future<void> create({
    required Map<String, dynamic> request,
    required CollectionReference<Map<String, dynamic>> collectionRef,
  }) async {
    final Completer<void> completer = Completer();

    collectionRef.doc().set(request).then((_) {
      completer.complete();
    }, onError: (_) {
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
    }, onError: (_) {
      completer.complete();
    });

    return await completer.future;
  }

  static Future<List<Map<String, dynamic>>?> getAll({
    required CollectionReference<Map<String, dynamic>> collectionRef,
    DBOrderBy? orderBy,
  }) async {
    final Completer<List<Map<String, dynamic>>?> completer = Completer();

    if (orderBy == null) {
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
      }, onError: (_) {
        completer.complete();
      });
    } else {
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
      }, onError: (_) {
        completer.complete();
      });
    }

    return await completer.future;
  }

  static Future<List<Map<String, dynamic>>?> getSome({
    required CollectionReference<Map<String, dynamic>> collectionRef,
    required DBQueryFilter queryFilter,
  }) async {
    final Completer<List<Map<String, dynamic>>?> completer = Completer();

    if (queryFilter.orderBy == null && queryFilter.limit == null) {
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
      }, onError: (_) {
        completer.complete();
      });
    } else {
      final Query<Map<String, dynamic>> collectionRefFiltered;

      if (queryFilter.orderBy != null && queryFilter.limit == null) {
        collectionRefFiltered = collectionRef.orderBy(
          queryFilter.orderBy!.field,
          descending: queryFilter.orderBy!.descending,
        );
      } else if (queryFilter.orderBy == null && queryFilter.limit != null) {
        collectionRefFiltered = collectionRef.limit(queryFilter.limit!);
      } else {
        collectionRefFiltered = collectionRef
            .orderBy(
              queryFilter.orderBy!.field,
              descending: queryFilter.orderBy!.descending,
            )
            .limit(queryFilter.limit!);
      }

      collectionRefFiltered.get().then((querySnapshot) {
        if (querySnapshot.docs.isNotEmpty) {
          List<Map<String, dynamic>> docs = [];
          for (var docSnapshot in querySnapshot.docs) {
            docs.add({"id": docSnapshot.id, "data": docSnapshot.data()});
          }
          completer.complete(docs);
        } else {
          completer.complete();
        }
      }, onError: (_) {
        completer.complete();
      });
    }

    return await completer.future;
  }

  static Future<List<Map<String, dynamic>>?> getSomeByQuery({
    required Query<Map<String, dynamic>> queryRef,
    required DBQueryFilter queryFilter,
  }) async {
    final Completer<List<Map<String, dynamic>>?> completer = Completer();

    if (queryFilter.orderBy == null && queryFilter.limit == null) {
      queryRef.get().then((querySnapshot) {
        if (querySnapshot.docs.isNotEmpty) {
          List<Map<String, dynamic>> docs = [];
          for (var docSnapshot in querySnapshot.docs) {
            docs.add({"id": docSnapshot.id, "data": docSnapshot.data()});
          }
          completer.complete(docs);
        } else {
          completer.complete();
        }
      }, onError: (_) {
        completer.complete();
      });
    } else {
      final Query<Map<String, dynamic>> queryRefFiltered;

      if (queryFilter.orderBy != null && queryFilter.limit == null) {
        queryRefFiltered = queryRef.orderBy(
          queryFilter.orderBy!.field,
          descending: queryFilter.orderBy!.descending,
        );
      } else if (queryFilter.orderBy == null && queryFilter.limit != null) {
        queryRefFiltered = queryRef.limit(queryFilter.limit!);
      } else {
        queryRefFiltered = queryRef
            .orderBy(
              queryFilter.orderBy!.field,
              descending: queryFilter.orderBy!.descending,
            )
            .limit(queryFilter.limit!);
      }

      queryRefFiltered.get().then((querySnapshot) {
        if (querySnapshot.docs.isNotEmpty) {
          List<Map<String, dynamic>> docs = [];
          for (var docSnapshot in querySnapshot.docs) {
            docs.add({"id": docSnapshot.id, "data": docSnapshot.data()});
          }
          completer.complete(docs);
        } else {
          completer.complete();
        }
      }, onError: (_) {
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
        completer.complete({"id": docSnapshot.id, "data": docSnapshot.data()});
      } else {
        completer.complete();
      }
    }, onError: (_) {
      completer.complete();
    });

    return await completer.future;
  }

  static Future<Map<String, dynamic>?> getOneByQuery({
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
    }, onError: (_) {
      completer.complete();
    });

    return await completer.future;
  }
}
