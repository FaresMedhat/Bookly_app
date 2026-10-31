part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitialState extends SearchState {}

final class SearchLoadingState extends SearchState {}

final class SearchSuccessState extends SearchState {
  final List<BookModel> books;

  SearchSuccessState({required this.books});
}

final class SearchError extends SearchState {
  final String errorMessege;

  SearchError({required this.errorMessege});
}
