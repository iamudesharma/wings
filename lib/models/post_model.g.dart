// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

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
abstract class PostCollectionReference
    implements PostQuery, FirestoreCollectionReference<PostQuerySnapshot> {
  factory PostCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$PostCollectionReference;

  static Post fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return Post.fromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    Post value,
    SetOptions? options,
  ) {
    return value.toJson();
  }

  @override
  PostDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<PostDocumentReference> add(Post value);
}

class _$PostCollectionReference extends _$PostQuery
    implements PostCollectionReference {
  factory _$PostCollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$PostCollectionReference._(
      firestore.collection('posts').withConverter(
            fromFirestore: PostCollectionReference.fromFirestore,
            toFirestore: PostCollectionReference.toFirestore,
          ),
    );
  }

  _$PostCollectionReference._(
    CollectionReference<Post> reference,
  ) : super(reference, reference);

  String get path => reference.path;

  @override
  CollectionReference<Post> get reference =>
      super.reference as CollectionReference<Post>;

  @override
  PostDocumentReference doc([String? id]) {
    assert(
      id == null || id.split('/').length == 1,
      'The document ID cannot be from a different collection',
    );
    return PostDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<PostDocumentReference> add(Post value) {
    return reference.add(value).then((ref) => PostDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$PostCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class PostDocumentReference
    extends FirestoreDocumentReference<PostDocumentSnapshot> {
  factory PostDocumentReference(DocumentReference<Post> reference) =
      _$PostDocumentReference;

  DocumentReference<Post> get reference;

  /// A reference to the [PostCollectionReference] containing this document.
  PostCollectionReference get parent {
    return _$PostCollectionReference(reference.firestore);
  }

  @override
  Stream<PostDocumentSnapshot> snapshots();

  @override
  Future<PostDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  Future<void> update({
    String postText,
    String id,
    String ownerId,
    String usernameName,
    String location,
    String mediaUrl,
    String createdAt,
    List<String> tags,
    int likes,
  });

  Future<void> set(Post value);
}

class _$PostDocumentReference
    extends FirestoreDocumentReference<PostDocumentSnapshot>
    implements PostDocumentReference {
  _$PostDocumentReference(this.reference);

  @override
  final DocumentReference<Post> reference;

  /// A reference to the [PostCollectionReference] containing this document.
  PostCollectionReference get parent {
    return _$PostCollectionReference(reference.firestore);
  }

  @override
  Stream<PostDocumentSnapshot> snapshots() {
    return reference.snapshots().map((snapshot) {
      return PostDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<PostDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then((snapshot) {
      return PostDocumentSnapshot._(
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
    Object? postText = _sentinel,
    Object? id = _sentinel,
    Object? ownerId = _sentinel,
    Object? usernameName = _sentinel,
    Object? location = _sentinel,
    Object? mediaUrl = _sentinel,
    Object? createdAt = _sentinel,
    Object? tags = _sentinel,
    Object? likes = _sentinel,
  }) async {
    final json = {
      if (postText != _sentinel) "postText": postText as String,
      if (id != _sentinel) "id": id as String,
      if (ownerId != _sentinel) "ownerId": ownerId as String,
      if (usernameName != _sentinel) "usernameName": usernameName as String,
      if (location != _sentinel) "location": location as String,
      if (mediaUrl != _sentinel) "mediaUrl": mediaUrl as String,
      if (createdAt != _sentinel) "createdAt": createdAt as String,
      if (tags != _sentinel) "tags": tags as List<String>,
      if (likes != _sentinel) "likes": likes as int,
    };

    return reference.update(json);
  }

  Future<void> set(Post value) {
    return reference.set(value);
  }

  @override
  bool operator ==(Object other) {
    return other is PostDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

class PostDocumentSnapshot extends FirestoreDocumentSnapshot {
  PostDocumentSnapshot._(
    this.snapshot,
    this.data,
  );

  @override
  final DocumentSnapshot<Post> snapshot;

  @override
  PostDocumentReference get reference {
    return PostDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final Post? data;
}

abstract class PostQuery implements QueryReference<PostQuerySnapshot> {
  @override
  PostQuery limit(int limit);

  @override
  PostQuery limitToLast(int limit);

  PostQuery whereDocumentId({
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
  PostQuery wherePostText({
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
  PostQuery whereId({
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
  PostQuery whereOwnerId({
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
  PostQuery whereUsernameName({
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
  PostQuery whereLocation({
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
  PostQuery whereMediaUrl({
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
  PostQuery whereCreatedAt({
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
  PostQuery whereTags({
    List<String>? isEqualTo,
    List<String>? isNotEqualTo,
    List<String>? isLessThan,
    List<String>? isLessThanOrEqualTo,
    List<String>? isGreaterThan,
    List<String>? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? arrayContainsAny,
  });
  PostQuery whereLikes({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int>? whereIn,
    List<int>? whereNotIn,
  });

  PostQuery orderByDocumentId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    PostDocumentSnapshot? startAtDocument,
    PostDocumentSnapshot? endAtDocument,
    PostDocumentSnapshot? endBeforeDocument,
    PostDocumentSnapshot? startAfterDocument,
  });

  PostQuery orderByPostText({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    PostDocumentSnapshot? startAtDocument,
    PostDocumentSnapshot? endAtDocument,
    PostDocumentSnapshot? endBeforeDocument,
    PostDocumentSnapshot? startAfterDocument,
  });

  PostQuery orderById({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    PostDocumentSnapshot? startAtDocument,
    PostDocumentSnapshot? endAtDocument,
    PostDocumentSnapshot? endBeforeDocument,
    PostDocumentSnapshot? startAfterDocument,
  });

  PostQuery orderByOwnerId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    PostDocumentSnapshot? startAtDocument,
    PostDocumentSnapshot? endAtDocument,
    PostDocumentSnapshot? endBeforeDocument,
    PostDocumentSnapshot? startAfterDocument,
  });

  PostQuery orderByUsernameName({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    PostDocumentSnapshot? startAtDocument,
    PostDocumentSnapshot? endAtDocument,
    PostDocumentSnapshot? endBeforeDocument,
    PostDocumentSnapshot? startAfterDocument,
  });

  PostQuery orderByLocation({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    PostDocumentSnapshot? startAtDocument,
    PostDocumentSnapshot? endAtDocument,
    PostDocumentSnapshot? endBeforeDocument,
    PostDocumentSnapshot? startAfterDocument,
  });

  PostQuery orderByMediaUrl({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    PostDocumentSnapshot? startAtDocument,
    PostDocumentSnapshot? endAtDocument,
    PostDocumentSnapshot? endBeforeDocument,
    PostDocumentSnapshot? startAfterDocument,
  });

  PostQuery orderByCreatedAt({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    PostDocumentSnapshot? startAtDocument,
    PostDocumentSnapshot? endAtDocument,
    PostDocumentSnapshot? endBeforeDocument,
    PostDocumentSnapshot? startAfterDocument,
  });

  PostQuery orderByTags({
    bool descending = false,
    List<String> startAt,
    List<String> startAfter,
    List<String> endAt,
    List<String> endBefore,
    PostDocumentSnapshot? startAtDocument,
    PostDocumentSnapshot? endAtDocument,
    PostDocumentSnapshot? endBeforeDocument,
    PostDocumentSnapshot? startAfterDocument,
  });

  PostQuery orderByLikes({
    bool descending = false,
    int startAt,
    int startAfter,
    int endAt,
    int endBefore,
    PostDocumentSnapshot? startAtDocument,
    PostDocumentSnapshot? endAtDocument,
    PostDocumentSnapshot? endBeforeDocument,
    PostDocumentSnapshot? startAfterDocument,
  });
}

class _$PostQuery extends QueryReference<PostQuerySnapshot>
    implements PostQuery {
  _$PostQuery(
    this.reference,
    this._collection,
  );

  final CollectionReference<Object?> _collection;

  @override
  final Query<Post> reference;

  PostQuerySnapshot _decodeSnapshot(
    QuerySnapshot<Post> snapshot,
  ) {
    final docs = snapshot.docs.map((e) {
      return PostQueryDocumentSnapshot._(e, e.data());
    }).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return FirestoreDocumentChange<PostDocumentSnapshot>(
        type: change.type,
        oldIndex: change.oldIndex,
        newIndex: change.newIndex,
        doc: PostDocumentSnapshot._(change.doc, change.doc.data()),
      );
    }).toList();

    return PostQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  @override
  Stream<PostQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(_decodeSnapshot);
  }

  @override
  Future<PostQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(_decodeSnapshot);
  }

  @override
  PostQuery limit(int limit) {
    return _$PostQuery(
      reference.limit(limit),
      _collection,
    );
  }

  @override
  PostQuery limitToLast(int limit) {
    return _$PostQuery(
      reference.limitToLast(limit),
      _collection,
    );
  }

  PostQuery whereDocumentId({
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
    return _$PostQuery(
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

  PostQuery wherePostText({
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
    return _$PostQuery(
      reference.where(
        "postText",
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

  PostQuery whereId({
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
    return _$PostQuery(
      reference.where(
        "id",
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

  PostQuery whereOwnerId({
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
    return _$PostQuery(
      reference.where(
        "ownerId",
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

  PostQuery whereUsernameName({
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
    return _$PostQuery(
      reference.where(
        "usernameName",
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

  PostQuery whereLocation({
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
    return _$PostQuery(
      reference.where(
        "location",
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

  PostQuery whereMediaUrl({
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
    return _$PostQuery(
      reference.where(
        "mediaUrl",
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

  PostQuery whereCreatedAt({
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
    return _$PostQuery(
      reference.where(
        "createdAt",
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

  PostQuery whereTags({
    List<String>? isEqualTo,
    List<String>? isNotEqualTo,
    List<String>? isLessThan,
    List<String>? isLessThanOrEqualTo,
    List<String>? isGreaterThan,
    List<String>? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? arrayContainsAny,
  }) {
    return _$PostQuery(
      reference.where(
        "tags",
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        arrayContainsAny: arrayContainsAny,
      ),
      _collection,
    );
  }

  PostQuery whereLikes({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int>? whereIn,
    List<int>? whereNotIn,
  }) {
    return _$PostQuery(
      reference.where(
        "likes",
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

  PostQuery orderByDocumentId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PostDocumentSnapshot? startAtDocument,
    PostDocumentSnapshot? endAtDocument,
    PostDocumentSnapshot? endBeforeDocument,
    PostDocumentSnapshot? startAfterDocument,
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

    return _$PostQuery(query, _collection);
  }

  PostQuery orderByPostText({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PostDocumentSnapshot? startAtDocument,
    PostDocumentSnapshot? endAtDocument,
    PostDocumentSnapshot? endBeforeDocument,
    PostDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy("postText", descending: descending);

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

    return _$PostQuery(query, _collection);
  }

  PostQuery orderById({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PostDocumentSnapshot? startAtDocument,
    PostDocumentSnapshot? endAtDocument,
    PostDocumentSnapshot? endBeforeDocument,
    PostDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy("id", descending: descending);

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

    return _$PostQuery(query, _collection);
  }

  PostQuery orderByOwnerId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PostDocumentSnapshot? startAtDocument,
    PostDocumentSnapshot? endAtDocument,
    PostDocumentSnapshot? endBeforeDocument,
    PostDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy("ownerId", descending: descending);

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

    return _$PostQuery(query, _collection);
  }

  PostQuery orderByUsernameName({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PostDocumentSnapshot? startAtDocument,
    PostDocumentSnapshot? endAtDocument,
    PostDocumentSnapshot? endBeforeDocument,
    PostDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy("usernameName", descending: descending);

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

    return _$PostQuery(query, _collection);
  }

  PostQuery orderByLocation({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PostDocumentSnapshot? startAtDocument,
    PostDocumentSnapshot? endAtDocument,
    PostDocumentSnapshot? endBeforeDocument,
    PostDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy("location", descending: descending);

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

    return _$PostQuery(query, _collection);
  }

  PostQuery orderByMediaUrl({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PostDocumentSnapshot? startAtDocument,
    PostDocumentSnapshot? endAtDocument,
    PostDocumentSnapshot? endBeforeDocument,
    PostDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy("mediaUrl", descending: descending);

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

    return _$PostQuery(query, _collection);
  }

  PostQuery orderByCreatedAt({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PostDocumentSnapshot? startAtDocument,
    PostDocumentSnapshot? endAtDocument,
    PostDocumentSnapshot? endBeforeDocument,
    PostDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy("createdAt", descending: descending);

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

    return _$PostQuery(query, _collection);
  }

  PostQuery orderByTags({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PostDocumentSnapshot? startAtDocument,
    PostDocumentSnapshot? endAtDocument,
    PostDocumentSnapshot? endBeforeDocument,
    PostDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy("tags", descending: descending);

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

    return _$PostQuery(query, _collection);
  }

  PostQuery orderByLikes({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PostDocumentSnapshot? startAtDocument,
    PostDocumentSnapshot? endAtDocument,
    PostDocumentSnapshot? endBeforeDocument,
    PostDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy("likes", descending: descending);

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

    return _$PostQuery(query, _collection);
  }

  @override
  bool operator ==(Object other) {
    return other is _$PostQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class PostQuerySnapshot
    extends FirestoreQuerySnapshot<PostQueryDocumentSnapshot> {
  PostQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  final QuerySnapshot<Post> snapshot;

  @override
  final List<PostQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<PostDocumentSnapshot>> docChanges;
}

class PostQueryDocumentSnapshot extends FirestoreQueryDocumentSnapshot
    implements PostDocumentSnapshot {
  PostQueryDocumentSnapshot._(this.snapshot, this.data);

  @override
  final QueryDocumentSnapshot<Post> snapshot;

  @override
  PostDocumentReference get reference {
    return PostDocumentReference(snapshot.reference);
  }

  @override
  final Post data;
}

// **************************************************************************
// ValidatorGenerator
// **************************************************************************

_$assertPost(Post instance) {
  const Min(0).validate(instance.likes, "likes");
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) => Post(
      postText: json['postText'] as String,
      id: json['id'] as String,
      ownerId: json['ownerId'] as String,
      usernameName: json['usernameName'] as String,
      location: json['location'] as String,
      mediaUrl: json['mediaUrl'] as String,
      createdAt: json['createdAt'] as String,
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      likes: json['likes'] as int,
    );

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'postText': instance.postText,
      'id': instance.id,
      'ownerId': instance.ownerId,
      'usernameName': instance.usernameName,
      'location': instance.location,
      'mediaUrl': instance.mediaUrl,
      'createdAt': instance.createdAt,
      'tags': instance.tags,
      'likes': instance.likes,
    };
