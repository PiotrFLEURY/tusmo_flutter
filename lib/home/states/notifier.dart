import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tusmo_flutter/home/states/state.dart';

final possibleWords = [
  'Flutter',
  'Dart',
  'Riverpod',
  'Provider',
  'State',
  'Notifier',
  'Consumer',
  'Widget',
  'Async',
  'Value',
  'Comma',
  'Semicolon',
  'Equals',
].map((w) => w.toUpperCase()).toList();

class TusmoStateNotifier extends StateNotifier<TusmoState> {
  TusmoStateNotifier()
      : super(
          TusmoState(
            wordToFind: possibleWords[Random().nextInt(possibleWords.length)],
          ),
        );

  void changeWord() {
    state = TusmoState(
      wordToFind: possibleWords[Random().nextInt(possibleWords.length)],
    );
  }

  void submit(String word) {
    state = TusmoState(
      wordToFind: state.wordToFind,
      submittedWords: [...state.submittedWords, word.toUpperCase()],
    );
  }

  bool win(String word) {
    return word.toUpperCase() == state.wordToFind;
  }
}
