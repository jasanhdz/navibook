import 'package:go_router/go_router.dart';
import 'package:navibook/presentation/screens/screens.dart';

final appRouter = GoRouter(initialLocation: '/', routes: [
  GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
      routes: [
        GoRoute(
          path: 'books/:bookId',
          name: BookScreen.name,
          builder: (context, state) {
            final bookId = state.pathParameters['bookId'] ?? 'no-id';
            return BookScreen(bookId: bookId);
          },
        ),
      ]),
]);
