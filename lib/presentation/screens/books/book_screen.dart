import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:navibook/domain/entities/book.dart';
import 'package:navibook/presentation/providers/books/book_info.provider.dart';

class BookScreen extends ConsumerStatefulWidget {
  static String name = 'book-screen';
  final String bookId;
  const BookScreen({super.key, required this.bookId});

  @override
  BookScreenState createState() => BookScreenState();
}

class BookScreenState extends ConsumerState<BookScreen> {
  @override
  void initState() {
    super.initState();

    ref.read(bookInfoProvider.notifier).loadBook(widget.bookId);
  }

  @override
  Widget build(BuildContext context) {
    final Book? book = ref.watch(bookInfoProvider)[widget.bookId];

    if (book == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
      );
    }

    return Scaffold(
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          _CustomSliverAppBart(book: book),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, index) => BookDetail(book: book),
                childCount: 1),
          )
        ],
      ),
    );
  }
}

class BookDetail extends StatelessWidget {
  final Book book;

  const BookDetail({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textStyle = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ** Image
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  book.coverImage,
                  width: size.width * 0.3,
                ),
              ),

              const SizedBox(width: 10),

              // ** Description
              SizedBox(
                width: (size.width - 40) * 0.7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${book.title}:', style: textStyle.titleLarge),
                    Text(book.description),
                  ],
                ),
              ),
            ],
          ),
        ),

        // ** Genre book
        Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Subjects:',
                style: textStyle.titleLarge,
              ),
              Wrap(
                children: [
                  ...book.subjects.map((subject) => Container(
                        margin: const EdgeInsets.only(right: 10),
                        child: Chip(
                          label: Text(subject),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                        ),
                      ))
                ],
              ),
            ],
          ),
        ),

        const SizedBox(height: 100)
      ],
    );
  }
}

class _CustomSliverAppBart extends StatelessWidget {
  final Book book;
  const _CustomSliverAppBart({required this.book});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SliverAppBar(
      backgroundColor: Colors.black,
      expandedHeight: size.height * 0.7,
      foregroundColor: Colors.white,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        title: Text(
          book.title,
          style: const TextStyle(fontSize: 20, color: Colors.white),
          textAlign: TextAlign.start,
        ),
        background: Stack(
          children: [
            SizedBox.expand(
                child: Image.network(
              book.coverImage,
              fit: BoxFit.cover,
            )),
            const SizedBox.expand(
              child: DecoratedBox(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0.7, 1.0],
                        colors: [Colors.transparent, Colors.black87])),
              ),
            ),
            const SizedBox.expand(
              child: DecoratedBox(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        stops: [0.0, 0.3],
                        colors: [Colors.black87, Colors.transparent])),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
