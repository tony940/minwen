import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:minwen/features/auth/login/data/repo/login_repo_impl.dart';
import 'package:minwen/features/auth/login/presentation/cubits/cubit/login_cubit.dart';
import 'package:minwen/features/notification/presentation/cubit/notification_cubit.dart';
import 'package:minwen/features/posts/presentation/cubit/create_post_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // 1. Register the Repository
  // Note: If LoginRepoImpl requires a Dio or ApiService instance, pass it here.
  getIt.registerLazySingleton<LoginRepoImpl>(() => LoginRepoImpl());

  // 2. Register the Cubit
  getIt.registerFactory<LoginCubit>(
    () => LoginCubit(
        getIt<LoginRepoImpl>()), // Added parentheses () to call getIt
  );
  getIt.registerFactory<NotificationCubit>(
    () => NotificationCubit(), // Added parentheses () to call getIt
  );
  getIt.registerFactory<CreatePostCubit>(
    () => CreatePostCubit(), // Added parentheses () to call getIt
  );
}
