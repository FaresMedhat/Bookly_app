import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home_screen/data/model/book_model.dart';
import 'package:bookly_app/features/home_screen/data/reposiories/home_reposiory.dart';

import 'package:meta/meta.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.homeRepo) : super(FeaturedBooksInitial());
  final HomeReposiory homeRepo;

  Future<void> fetchFeaturedBooks() async {
    emit(FeaturedBooksLoadngState());
    var books = await homeRepo.getFeaturedBooks();
    books.fold(
      (failure) {
        print(
          "====== ERROR API in fetchFeaturedBooks: ${failure.errorMessage} ======",
        );
        emit(FeaturedBooksFailureState(errorMessage: failure.errorMessage));
      },
      (books) {
        print("====== SUCCESS: Found ${books.length} books ======");
        emit(FeaturedBooksSuccessState(books: books));
      },
    );
  }
}
