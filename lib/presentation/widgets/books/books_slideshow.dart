import 'package:animate_do/animate_do.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:navibook/domain/entities/book.dart';

class BooksSlideshow extends StatelessWidget {
  final List<Book> books;
  const BooksSlideshow({super.key, required this.books});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      height: 210,
      width: double.infinity,
      child: Swiper(
        scale: 0.9,
        viewportFraction: 0.8,
        autoplay: true,
        pagination: SwiperPagination(
            builder: DotSwiperPaginationBuilder(
                activeColor: colors.primary, color: colors.secondary)),
        itemCount: books.length,
        itemBuilder: (context, index) {
          final book = books[index];
          return _Slide(book: book);
        },
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Book book;
  const _Slide({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    final decoration = BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
              color: Colors.black45, blurRadius: 10, offset: Offset(0, 10))
        ]);

    return GestureDetector(
      onTap: () {
        final keyId = book.key.split('works/')[1];
        context.push('/home/0/books/$keyId');
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: DecoratedBox(
            decoration: decoration,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                book.coverImage,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress != null) {
                    return const DecoratedBox(
                      decoration: BoxDecoration(color: Colors.black12),
                    );
                  }
                  return FadeIn(child: child);
                },
              ),
            )),
      ),
    );
  }
}
