import 'dart:developer';

import 'package:crack_jokes/data/model/jokes.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final String baseUrl = "https://official-joke-api.appspot.com/random_joke";

final jokeListProvider = FutureProvider<List<Jokes>>((ref) async {
  try {
    final response = await Dio().get(baseUrl);
    log("response.data: ${response.data}");
    if (response.statusCode == 200) {
      final data = response.data as Map<String, dynamic>;
      final joke = Jokes.fromJson(data);
      return [joke];
    } else {
      throw Exception("Error: ${response.statusCode}");
    }
  } catch (e) {
    log("error: $e");
    throw Exception(e);
  }
});
