import 'package:dartz/dartz.dart';
import 'package:minwen/core/errors/failure.dart';
import 'package:minwen/features/auth/login/data/models/user_model.dart';
import 'package:minwen/features/auth/login/data/repo/login_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:hive/hive.dart';

class LoginRepoImpl implements LoginRepo {
  @override
  Future<Either<Failure, UserModel>> login({
    required String email,
    required String password,
  }) async {
    throw Exception();
  }
}
