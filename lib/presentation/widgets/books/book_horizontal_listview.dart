import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:navibook/config/helpers/human_formats.dart';
import 'package:navibook/domain/entities/book.dart';

class BookHorizontalListView extends StatelessWidget {
  final List<Book> books;
  final String? title;
  final String? subTitle;
  final VoidCallback? loadNextPage;

  const BookHorizontalListView(
      {super.key,
      required this.books,
      this.subTitle,
      this.title,
      this.loadNextPage});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: Column(
        children: [
          if (title != null || subTitle != null)
            _Title(
              title: title,
              subTitle: subTitle,
            ),
          Expanded(
            child: ListView.builder(
              itemCount: books.length,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return _Slide(book: books[index]);
              },
            ),
          )
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Book book;
  const _Slide({required this.book});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // *** Image ***
            SizedBox(
              width: 150,
              height: 220,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  fit: BoxFit.cover,
                  book.coverImage,
                  width: 150,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress != null) {
                      return const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CircularProgressIndicator(strokeWidth: 2),
                      );
                    }
                    return FadeIn(child: child);
                  },
                ),
              ),
            ),

            const SizedBox(height: 5),
            // ** Title **

            SizedBox(
              width: 150,
              child: Text(book.title, maxLines: 2, style: textStyle.titleSmall),
            ),

            // ** Rating **
            SizedBox(
              width: 150,
              child: Row(
                children: [
                  Icon(Icons.star_half_outlined, color: Colors.yellow.shade800),
                  const SizedBox(width: 3),
                  Text('${book.averageRating}',
                      style: textStyle.bodyMedium
                          ?.copyWith(color: Colors.yellow.shade800)),
                  const Spacer(),
                  Text(
                    HumanFormats.number(book.ratingsCount),
                    style: textStyle.bodySmall,
                  )
                ],
              ),
            )
          ],
        ));
  }
}

class _Title extends StatelessWidget {
  final String? title;
  final String? subTitle;
  const _Title({this.title, this.subTitle});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    return Container(
      padding: const EdgeInsets.only(top: 10),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          if (title != null) Text(title!, style: titleStyle),
          const Spacer(),
          if (subTitle != null)
            FilledButton.tonal(
                style: const ButtonStyle(visualDensity: VisualDensity.compact),
                onPressed: () {},
                child: Text(subTitle!))
        ],
      ),
    );
  }
}
