import 'package:navibook/domain/datasources/books_datasource.dart';
import 'package:navibook/domain/entities/book.dart';

abstract class BooksRepository {
  Future<List<Book>> getBooksBySubject({Subject subject = Subject.fantasy});

  Future<List<Book>> searchBooks(String query);

  Future<Book> getBookById(String id);
}
