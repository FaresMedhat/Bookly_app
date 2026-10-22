import 'package:bookly_app/core/dependncy_injection.dart';
import 'package:bookly_app/core/utils/routers.dart';
import 'package:bookly_app/features/home_screen/data/reposiories/home_repository_impl.dart';
import 'package:bookly_app/features/home_screen/presentation/view_models/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app/features/home_screen/presentation/view_models/newest_book_cubit/newest_book_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

void main() {
  setup();
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              FeaturedBooksCubit(getIt.get<HomeRepositoryImpl>()),
        ),
        BlocProvider(
          create: (context) =>
              NewestBookCubit(getIt.get<HomeRepositoryImpl>())
                ..fetchNewestBooks("sport", "new"),
        ),
      ],
      child: MaterialApp.router(
        darkTheme: ThemeData.dark(),
        routerConfig: Routers.router,
      ),
    );
  }
}
