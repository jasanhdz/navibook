class Book {
  final String key;
  final List<String> authors;
  final String title;
  final String subtitle;
  final List<String> isbn;
  final int firstPublishYear;
  final List<String> publishers;
  final List<String> publishDates;
  final int pagesCount;
  final double averageRating;
  final int ratingsCount;
  final List<String> languages;
  final String bookType;
  final List<int> publishYears;
  final String ebookAvailability;
  final int ebookCount;
  final int editionsCount;
  final List<String> editionKeys;
  final bool hasFullText;
  final String identifier;
  final int lastModifiedTimestamp;
  final double version;
  final coverImage;

  Book(
      {required this.key,
      required this.authors,
      required this.title,
      required this.subtitle,
      required this.isbn,
      required this.firstPublishYear,
      required this.publishers,
      required this.publishDates,
      required this.pagesCount,
      required this.averageRating,
      required this.ratingsCount,
      required this.languages,
      required this.bookType,
      required this.publishYears,
      required this.ebookAvailability,
      required this.ebookCount,
      required this.editionsCount,
      required this.editionKeys,
      required this.hasFullText,
      required this.identifier,
      required this.lastModifiedTimestamp,
      required this.version,
      required this.coverImage});
}
