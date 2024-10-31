import 'package:dio/dio.dart';
import 'package:navibook/domain/datasources/books_datasource.dart';
import 'package:navibook/domain/entities/book.dart';
import 'package:navibook/infrastructure/mappers/book_mapper.dart';
import 'package:navibook/infrastructure/models/openlibrary/openlibrary_response.dart';

class OpenLibraryDataSource implements BooksDataSource {
  final dio =
      Dio(BaseOptions(baseUrl: 'https://openlibrary.org', queryParameters: {
    'language': 'es-MX',
  }));

  @override
  Future<List<Book>> getBooksBySubject({String subject = 'fantasy'}) async {
    final response = await dio.get('/subjects/fantasy.json');
    final bookOpenLibraryResponse = OpenLibraryResponse.fromJson(response.data);

    final List<Book> books = bookOpenLibraryResponse.works
        .map((doc) => BookMapper.openLibraryEntity(doc))
        .toList();

    return books;
  }

  @override
  Future<List<Book>> getBooksPopular() async {
    return [];
  }
}
