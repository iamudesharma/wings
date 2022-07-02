// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comments_model.dart';

// **************************************************************************
// CollectionGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

class _Sentinel {
  const _Sentinel();
}

const _sentinel = _Sentinel();

/// A collection reference object can be used for adding documents,
/// getting document references, and querying for documents
/// (using the methods inherited from Query).
abstract class CommentCollectionReference
    implements
        CommentQuery,
        FirestoreCollectionReference<CommentQuerySnapshot> {
  factory CommentCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$CommentCollectionReference;

  static Comment fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return _$CommentFromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    Comment value,
    SetOptions? options,
  ) {
    return _$CommentToJson(value);
  }

  @override
  CommentDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<CommentDocumentReference> add(Comment value);
}

class _$CommentCollectionReference extends _$CommentQuery
    implements CommentCollectionReference {
  factory _$CommentCollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$CommentCollectionReference._(
      firestore.collection('posts').withConverter(
            fromFirestore: CommentCollectionReference.fromFirestore,
            toFirestore: CommentCollectionReference.toFirestore,
          ),
    );
  }

  _$CommentCollectionReference._(
    CollectionReference<Comment> reference,
  ) : super(reference, reference);

  String get path => reference.path;

  @override
  CollectionReference<Comment> get reference =>
      super.reference as CollectionReference<Comment>;

  @override
  CommentDocumentReference doc([String? id]) {
    assert(
      id == null || id.split('/').length == 1,
      'The document ID cannot be from a different collection',
    );
    return CommentDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<CommentDocumentReference> add(Comment value) {
    return reference.add(value).then((ref) => CommentDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$CommentCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class CommentDocumentReference
    extends FirestoreDocumentReference<CommentDocumentSnapshot> {
  factory CommentDocumentReference(DocumentReference<Comment> reference) =
      _$CommentDocumentReference;

  DocumentReference<Comment> get reference;

  /// A reference to the [CommentCollectionReference] containing this document.
  CommentCollectionReference get parent {
    return _$CommentCollectionReference(reference.firestore);
  }

  @override
  Stream<CommentDocumentSnapshot> snapshots();

  @override
  Future<CommentDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  Future<void> update({
    String username,
    String comment,
    String userDp,
    String userId,
  });

  Future<void> set(Comment value);
}

class _$CommentDocumentReference
    extends FirestoreDocumentReference<CommentDocumentSnapshot>
    implements CommentDocumentReference {
  _$CommentDocumentReference(this.reference);

  @override
  final DocumentReference<Comment> reference;

  /// A reference to the [CommentCollectionReference] containing this document.
  CommentCollectionReference get parent {
    return _$CommentCollectionReference(reference.firestore);
  }

  @override
  Stream<CommentDocumentSnapshot> snapshots() {
    return reference.snapshots().map((snapshot) {
      return CommentDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<CommentDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then((snapshot) {
      return CommentDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<void> delete() {
    return reference.delete();
  }

  Future<void> update({
    Object? username = _sentinel,
    Object? comment = _sentinel,
    Object? userDp = _sentinel,
    Object? userId = _sentinel,
  }) async {
    final json = {
      if (username != _sentinel) "username": username as String,
      if (comment != _sentinel) "comment": comment as String,
      if (userDp != _sentinel) "userDp": userDp as String,
      if (userId != _sentinel) "userId": userId as String,
    };

    return reference.update(json);
  }

  Future<void> set(Comment value) {
    return reference.set(value);
  }

  @override
  bool operator ==(Object other) {
    return other is CommentDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

class CommentDocumentSnapshot extends FirestoreDocumentSnapshot {
  CommentDocumentSnapshot._(
    this.snapshot,
    this.data,
  );

  @override
  final DocumentSnapshot<Comment> snapshot;

  @override
  CommentDocumentReference get reference {
    return CommentDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final Comment? data;
}

abstract class CommentQuery implements QueryReference<CommentQuerySnapshot> {
  @override
  CommentQuery limit(int limit);

  @override
  CommentQuery limitToLast(int limit);

  CommentQuery whereDocumentId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  CommentQuery whereUsername({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  CommentQuery whereComment({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  CommentQuery whereUserDp({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  CommentQuery whereUserId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });

  CommentQuery orderByDocumentId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    CommentDocumentSnapshot? startAtDocument,
    CommentDocumentSnapshot? endAtDocument,
    CommentDocumentSnapshot? endBeforeDocument,
    CommentDocumentSnapshot? startAfterDocument,
  });

  CommentQuery orderByUsername({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    CommentDocumentSnapshot? startAtDocument,
    CommentDocumentSnapshot? endAtDocument,
    CommentDocumentSnapshot? endBeforeDocument,
    CommentDocumentSnapshot? startAfterDocument,
  });

  CommentQuery orderByComment({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    CommentDocumentSnapshot? startAtDocument,
    CommentDocumentSnapshot? endAtDocument,
    CommentDocumentSnapshot? endBeforeDocument,
    CommentDocumentSnapshot? startAfterDocument,
  });

  CommentQuery orderByUserDp({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    CommentDocumentSnapshot? startAtDocument,
    CommentDocumentSnapshot? endAtDocument,
    CommentDocumentSnapshot? endBeforeDocument,
    CommentDocumentSnapshot? startAfterDocument,
  });

  CommentQuery orderByUserId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    CommentDocumentSnapshot? startAtDocument,
    CommentDocumentSnapshot? endAtDocument,
    CommentDocumentSnapshot? endBeforeDocument,
    CommentDocumentSnapshot? startAfterDocument,
  });
}

class _$CommentQuery extends QueryReference<CommentQuerySnapshot>
    implements CommentQuery {
  _$CommentQuery(
    this.reference,
    this._collection,
  );

  final CollectionReference<Object?> _collection;

  @override
  final Query<Comment> reference;

  CommentQuerySnapshot _decodeSnapshot(
    QuerySnapshot<Comment> snapshot,
  ) {
    final docs = snapshot.docs.map((e) {
      return CommentQueryDocumentSnapshot._(e, e.data());
    }).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return FirestoreDocumentChange<CommentDocumentSnapshot>(
        type: change.type,
        oldIndex: change.oldIndex,
        newIndex: change.newIndex,
        doc: CommentDocumentSnapshot._(change.doc, change.doc.data()),
      );
    }).toList();

    return CommentQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  @override
  Stream<CommentQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(_decodeSnapshot);
  }

  @override
  Future<CommentQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(_decodeSnapshot);
  }

  @override
  CommentQuery limit(int limit) {
    return _$CommentQuery(
      reference.limit(limit),
      _collection,
    );
  }

  @override
  CommentQuery limitToLast(int limit) {
    return _$CommentQuery(
      reference.limitToLast(limit),
      _collection,
    );
  }

  CommentQuery whereDocumentId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$CommentQuery(
      reference.where(
        FieldPath.documentId,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  CommentQuery whereUsername({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$CommentQuery(
      reference.where(
        "username",
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  CommentQuery whereComment({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$CommentQuery(
      reference.where(
        "comment",
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  CommentQuery whereUserDp({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$CommentQuery(
      reference.where(
        "userDp",
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  CommentQuery whereUserId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$CommentQuery(
      reference.where(
        "userId",
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  CommentQuery orderByDocumentId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    CommentDocumentSnapshot? startAtDocument,
    CommentDocumentSnapshot? endAtDocument,
    CommentDocumentSnapshot? endBeforeDocument,
    CommentDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy(FieldPath.documentId, descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$CommentQuery(query, _collection);
  }

  CommentQuery orderByUsername({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    CommentDocumentSnapshot? startAtDocument,
    CommentDocumentSnapshot? endAtDocument,
    CommentDocumentSnapshot? endBeforeDocument,
    CommentDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy("username", descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$CommentQuery(query, _collection);
  }

  CommentQuery orderByComment({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    CommentDocumentSnapshot? startAtDocument,
    CommentDocumentSnapshot? endAtDocument,
    CommentDocumentSnapshot? endBeforeDocument,
    CommentDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy("comment", descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$CommentQuery(query, _collection);
  }

  CommentQuery orderByUserDp({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    CommentDocumentSnapshot? startAtDocument,
    CommentDocumentSnapshot? endAtDocument,
    CommentDocumentSnapshot? endBeforeDocument,
    CommentDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy("userDp", descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$CommentQuery(query, _collection);
  }

  CommentQuery orderByUserId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    CommentDocumentSnapshot? startAtDocument,
    CommentDocumentSnapshot? endAtDocument,
    CommentDocumentSnapshot? endBeforeDocument,
    CommentDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy("userId", descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$CommentQuery(query, _collection);
  }

  @override
  bool operator ==(Object other) {
    return other is _$CommentQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class CommentQuerySnapshot
    extends FirestoreQuerySnapshot<CommentQueryDocumentSnapshot> {
  CommentQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  final QuerySnapshot<Comment> snapshot;

  @override
  final List<CommentQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<CommentDocumentSnapshot>> docChanges;
}

class CommentQueryDocumentSnapshot extends FirestoreQueryDocumentSnapshot
    implements CommentDocumentSnapshot {
  CommentQueryDocumentSnapshot._(this.snapshot, this.data);

  @override
  final QueryDocumentSnapshot<Comment> snapshot;

  @override
  CommentDocumentReference get reference {
    return CommentDocumentReference(snapshot.reference);
  }

  @override
  final Comment data;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Comment _$CommentFromJson(Map<String, dynamic> json) => Comment(
      username: json['username'] as String,
      comment: json['comment'] as String,
      userDp: json['userDp'] as String,
      userId: json['userId'] as String,
    );

Map<String, dynamic> _$CommentToJson(Comment instance) => <String, dynamic>{
      'username': instance.username,
      'comment': instance.comment,
      'userDp': instance.userDp,
      'userId': instance.userId,
    };
