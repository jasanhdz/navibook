import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:navibook/domain/datasources/books_datasource.dart';
import 'package:navibook/presentation/providers/providers.dart';
import 'package:navibook/presentation/widgets/widgets.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends ConsumerState {
  final List<Subject> categories = [
    Subject.horror,
    Subject.ancient_civilization,
    Subject.juvenile_literature,
  ];

  @override
  void initState() {
    super.initState();
    ref.read(booksProvider(Subject.fantasy).notifier).loadNextPage();
    for (var category in categories) {
      ref.read(booksProvider(category).notifier).loadNextPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    final slideShowBooks = ref.watch(booksSlideshowProvider(Subject.fantasy));

    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            title: CustomAppBar(),
          ),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate(
          (context, index) {
            return Column(
              children: [
                BooksSlideshow(books: slideShowBooks),
                Column(
                  children: categories.map((category) {
                    final books = ref.watch(booksSlideshowProvider(category));
                    return BookHorizontalListView(
                        books: books,
                        title: category.asString,
                        subTitle: 'Monday 20');
                  }).toList(),
                )
              ],
            );
          },
          childCount: 1,
        ))
      ],
    );
  }
}
