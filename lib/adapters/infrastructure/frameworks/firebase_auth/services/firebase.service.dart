import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final firebaseAuthProvider = AutoDisposeProvider((_) => FirebaseAuth.instance);
