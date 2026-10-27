import 'package:bookly_app/features/home_screen/data/model/book_model.dart';

class SimillerBooksState {}

class SimillerBooksInitial extends SimillerBooksState {}

class SimillerBooksLoadingState extends SimillerBooksState {}

class SimillerBooksSuccessState extends SimillerBooksState {
  final List<BookModel> books;
  SimillerBooksSuccessState({required this.books});
}

class SimillerBooksFailureState extends SimillerBooksState {
  final String errorMessage;
  SimillerBooksFailureState({required this.errorMessage});
}
