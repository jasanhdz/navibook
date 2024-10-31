import 'package:navibook/domain/entities/book.dart';
import 'package:navibook/infrastructure/models/openlibrary/book_openlibrary.dart';

class BookMapper {
  static Book openLibraryEntity(BookOpenLibrarySearch bookOpenLibrary) => Book(
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
      coverImage: bookOpenLibrary.coverI != ''
          ? 'https://covers.openlibrary.org/b/id/${bookOpenLibrary.coverI}-L.jpg'
          : 'https://m.media-amazon.com/images/I/61s8vyZLSzL._AC_UF894,1000_QL80_.jpg',
      version: bookOpenLibrary.version);
}
