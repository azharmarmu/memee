import 'package:dartz/dartz.dart';
import 'package:memee/domain/entities/app_error.dart';


abstract class UseCase<Type, Params> {
  Future<Either<AppError, Type>> call(Params params);
}
