import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final firebaseFirestoreProvider = AutoDisposeProvider<FirebaseFirestore>((ref) {
  return FirebaseFirestore.instance;
});

final loginsCollectionProvider = AutoDisposeProvider<CollectionReference<Map<String, dynamic>>>((ref) {
  return ref.watch(firebaseFirestoreProvider).collection("logins");
});
