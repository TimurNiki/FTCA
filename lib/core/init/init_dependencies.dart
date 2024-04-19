import 'package:flutter_clean_arc_application/features/auth/domain/repository/auth_repository.dart';
import 'package:flutter_clean_arc_application/features/auth/domain/usecases/usecases.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../features/auth/data/datasources/auth_remote_data_source.dart';
import '../../features/auth/data/repositories/auth_repository_impl.dart';

final serviceLocator = GetIt.asNewInstance();
Future<void> initDependencies() async {
  _initAuth();
  final supabase = await Supabase.initialize(
      url: "", anonKey: "AppSecrets.supabaseAnonKey,");

  serviceLocator.registerLazySingleton(() => supabase.client);
}

void _initAuth() {
  serviceLocator
    ..registerFactory<AuthRemoteDataSource>(
        () => AuthRemoteDataSourceImpl(serviceLocator()))
    ..registerFactory<AuthRepository>(
        () => AuthRepositoryImpl(serviceLocator()))
    ..registerFactory(() => UserSignUp(serviceLocator()))
    ..registerFactory(() => UserLogin(serviceLocator()))
    ..registerFactory(() => CurrentUser(serviceLocator()));
}
