class LanguageModel {
  final String flag;
  final String name;
  final String languageCode;

  LanguageModel(
    this.flag,
    this.name,
    this.languageCode,
  );

  static List<LanguageModel> languageList() {
    return <LanguageModel>[
      // LanguageModel("🇺🇸", "English", 'en'),
      LanguageModel("Hi! I'am Smile and Go", "English", 'en'), // english
      LanguageModel("Salut! Je suis Smile and Go", "française", 'fr'), //french
    ];
  }
}
