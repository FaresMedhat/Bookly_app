import 'package:bookly_app/core/errors_and_exeption/failure.dart';
import 'package:bookly_app/core/utils/services/api_services.dart';
import 'package:bookly_app/features/home_screen/data/model/book_model.dart';
import 'package:bookly_app/features/search_screen/data/repositories/search_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepositoyImpl extends SearchRepository {
  final ApiService apiService;

  SearchRepositoyImpl({required this.apiService});
  @override
  Future<Either<Failure, List<BookModel>>> searchOnBooks(String query) async {
    try {
      var response = await apiService.getBooks(
        endPoints: "volumes",
        queryParameters: {
          "q": query.isEmpty ? "programming" : query,
          "maxResults": "30",
        },
      );
      final List<BookModel> books = [];
      for (var book in response['items']) {
        books.add(BookModel.fromJson(book));
      }
      return Right(books);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
