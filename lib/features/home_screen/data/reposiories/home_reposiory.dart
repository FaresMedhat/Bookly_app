import 'package:bookly_app/core/errors_and_exeption/failure.dart';
import 'package:bookly_app/features/home_screen/data/model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeReposiory {
  Future<Either<Failure, List<BookModel>>> getNewestBooks(
    String query,
    String sortOption,
  );
  Future<Either<Failure, List<BookModel>>> getFeaturedBooks();
}
