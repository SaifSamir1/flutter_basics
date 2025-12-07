import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_basics_app/features/auth/data/models/user_model.dart';
import 'package:flutter_basics_app/features/auth/data/repo/auth_repo.dart';

class AuthRepoIplm extends AuthRepo {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  @override
  Future<Either<String, UserModel>> login({
    required String email,
    required String password,
  }) async{
    try {

      final creidential  = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

    if(creidential.user == null){
      return Left('User creation failed');
    }
    final user = UserModel(
      id: creidential.user!.uid,
      name: creidential.user!.displayName ?? '',
      email: creidential.user!.email ?? '',
      phoneNumber: creidential.user!.phoneNumber ?? '',
    );
     return Right(user);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, void>> logout() async {
    try {
      await firebaseAuth.signOut();
      return Right(null);
    } catch (e) {
      return Left(e.toString());
    }
   
   
  }

  @override
  Future<Either<String, UserModel>> signUp({
    required UserModel userModel,
    required String password,
  }) async {
    try {

      final creidential  = await firebaseAuth.createUserWithEmailAndPassword(
        email: userModel.email,
        password: password,
      );

    if(creidential.user == null){
      return Left('User creation failed');
    }
    return Right(userModel);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
