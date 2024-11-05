import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:navibook/domain/datasources/books_datasource.dart';
import 'package:navibook/domain/entities/book.dart';
import 'package:navibook/presentation/providers/books/books_repository_provider.dart';

final booksProvider =
    StateNotifierProvider.family<BooksNotifier, List<Book>, Subject>(
        (ref, subject) {
  final fetchBooks = ref.watch(bookRepositoryProvider).getBooksBySubject;
  return BooksNotifier(
    subject: subject,
    fetchSubjectBooks: fetchBooks,
  );
});

typedef BookCallback = Future Function({Subject subject});

class BooksNotifier extends StateNotifier<List<Book>> {
  Subject subject;
  BookCallback fetchSubjectBooks;

  BooksNotifier({required this.fetchSubjectBooks, required this.subject})
      : super([]);

  Future<void> loadNextPage() async {
    final List<Book> books = await fetchSubjectBooks(subject: subject);
    state = [...state, ...books];
  }
}
