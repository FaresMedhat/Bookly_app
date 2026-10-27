import 'package:bookly_app/features/home_screen/data/reposiories/home_reposiory.dart';
import 'package:bookly_app/features/home_screen/presentation/view_models/similler_books_cubit/similler_books_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimillerBooksCubit extends Cubit<SimillerBooksState> {
  SimillerBooksCubit(this.homeRepo) : super(SimillerBooksInitial());
  final HomeReposiory homeRepo;
  Future<void> fetchSimillerBooks({required String category}) async {
    emit(SimillerBooksLoadingState());
    var books = await homeRepo.getSimillerBooks(category);
    books.fold(
      (failure) {
        print(
          "====== ERROR API in fetchSimillerBooks: ${failure.errorMessage} ======",
        );
        emit(SimillerBooksFailureState(errorMessage: failure.errorMessage));
      },
      (books) {
        print("====== SUCCESS: Found ${books.length} books ======");
        emit(SimillerBooksSuccessState(books: books));
      },
    );
  }
}
