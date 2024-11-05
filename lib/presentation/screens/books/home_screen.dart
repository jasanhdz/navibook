import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:navibook/domain/datasources/books_datasource.dart';
import 'package:navibook/presentation/providers/providers.dart';
import 'package:navibook/presentation/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeView(),
      bottomNavigationBar: CustomBottomNavigation(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState {
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
                        books: books, title: 'Populares', subTitle: 'Lunes 20');
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
