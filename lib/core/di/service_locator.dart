import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_nova/core/bloc/theme_bloc.dart';
import 'package:flutter_nova/features/auth/data/datasources/auth_remote_datasource_impl.dart';
import 'package:flutter_nova/features/auth/data/datasources/auth_remote_datasources.dart';
import 'package:flutter_nova/features/auth/data/datasources/auth_repository_impl.dart';
import 'package:flutter_nova/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_nova/features/auth/domain/usecases/anonymous_login_usecase.dart';
import 'package:flutter_nova/features/auth/domain/usecases/forgot_password_usecase.dart';
import 'package:flutter_nova/features/auth/domain/usecases/get_currentuser_usecase.dart';
import 'package:flutter_nova/features/auth/domain/usecases/google_signin_usecase.dart';
import 'package:flutter_nova/features/auth/domain/usecases/login_usecases.dart';
import 'package:flutter_nova/features/auth/domain/usecases/logout_usecase.dart';
import 'package:flutter_nova/features/auth/domain/usecases/register_usecase.dart';
import 'package:flutter_nova/features/auth/presentations/bloc/auth_bloc.dart';
import 'package:flutter_nova/features/questions/data/datasources/question_local_datasources.dart';
import 'package:flutter_nova/features/questions/data/datasources/question_local_datasources_impl.dart';
import 'package:flutter_nova/features/questions/data/repositories/question_repository_impl.dart';
import 'package:flutter_nova/features/questions/domain/repositories/question_repository.dart';
import 'package:flutter_nova/features/questions/domain/usecases/get_question_by_topic.dart';
import 'package:flutter_nova/features/questions/presentations/bloc/question_bloc.dart';
import 'package:flutter_nova/features/topics/data/datasources/topic_local_datasources.dart';
import 'package:flutter_nova/features/topics/data/datasources/topic_repository_impl.dart';
import 'package:flutter_nova/features/topics/data/datasources/topics_local_datasources_impl.dart';
import 'package:flutter_nova/features/topics/domain/repositories/topic_repository.dart';
import 'package:flutter_nova/features/topics/domain/usecases/get_topic_usecase.dart';
import 'package:flutter_nova/features/topics/presentations/bloc/topics_bloc.dart';
import 'package:get_it/get_it.dart';

final s1 = GetIt.instance;

Future<void> initCoreDepenencies() async {
  //Theme
  s1.registerFactory(() => ThemeBloc());

  //Firebase
  s1.registerLazySingleton(() => FirebaseAuth.instance);

  //Auth data source
  s1.registerLazySingleton<AuthRemoteDatasources>(
    () => AuthRemoteDatasourceImpl(s1()),
  );

  //Auth repository
  s1.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(s1()));

  //use cases
  s1.registerLazySingleton(() => LoginUsecase(s1()));
  s1.registerLazySingleton(() => LogoutUsecase(s1()));
  s1.registerLazySingleton(() => GetCurrentuserUsecase(s1()));

  s1.registerLazySingleton(() => ForgotPasswordUsecase(s1()));
  s1.registerLazySingleton(() => AnonymousLoginUsecase(s1()));
  s1.registerLazySingleton(() => GoogleSignInUsecase(s1()));
  s1.registerLazySingleton(() => RegisterUseCase(s1()));

  //Bloc
  s1.registerLazySingleton(
    () => AuthBloc(
      loginUsecase: s1(),
      logoutUsecase: s1(),
      getCurrentuserUsecase: s1(),
      forgotPasswordUsecase: s1(),
      anonymousLoginUsecase: s1(),
      registerUseCase: s1(),
    ),
  );

  // Topics
  s1.registerLazySingleton<TopicLocalDatasources>(
    () => TopicsLocalDatasourcesImpl(),
  );

  s1.registerLazySingleton<TopicRepository>(() => TopicRepositoryImpl(s1()));

  s1.registerLazySingleton(() => GetTopicUsecase(s1()));

  s1.registerFactory(() => TopicsBloc(getTopicUsecase: s1()));

  //Questions
  // Questions
  s1.registerLazySingleton<QuestionsLocalDataSource>(
    () => QuestionsLocalDataSourceImpl(),
  );

  s1.registerLazySingleton<QuestionsRepository>(
    () => QuestionsRepositoryImpl(s1()),
  );

  s1.registerLazySingleton<GetQuestionsByTopicUseCase>(
    () => GetQuestionsByTopicUseCase(s1()),
  );

  s1.registerFactory(() => QuestionsBloc(getQuestionsByTopicUseCase: s1()));
}
