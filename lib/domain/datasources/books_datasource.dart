import 'package:navibook/domain/entities/book.dart';

enum Subject {
  fantasy,
  historical_fiction,
  horror,
  humor,
  literature,
  magic,
  mystery_and_detective_stories,
  plays,
  poetry,
  romance,
  science_fiction,
  short_stories,
  thriller,
  young_adult_fiction,
  ancient_civilization,
  archaeology,
  anthropology,
  juvenile_literature,
  nutrition,
}

extension SubjectExtension on Subject {
  String get asString {
    switch (this) {
      case Subject.fantasy:
        return 'fantasy';
      case Subject.historical_fiction:
        return 'historical_fiction';
      case Subject.horror:
        return 'horror';
      case Subject.humor:
        return 'humor';
      case Subject.literature:
        return 'literature';
      case Subject.magic:
        return 'magic';
      case Subject.mystery_and_detective_stories:
        return 'mystery_and_detective_stories';
      case Subject.plays:
        return 'plays';
      case Subject.poetry:
        return 'poetry';
      case Subject.romance:
        return 'romance';
      case Subject.science_fiction:
        return 'science_fiction';
      case Subject.short_stories:
        return 'short_stories';
      case Subject.thriller:
        return 'thriller';
      case Subject.young_adult_fiction:
        return 'young_adult_fiction';
      case Subject.ancient_civilization:
        return 'ancient_civilization';
      case Subject.archaeology:
        return 'archaeology';
      case Subject.anthropology:
        return 'anthropology';
      case Subject.juvenile_literature:
        return 'juvenile_literature';
      case Subject.nutrition:
        return 'nutrition';
      default:
        return 'unknown';
    }
  }
}

abstract class BooksDataSource {
  Future<List<Book>> getBooksBySubject({Subject subject = Subject.fantasy});
}
