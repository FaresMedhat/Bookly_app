import 'package:bloc/bloc.dart';
import 'package:bookly_app/core/errors_and_exeption/failure.dart';
import 'package:bookly_app/features/home_screen/data/model/book_model.dart';
import 'package:bookly_app/features/search_screen/data/repositories/search_repository.dart';
import 'package:meta/meta.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit({required this.searchRepository}) : super(SearchInitialState());
  final SearchRepository searchRepository;

  Future<void> fetchSearchedBooks(String query) async {
    emit(SearchLoadingState());
    var resultOfSearch = await searchRepository.searchOnBooks(query);
    resultOfSearch.fold(
      (failure) {
        print(
          "====== ERROR API in fetchSearchedBooks: ${failure.errorMessage} ======",
        );
        emit(SearchError(errorMessege: failure.errorMessage));
      },
      (books) {
        print("====== SUCCESS: Found ${books.length} books ======");
        emit(SearchSuccessState(books: books));
      },
    );
  }
}
