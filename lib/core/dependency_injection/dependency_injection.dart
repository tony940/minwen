import 'package:get_it/get_it.dart';
import 'package:minwen/features/auth/login/data/repo/login_repo_impl.dart';
import 'package:minwen/features/auth/login/presentation/cubits/cubit/login_cubit.dart';

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
}
