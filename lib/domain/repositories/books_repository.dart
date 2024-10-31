import 'package:navibook/domain/entities/book.dart';

abstract class BooksRepository {
  Future<List<Book>> getBooksBySubject({String subject = 'fantasy'});

  Future<List<Book>> getBooksPopular();
}
