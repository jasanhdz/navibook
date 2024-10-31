import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:navibook/domain/entities/book.dart';
import 'package:navibook/presentation/providers/books/books_repository_provider.dart';

final fantasyBooksProvider =
    StateNotifierProvider<BooksNotifier, List<Book>>((ref) {
  final fetchMoreMovies = ref.watch(bookRepositoryProvider).getBooksBySubject;

  return BooksNotifier(fetchSubjectBooks: fetchMoreMovies);
});

typedef BookCallback = Future Function({String subject});

class BooksNotifier extends StateNotifier<List<Book>> {
  String subject = 'fantasy';
  BookCallback fetchSubjectBooks;

  BooksNotifier({required this.fetchSubjectBooks}) : super([]);

  Future<void> loadNextPage() async {
    final List<Book> books = await fetchSubjectBooks(subject: subject);
    state = [...books];
  }
}
