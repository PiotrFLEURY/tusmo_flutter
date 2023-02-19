import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tusmo_flutter/home/states/notifier.dart';
import 'package:tusmo_flutter/home/states/state.dart';

final tusmoStateProvider =
    StateNotifierProvider<TusmoStateNotifier, TusmoState>(
  (ref) => TusmoStateNotifier(),
);
