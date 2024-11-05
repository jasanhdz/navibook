import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:navibook/domain/datasources/books_datasource.dart';
import 'package:navibook/domain/entities/book.dart';
import 'package:navibook/presentation/providers/providers.dart';

final booksSlideshowProvider =
    Provider.family<List<Book>, Subject>((ref, category) {
  final books = ref.watch(booksProvider(category));

  if (books.isEmpty) return [];

  return books.length < 6 ? books : books.sublist(0, 6);
});
