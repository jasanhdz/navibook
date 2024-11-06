import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:navibook/domain/entities/book.dart';
import 'package:navibook/presentation/providers/providers.dart';

final bookInfoProvider =
    StateNotifierProvider<BookMapNotifier, Map<String, Book>>((ref) {
  final bookRepository = ref.watch(bookRepositoryProvider);

  return BookMapNotifier(getBook: bookRepository.getBookById);
});

typedef GetBookCallback = Future<Book> Function(String bookId);

class BookMapNotifier extends StateNotifier<Map<String, Book>> {
  final GetBookCallback getBook;
  BookMapNotifier({required this.getBook}) : super({});

  Future<void> loadBook(String bookId) async {
    if (state[bookId] != null) return;

    final book = await getBook(bookId);

    state = {...state, bookId: book};
  }
}
