import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:navibook/infrastructure/datasources/openlibrary_datasource.dart';
import 'package:navibook/infrastructure/repositories/books_repository_impl.dart';

// Inmmutable repository
final bookRepositoryProvider = Provider((ref) {
  return BooksRepositoryImpl(OpenLibraryDataSource());
});
