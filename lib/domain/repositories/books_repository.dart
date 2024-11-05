import 'package:navibook/domain/datasources/books_datasource.dart';
import 'package:navibook/domain/entities/book.dart';

abstract class BooksRepository {
  Future<List<Book>> getBooksBySubject({Subject subject = Subject.fantasy});
}
