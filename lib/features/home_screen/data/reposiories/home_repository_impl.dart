import 'package:bookly_app/core/errors_and_exeption/failure.dart';
import 'package:bookly_app/core/utils/api_services.dart';
import 'package:bookly_app/features/home_screen/data/model/book_model.dart';
import 'package:bookly_app/features/home_screen/data/reposiories/home_reposiory.dart';
import 'package:dartz/dartz.dart';

class HomeRepositoryImpl implements HomeReposiory {
  final ApiService apiService;

  HomeRepositoryImpl({required this.apiService});
  @override
  Future<Either<Failure, List<BookModel>>> getBooks(
    String query,
    String sortOption,
  ) async {
    try {
      var response = await apiService.getBooks(
        endPoints: "search.json?",
        queryParameters: {
          "q": query,
          if (sortOption.isNotEmpty) "sort": sortOption,
        },
      );
      final List<BookModel> books = [];
      for (var book in response['docs']) {
        books.add(BookModel.fromJson(book));
      }
      return Right(books);
    } on Exception catch (e) {
      return left(servesFaiure());
    }
  }

  @override
  Future<Either<Failure, BookModel>> getFeaturedBooks() {
    throw UnimplementedError();
  }
}
