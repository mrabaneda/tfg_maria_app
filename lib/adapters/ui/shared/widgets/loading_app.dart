import 'package:flutter/material.dart';

class LoadingApp extends StatelessWidget {
  const LoadingApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}
