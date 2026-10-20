import 'package:bloc/bloc.dart';

import 'package:bookly_app/features/home_screen/data/model/book_model.dart';
import 'package:bookly_app/features/home_screen/data/reposiories/home_reposiory.dart';
import 'package:meta/meta.dart';

part 'newest_book_cubit_state.dart';

class NewestBookCubit extends Cubit<NewestBookCubitState> {
  NewestBookCubit(this.homeRepo) : super(NewestBookCubitInitial());
  final HomeReposiory homeRepo;

  Future<void> fetchNewestBooks(String? query, String? sortOption) async {
    emit(NewestBookCubitLoadingState());
    var newestBooks = await homeRepo.getNewestBooks(
      query ?? "*",
      sortOption ?? "newest",
    );
    newestBooks.fold(
      (failure) =>
          emit(NewestBookCubitFailureState(errorMessage: failure.errorMessage)),
      (books) => emit(NewestBookCubitSuccessState(books: books)),
    );
  }
}
