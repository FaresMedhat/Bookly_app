import 'package:bloc/bloc.dart';

import 'package:bookly_app/features/home_screen/data/model/book_model.dart';
import 'package:bookly_app/features/home_screen/data/reposiories/home_reposiory.dart';
import 'package:meta/meta.dart';

part 'newest_book_cubit_state.dart';

class NewestBookCubit extends Cubit<NewestBookCubitState> {
  NewestBookCubit(this.homeRepo) : super(NewestBookCubitInitial());
  final HomeReposiory homeRepo;

  Future<void> fetchNewestBooks({String? query, String? sortOption}) async {
    emit(NewestBookCubitLoadingState());
    var newestBooks = await homeRepo.getNewestBooks(
      query ?? "computer science",
    );
    newestBooks.fold(
      (failure) {
        print(
          "====== ERROR API in fetchNewestBooks: ${failure.errorMessage} ======",
        );
        emit(NewestBookCubitFailureState(errorMessage: failure.errorMessage));
      },
      (books) {
        print("====== SUCCESS: Found ${books.length} books ======");
        emit(NewestBookCubitSuccessState(books: books));
      },
    );
  }
}
