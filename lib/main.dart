import 'dart:async';
import 'dart:io';

import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tfg_maria_app/app.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tfg_maria_app/adapters/ui/shared/styles/theme.dart';

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    await Future.microtask(
      () => SystemChrome.setSystemUIOverlayStyle(
        CommonTheme.systemUiOverlayStyle,
      ),
    );

    await Future.wait([
      dotenv.load(fileName: ".env"),
      Firebase.initializeApp(
        options: DefaultFirebaseOptions.android,
      ),
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
        SystemUiOverlay.top,
        SystemUiOverlay.bottom,
      ])
    ]);

    if (Platform.isAndroid || Platform.isIOS) {
      FirebaseFirestore.instance.settings = const Settings(
        persistenceEnabled: true,
        cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED,
      );
    }

    FlutterError.onError = (errorDetails) {
      FlutterError.presentError(errorDetails);
    };

    runApp(
      const ProviderScope(
        child: MyApp(),
      ),
    );
  }, (error, stack) {
    if (kDebugMode) {
      print("\n----------------------------ERROR-----------------------------\n");
      print(error);
      print("\n\n");
      print(stack);
      print("\n--------------------------FIN ERROR---------------------------\n");
    }
  });
}
