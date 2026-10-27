import 'package:bookly_app/core/dependncy_injection.dart';
import 'package:bookly_app/features/home_screen/data/model/book_model.dart';
import 'package:bookly_app/features/home_screen/data/reposiories/home_repository_impl.dart';
import 'package:bookly_app/features/home_screen/presentation/view/widgets/details_view_screen.dart';
import 'package:bookly_app/features/home_screen/presentation/view/home_screen.dart';
import 'package:bookly_app/features/home_screen/presentation/view_models/similler_books_cubit/similler_books_cubit.dart';
import 'package:bookly_app/features/search_screen/presentation/view/search_screen.dart';
import 'package:bookly_app/features/splash_screen/presentation/views/splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class Routers {
  static final String homeScreen = "/homeScreen";
  static final String detailsScreen = "/detailsScreen";
  static final String searchScreen = "/searchScreen";
  static final router = GoRouter(
    routes: [
      GoRoute(path: "/", builder: (context, state) => SplashScreen()),
      GoRoute(path: homeScreen, builder: (context, state) => HomeScreen()),
      GoRoute(
        path: detailsScreen,
        builder: (context, state) => BlocProvider(
          create: (context) =>
              SimillerBooksCubit(getIt.get<HomeRepositoryImpl>()),

          child: DetailsViewScreen(book: state.extra as BookModel),
        ),
      ),

      GoRoute(path: searchScreen, builder: (context, state) => SearchScreen()),
    ],
  );
}
