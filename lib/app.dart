import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tusmo_flutter/home/home.dart';

class TusmoFlutter extends StatelessWidget {
  const TusmoFlutter({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        home: HomePage(),
        theme: ThemeData(
          primaryColor: const Color(0xff084C61),
        ),
      ),
    );
  }
}
