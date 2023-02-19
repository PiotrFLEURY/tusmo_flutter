class TusmoState {
  const TusmoState({
    required this.wordToFind,
    this.submittedWords = const [],
  });

  final String wordToFind;
  final List<String> submittedWords;

  get obfuscatedWord => wordToFind
      .split('')
      .map(
        (letter) => submittedWords.containsLetter(letter) ? letter : '_',
      )
      .join('');
}

extension StringExt on List<String> {
  bool containsLetter(String letter) {
    return any((word) => word.contains(letter));
  }
}
