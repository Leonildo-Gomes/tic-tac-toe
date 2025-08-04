import 'package:flutter/material.dart';

enum Language {
  english(code: 'en', name: 'English', flag: '🇬🇧'),
  portuguese(code: 'pt', name: 'Português', flag: '🇵🇹'),
  norwegian(code: 'nb', name: 'Norsk', flag: '🇳🇴');

  final String code;
  final String name;
  final String flag;

  const Language({
    required this.code,
    required this.name,
    required this.flag,
  });

  Locale get locale => Locale(code);

  static Language fromCode(String code) {
    return Language.values.firstWhere(
      (lang) => lang.code == code,
      orElse: () => Language.english, // Default language
    );
  }
}
