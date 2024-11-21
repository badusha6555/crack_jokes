import 'package:crack_jokes/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyWidget extends ConsumerWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final jokeList = ref.watch(jokeListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Jokes'),
      ),
      body: jokeList.when(
        data: (jokes) => Center(
          child: Container(
            height: 350,
            width: 300,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(255, 190, 128, 128),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  jokes[0].setup ?? 'No setup available',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                SizedBox(height: 18),
                Text(jokes[0].punchline ?? 'No punchline available',
                    style: TextStyle(
                      fontSize: 20.0,
                    )),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // ignore: unused_result
                    ref.refresh(jokeListProvider);
                  },
                  child: const Text('Refresh Jokes'),
                ),
              ],
            ),
          ),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(
          child: Text('Error: $error'),
        ),
      ),
    );
  }
}
