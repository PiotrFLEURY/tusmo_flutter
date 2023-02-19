import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tusmo_flutter/home/states/provider.dart';
import 'package:tusmo_flutter/home/views/word.dart';

class HomePage extends ConsumerWidget {
  HomePage({super.key});

  final editingController = TextEditingController();
  final focusNode = FocusNode();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(tusmoStateProvider);
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            Text(
              'Find the word',
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    color: Colors.white,
                  ),
            ),
            const Spacer(),
            Word(
              value: state.obfuscatedWord,
              letterColor: Colors.green,
            ),
            const Spacer(),
            ...state.submittedWords.map((value) => Word(value: value)).toList(),
            const Spacer(),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: TextField(
                controller: editingController,
                focusNode: focusNode,
                onSubmitted: (value) => _submitWord(context, ref, value),
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: Colors.white,
                    ),
                textCapitalization: TextCapitalization.characters,
              ),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () => _changeWord(ref),
              child: const Text('Change'),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  void _changeWord(WidgetRef ref) {
    ref.read(tusmoStateProvider.notifier).changeWord();
  }

  _submitWord(
    BuildContext context,
    WidgetRef ref,
    String word,
  ) {
    final notifier = ref.read(tusmoStateProvider.notifier);
    if (notifier.win(word)) {
      _showWinDialog(context, ref);
    } else {
      notifier.submit(word);
    }
    editingController.clear();
    focusNode.requestFocus();
  }

  Future<void> _showWinDialog(
    BuildContext context,
    WidgetRef ref,
  ) async {
    await showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 200,
          color: Colors.white,
          child: Center(
            child: Column(
              children: [
                const Spacer(),
                Text(
                  'You win!',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const Spacer(),
                Text(
                  'Word was: ${ref.read(tusmoStateProvider).wordToFind}',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('OK'),
                ),
                const Spacer(),
              ],
            ),
          ),
        );
      },
    );
    _changeWord(ref);
  }
}
