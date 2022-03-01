class Multilingual {
  const Multilingual({required this.english, required this.arabic});
  factory Multilingual.fromMap(Map<String, dynamic> map) {
    return Multilingual(english: map["en"], arabic: map["ar"]);
  }

  final String english;
  final String arabic;
}
