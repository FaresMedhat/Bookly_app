part of 'featured_books_cubit.dart';

@immutable
sealed class FeaturedBooksState {}

final class FeaturedBooksInitial extends FeaturedBooksState {}

final class FeaturedBooksLoadngState extends FeaturedBooksState {}

final class FeaturedBooksSuccessState extends FeaturedBooksState {
  final List<BookModel> books;

  FeaturedBooksSuccessState({required this.books});
}

final class FeaturedBooksFailureState extends FeaturedBooksState {
  final String errorMessage;

  FeaturedBooksFailureState({required this.errorMessage});
}
