import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_nova/features/auth/data/datasources/auth_remote_datasource_impl.dart';
import 'package:flutter_nova/features/auth/data/datasources/auth_remote_datasources.dart';
import 'package:flutter_nova/features/auth/data/datasources/auth_repository_impl.dart';
import 'package:flutter_nova/features/auth/domain/repositories/auth_repository.dart';
import 'package:get_it/get_it.dart';

final s1 = GetIt.instance;

Future<void> initCoreDepenencies() async {
  //Firebase

  s1.registerLazySingleton(() => FirebaseAuth.instance);

  //Auth data source
  s1.registerLazySingleton<AuthRemoteDatasources>(
    () => AuthRemoteDatasourceImpl(s1()),
  );

  //Auth repository
  s1.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(s1()));
}
