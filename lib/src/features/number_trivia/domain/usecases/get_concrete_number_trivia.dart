import 'package:core_project/core/error/failures.dart';
import 'package:core_project/core/usecases/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import '../repositories/number_trivia_repository.dart';

class GetConcreteNumberTrivia implements UseCase<dynamic, Params> {
  final NumberTriviaRepository repository;

  GetConcreteNumberTrivia(this.repository);

  @override
  Future<Either<Failure, dynamic>> call(Params params) async {
    return await repository.getConcreteNumberTrivia(params.number!);
  }
}

class Params {
  int? number;

  Params({@required this.number});
}
