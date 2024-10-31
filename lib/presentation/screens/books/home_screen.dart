import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:navibook/presentation/providers/books/books_providers.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeView(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView({
    super.key,
  });

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState {
  @override
  void initState() {
    super.initState();
    ref.read(fantasyBooksProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final fantasyBooks = ref.watch(fantasyBooksProvider);

    print(fantasyBooks.length);

    return ListView.builder(
      itemCount: fantasyBooks.length,
      itemBuilder: (context, index) {
        final book = fantasyBooks[index];
        return ListTile(
          title: Text(book.title),
        );
      },
    );
  }
}
