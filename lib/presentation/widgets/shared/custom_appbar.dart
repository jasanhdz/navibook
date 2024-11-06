import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:navibook/domain/entities/book.dart';
import 'package:navibook/presentation/delegates/search_movie_delegate.dart';
import 'package:navibook/presentation/providers/providers.dart';

class CustomAppBar extends ConsumerWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).colorScheme;
    final titleStyle = Theme.of(context).textTheme.titleMedium;

    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              Icon(Icons.book_outlined, color: colors.primary),
              const SizedBox(width: 5),
              Text('NaviBook', style: titleStyle),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  final searchedBooks = ref.read(searchedBooksProvider);
                  final searchQuery = ref.read(searchQueryProvider);

                  showSearch<Book?>(
                          query: searchQuery,
                          context: context,
                          delegate: SearchBooksDelegate(
                              initialBooks: searchedBooks,
                              searchBooks: ref
                                  .read(searchedBooksProvider.notifier)
                                  .searchBooksByQuery))
                      .then((book) {
                    if (book != null) {
                      final keyId = book.key.split('works/')[1];
                      context.push('/books/$keyId');
                    }
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
