import 'package:core_project/core/error/failures.dart';
import 'package:core_project/core/usecases/usecase.dart';
import 'package:dartz/dartz.dart';
import '../repositories/number_trivia_repository.dart';

class GetRandomNumberTrivia implements UseCase<dynamic, NoParams> {
  final NumberTriviaRepository repository;

  GetRandomNumberTrivia(this.repository);

  @override
  Future<Either<Failure, dynamic>> call(NoParams params) async {
    return await repository.getRandomNumberTrivia();
  }
}
