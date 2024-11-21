class Jokes {
  int? id;
  String? type;
  String? setup;
  String? punchline;

  Jokes({this.id, this.type, this.setup, this.punchline});

  factory Jokes.fromJson(Map<String, dynamic> json) {
    return Jokes(
      id: json['id'] as int?,
      type: json['type'] as String?,
      setup: json['setup'] as String?,
      punchline: json['punchline'] as String?,
    );
  }
}
