import 'dart:developer';

import 'package:crack_jokes/core/services/services.dart';
import 'package:crack_jokes/data/model/jokes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final jokesViewModelProvider =
    StateNotifierProvider<JokesViewModel, List<Jokes>>(
        (ref) => JokesViewModel(ref));

class JokesViewModel extends StateNotifier<List<Jokes>> {
  JokesViewModel(this._ref) : super([]) {
    getJokes();
  }
  final Ref _ref;
  bool isLoading = false;
  String errorMessage = "";

  Future<void> getJokes() async {
    isLoading = true;
    state = [];
    try {
      final jokes = await _ref.read(jokeListProvider.future);
      log("jokes: $jokes");
      state = jokes;
      isLoading = false;
    } catch (e) {
      isLoading = false;
      errorMessage = e.toString();
    }
  }

  Future<void> refreshData() async {
    try {
      final jokes = await _ref.read(jokeListProvider.future);
      state = jokes;
    } catch (e) {
      log('Error refreshing jokes: $e');
    }
  }
}
