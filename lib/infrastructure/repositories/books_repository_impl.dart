import 'package:navibook/domain/datasources/books_datasource.dart';
import 'package:navibook/domain/entities/book.dart';
import 'package:navibook/domain/repositories/books_repository.dart';

class BooksRepositoryImpl implements BooksRepository {
  final BooksDataSource dataSource;
  BooksRepositoryImpl(this.dataSource);

  @override
  Future<List<Book>> getBooksBySubject({Subject subject = Subject.fantasy}) {
    return dataSource.getBooksBySubject(subject: subject);
  }

  @override
  Future<List<Book>> searchBooks(String query) {
    return dataSource.searchBooks(query);
  }
}
