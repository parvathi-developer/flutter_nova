import 'package:flutter_nova/features/auth/data/datasources/auth_remote_datasources.dart';
import 'package:flutter_nova/features/auth/data/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRemoteDatasourceImpl extends AuthRemoteDatasources {
  final FirebaseAuth firebaseAuth;
  AuthRemoteDatasourceImpl(this.firebaseAuth);
  @override
  Future<UserModel?> getCurrentUser() async {
    final user = firebaseAuth.currentUser;
    if (user == null) return null;
    return UserModel.fromFirebase(id: user.uid, email: user.email ?? '');
  }

  @override
  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    final result = await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    final user = result.user!;
    return UserModel(id: user.uid, email: user.email ?? '');
  }

  @override
  Future<void> logout() async {
    await firebaseAuth.signOut();
  }

  @override
  Future<void> sendPasswordReset(String email) {
    return firebaseAuth.sendPasswordResetEmail(email: email);
  }

  @override
  Future<UserModel> signInAnonymously() async {
    final result = await firebaseAuth.signInAnonymously();
    return UserModel(id: result.user!.uid, email: 'Guest');
  }

  @override
  Future<UserModel> signInWithGoogle() {
    // TODO: implement signInWithGoogle
    throw UnimplementedError();
  }
}
