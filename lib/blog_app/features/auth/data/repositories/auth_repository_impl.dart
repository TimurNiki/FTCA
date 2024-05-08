import 'package:fpdart/fpdart.dart';
import '../../../../core/common/entities/user.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/errors/exception.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/network/connection_checker.dart';
import '../../domain/repository/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';
import '../models/user_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  final ConnectionChecker connectionChecker;

  AuthRepositoryImpl(this.authRemoteDataSource, this.connectionChecker);
  @override
  Future<Either<Failure, User>> signIn(
      {required String email, required String password}) async {
    return _getUser(
      () async => await authRemoteDataSource.signIn(
        email: email,
        password: password,
      ),
    );
  }

  @override
  Future<Either<Failure, User>> signUp(
      {required String email,
      required String password,
      required String name}) async {
    return _getUser(() async => await authRemoteDataSource.signUp(
        email: email, password: password, name: name));
  }

  @override
  Future<Either<Failure, User>> currentUser() async {
    try {
      if (!await (connectionChecker.isConnected)) {
        final session = authRemoteDataSource.currentUserSession;

        if (session == null) {
          return left(Failure('User not logged in!'));
        }
        return right(
          UserModel(
            id: session.user.id,
            email: session.user.email ?? '',
            name: '',
          ),
        );
      }
      final user = await authRemoteDataSource.getCurrentUserData();
      if (user == null) {
        return left(Failure('User not logged in!'));
      }

      return right(user);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  Future<Either<Failure, User>> _getUser(
    Future<User> Function() fn,
  ) async {
    try {
      if (!await (connectionChecker.isConnected)) {
        return left(Failure(Constants.noConnection));
      }
      final user = await fn();
      return right(user);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
