import 'package:navibook/infrastructure/models/openlibrary/book_search_openlibrary.dart';

class OpenLibrarySearchResponse {
  final int numFound;
  final int start;
  final bool numFoundExact;
  final List<BookOpenLibrarySearch> docs;
  final String q;
  final int? offset;

  OpenLibrarySearchResponse({
    required this.docs,
    required this.numFound,
    required this.numFoundExact,
    required this.q,
    required this.start,
    this.offset,
  });

  factory OpenLibrarySearchResponse.fromJson(Map<String, dynamic> json) {
    print(json);
    return OpenLibrarySearchResponse(
        q: json["q"],
        docs: List<BookOpenLibrarySearch>.from(
            json["docs"].map((x) => BookOpenLibrarySearch.fromJson(x))),
        numFound: 56,
        numFoundExact: true,
        start: 0);
  }
}
