import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:notes/services/cloud/cloud_storage_constants.dart';
import 'package:flutter/foundation.dart';

class CloudNote {
  final String documentId;
  final String ownerUserId;
  final String text;

  const CloudNote({
    required String this.documentId,
    required String this.ownerUserId,
    required String this.text,
  });

  CloudNote.fromSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> snapshot)
      : documentId = snapshot.id,
        ownerUserId = snapshot.data()[ownerUserIdFieldName],
        text = snapshot.data()[textFieldName] as String;
}
