import 'package:dio/dio.dart';
import 'package:navibook/domain/datasources/books_datasource.dart';
import 'package:navibook/domain/entities/book.dart';
import 'package:navibook/infrastructure/mappers/book_mapper.dart';
import 'package:navibook/infrastructure/models/openlibrary/openlibrary_response.dart';
import 'package:navibook/infrastructure/models/openlibrary/openlibrary_search_response.dart';

class OpenLibraryDataSource implements BooksDataSource {
  final dio = Dio(BaseOptions(baseUrl: 'https://openlibrary.org'));

  List<Book> _jsonToBooks(Map<String, dynamic> json) {
    final openLibraryResponse = OpenLibraryResponse.fromJson(json);

    final List<Book> books = openLibraryResponse.works
        .map((doc) => BookMapper.fromOpenLibraryEntity(doc))
        .toList();

    return books;
  }

  @override
  Future<List<Book>> getBooksBySubject(
      {Subject subject = Subject.fantasy}) async {
    final response = await dio.get('/subjects/${subject.asString}.json');

    return _jsonToBooks(response.data);
  }

  @override
  Future<List<Book>> searchBooks(String query) async {
    if (query.isEmpty) return [];
    final response =
        await dio.get('/search.json', queryParameters: {'q': query});

    final openLibrarySearchResponse =
        OpenLibrarySearchResponse.fromJson(response.data);

    final List<Book> books = openLibrarySearchResponse.docs
        .map((doc) => BookMapper.fromOpenLibrarySearchEntity(doc))
        .toList();

    return books;
  }
}
