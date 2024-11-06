import 'package:navibook/domain/entities/book.dart';
import 'package:navibook/infrastructure/models/openlibrary/book_details.dart';
import 'package:navibook/infrastructure/models/openlibrary/book_openlibrary.dart';
import 'package:navibook/infrastructure/models/openlibrary/book_search_openlibrary.dart';

class BookMapper {
  static Book _mapToBook(
      {required String key,
      required List<String> authors,
      required String title,
      required String subtitle,
      required List<String> isbn,
      required int firstPublishYear,
      required List<String> publishers,
      required List<String> publishDates,
      required int pagesCount,
      required double averageRating,
      required double ratingsCount,
      required List<String> languages,
      required String bookType,
      required List<int> publishYears,
      required String ebookAvailability,
      required int ebookCount,
      required int editionsCount,
      required List<String> editionKeys,
      required bool hasFullText,
      required String identifier,
      required int lastModifiedTimestamp,
      required String coverImage,
      required double version,
      required List<String> subjects}) {
    return Book(
      key: key,
      subjects: subjects,
      authors: authors,
      title: title,
      subtitle: subtitle,
      description: subtitle,
      isbn: isbn,
      firstPublishYear: firstPublishYear,
      publishers: publishers,
      publishDates: publishDates,
      pagesCount: pagesCount,
      averageRating: averageRating,
      ratingsCount: ratingsCount,
      languages: languages,
      bookType: bookType,
      publishYears: publishYears,
      ebookAvailability: ebookAvailability,
      ebookCount: ebookCount,
      editionsCount: editionsCount,
      editionKeys: editionKeys,
      hasFullText: hasFullText,
      identifier: identifier,
      lastModifiedTimestamp: lastModifiedTimestamp,
      coverImage: coverImage,
      version: version,
    );
  }

  static Book fromOpenLibraryEntity(BookOpenLibrary bookOpenLibrary) {
    return _mapToBook(
      key: bookOpenLibrary.key,
      authors: bookOpenLibrary.authorName,
      title: bookOpenLibrary.title,
      subtitle: bookOpenLibrary.firstSentence[0],
      isbn: bookOpenLibrary.isbn,
      firstPublishYear: bookOpenLibrary.firstPublishYear,
      publishers: bookOpenLibrary.publisher,
      publishDates: bookOpenLibrary.publishDate,
      pagesCount: bookOpenLibrary.ebookCountI,
      averageRating: bookOpenLibrary.ratingsAverage,
      ratingsCount: bookOpenLibrary.ratingsCount,
      languages: bookOpenLibrary.language,
      bookType: bookOpenLibrary.type,
      publishYears: bookOpenLibrary.publishYear,
      ebookAvailability: bookOpenLibrary.ebookAccess,
      ebookCount: bookOpenLibrary.ebookCountI,
      editionsCount: bookOpenLibrary.editionCount,
      editionKeys: bookOpenLibrary.editionKey,
      hasFullText: bookOpenLibrary.hasFulltext,
      identifier: bookOpenLibrary.lendingIdentifierS,
      lastModifiedTimestamp: bookOpenLibrary.lastModifiedI,
      subjects: [],
      coverImage: bookOpenLibrary.coverI != 0
          ? 'https://covers.openlibrary.org/b/id/${bookOpenLibrary.coverI}-L.jpg'
          : 'https://m.media-amazon.com/images/I/61s8vyZLSzL._AC_UF894,1000_QL80_.jpg',
      version: bookOpenLibrary.version,
    );
  }

  static Book fromOpenLibrarySearchEntity(
      BookOpenLibrarySearch bookOpenLibrarySearch) {
    return _mapToBook(
      subjects: bookOpenLibrarySearch.subject,
      key: bookOpenLibrarySearch.key,
      authors: bookOpenLibrarySearch.authorName,
      title: bookOpenLibrarySearch.title,
      subtitle: (bookOpenLibrarySearch.firstSentence.isNotEmpty)
          ? bookOpenLibrarySearch.firstSentence[0]
          : '',
      isbn: bookOpenLibrarySearch.isbn,
      firstPublishYear: bookOpenLibrarySearch.firstPublishYear,
      publishers: bookOpenLibrarySearch.publisher,
      publishDates: bookOpenLibrarySearch.publishDate,
      pagesCount: bookOpenLibrarySearch.ebookCountI,
      averageRating: bookOpenLibrarySearch.ratingsAverage,
      ratingsCount: bookOpenLibrarySearch.ratingsAverage,
      languages: bookOpenLibrarySearch.language,
      bookType: bookOpenLibrarySearch.type,
      publishYears: bookOpenLibrarySearch.publishYear,
      ebookAvailability: bookOpenLibrarySearch.ebookAccess,
      ebookCount: bookOpenLibrarySearch.ebookCountI,
      editionsCount: bookOpenLibrarySearch.editionCount,
      editionKeys: bookOpenLibrarySearch.editionKey,
      hasFullText: bookOpenLibrarySearch.hasFulltext,
      identifier: bookOpenLibrarySearch.lendingIdentifierS,
      lastModifiedTimestamp: bookOpenLibrarySearch.lastModifiedI,
      coverImage: bookOpenLibrarySearch.coverI != 0
          ? 'https://covers.openlibrary.org/b/id/${bookOpenLibrarySearch.coverI}-L.jpg'
          : 'https://m.media-amazon.com/images/I/61s8vyZLSzL._AC_UF894,1000_QL80_.jpg',
      version: bookOpenLibrarySearch.version,
    );
  }

  static Book bookDetailsToEntity(BookDetails book) {
    return Book(
        key: book.key,
        authors: [],
        title: book.title,
        subtitle: book.subtitle,
        isbn: [],
        firstPublishYear: int.parse(book.firstPublishDate),
        publishers: book.subjects,
        publishDates: [],
        pagesCount: 0,
        averageRating: 0,
        ratingsCount: 0,
        languages: [],
        bookType: book.type.key,
        publishYears: [],
        ebookAvailability: '',
        ebookCount: book.latestRevision,
        editionsCount: book.latestRevision,
        editionKeys: [],
        hasFullText: true,
        description: book.description.value,
        identifier: book.key,
        lastModifiedTimestamp: 0,
        version: 1.0,
        subjects: book.subjects,
        coverImage: book.covers.isNotEmpty
            ? 'https://covers.openlibrary.org/b/id/${book.covers[0]}-L.jpg'
            : 'https://m.media-amazon.com/images/I/61s8vyZLSzL._AC_UF894,1000_QL80_.jpg');
  }
}
