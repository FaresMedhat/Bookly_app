import 'package:bookly_app/core/errors_and_exeption/failure.dart';
import 'package:bookly_app/core/utils/services/api_services.dart';
import 'package:bookly_app/features/home_screen/data/model/book_model.dart';
import 'package:bookly_app/features/home_screen/data/reposiories/home_reposiory.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepositoryImpl implements HomeReposiory {
  final ApiService apiService;

  HomeRepositoryImpl({required this.apiService});

  @override
  Future<Either<Failure, List<BookModel>>> getFeaturedBooks() async {
    try {
      var response = await apiService.getBooks(
        endPoints: "books/",
        queryParameters: {
          "search":
              "programming", // علامة النجمة تعني جلب كل الكتب من كافة التصنيفات
        },
      );

      final List<BookModel> books = [];
      for (var book in response['results']) {
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

  @override
  Future<Either<Failure, List<BookModel>>> getNewestBooks(
    String query,
    String sortOption,
  ) async {
    try {
      var response = await apiService.getBooks(
        endPoints: "books/",
        queryParameters: {
          "search": query.isEmpty ? "fiction" : query,
          if (sortOption.isNotEmpty) "sort": sortOption,
        },
      );
      final List<BookModel> books = [];
      for (var book in response['results']) {
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
