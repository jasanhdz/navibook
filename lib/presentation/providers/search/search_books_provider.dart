import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:navibook/domain/entities/book.dart';
import 'package:navibook/presentation/providers/books/books_repository_provider.dart';

final searchQueryProvider = StateProvider<String>((ref) => '');

final searchedBooksProvider =
    StateNotifierProvider<SearchedBooksNotifier, List<Book>>((ref) {
  final bookRepository = ref.read(bookRepositoryProvider);
  return SearchedBooksNotifier(
      searchBooks: bookRepository.searchBooks, ref: ref);
});

typedef SearchBooksCallback = Future<List<Book>> Function(String query);

class SearchedBooksNotifier extends StateNotifier<List<Book>> {
  final SearchBooksCallback searchBooks;
  final Ref ref;

  SearchedBooksNotifier({required this.searchBooks, required this.ref})
      : super([]);

  Future<List<Book>> searchBooksByQuery(String query) async {
    final List<Book> books = await searchBooks(query);
    ref.read(searchQueryProvider.notifier).update((state) => query);
    state = books;
    return books;
  }
}
