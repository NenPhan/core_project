import 'package:core_project/core/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class NumberTriviaRepository {
  Future<Either<Failure, dynamic>> getConcreteNumberTrivia(int number);
  Future<Either<Failure, dynamic>> getRandomNumberTrivia();
}
