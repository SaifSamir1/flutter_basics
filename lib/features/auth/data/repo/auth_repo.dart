import 'package:dartz/dartz.dart';
import 'package:flutter_basics_app/features/auth/data/models/user_model.dart';

abstract class AuthRepo {
  Future<Either<String, UserModel>> signUp({
    required UserModel userModel,
    required String password,
  });

  Future<Either<String, UserModel>> login({
    required String email,
    required String password,
  });

  Future<Either<String, void>> logout();

}
