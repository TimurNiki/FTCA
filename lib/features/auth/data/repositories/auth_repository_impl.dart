import 'package:flutter_clean_arc_application/core/common/entities/user.dart';
import 'package:flutter_clean_arc_application/core/errors/exception.dart';
import 'package:flutter_clean_arc_application/core/errors/failure.dart';
import 'package:flutter_clean_arc_application/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:flutter_clean_arc_application/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl(this.authRemoteDataSource);
  @override
  Future<Either<Failure, User>> signIn(
      {required String email, required String password}) async{
  try {
      final userId = await authRemoteDataSource.signIn(
          email: email, password: password,);
      return right(userId);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
      }

  @override
  Future<Either<Failure, User>> signUp(
      {required String email,
      required String password,
      required String name}) async {
    try {
      final userId = await authRemoteDataSource.signUp(
          email: email, password: password, name: name);
      return right(userId);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
  
  @override
  Future<Either<Failure, User>> currentUser() {
    // TODO: implement currentUser
    throw UnimplementedError();
  }
}

