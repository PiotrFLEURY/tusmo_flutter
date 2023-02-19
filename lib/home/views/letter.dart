import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tusmo_flutter/home/states/provider.dart';

class Letter extends ConsumerWidget {
  const Letter({
    super.key,
    required this.charracter,
    required this.color,
  });

  final String charracter;
  final Color color;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wordToFind = ref.read(tusmoStateProvider).wordToFind;
    return Container(
      width: 48,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: wordToFind.contains(charracter) ? color : null,
        border: Border.all(
          color: Colors.white,
          width: 2,
        ),
      ),
      child: Center(
        child: Text(
          charracter,
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                color: Colors.white,
                fontSize: 24,
              ),
        ),
      ),
    );
  }
}
