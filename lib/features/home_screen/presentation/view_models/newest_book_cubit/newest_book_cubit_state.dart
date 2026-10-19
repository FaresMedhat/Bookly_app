part of 'newest_book_cubit_cubit.dart';

@immutable
sealed class NewestBookCubitState {}

final class NewestBookCubitInitial extends NewestBookCubitState {}

final class NewestBookCubitLoadingState extends NewestBookCubitState {}

final class NewestBookCubitSuccessState extends NewestBookCubitState {
  final List<BookModel> books;

  NewestBookCubitSuccessState({required this.books});
}

final class NewestBookCubitFailureState extends NewestBookCubitState {
  final String errorMessage;

  NewestBookCubitFailureState({required this.errorMessage});
}
