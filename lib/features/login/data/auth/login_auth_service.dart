import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutex/core/utils/snackbar/custom_snackbar.dart';
import 'package:flutex/features/login/data/auth/ilogin_auth_service.dart';

class LoginAuthService implements LoginAuthServiceInterface {
  @override
  Future<User?> registerUsingEmailPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      user = userCredential.user;
      await user!.updateProfile(displayName: name);
      await user.reload();
      user = auth.currentUser;
      if (user != null) {
        return user;
      }
    } on FirebaseAuthException catch (e) {
      CustomSnackBar.showSnackBar(message: e.message.toString());
      rethrow;
    } catch (e) {
      CustomSnackBar.showSnackBar(message: "Something went wrong");
      rethrow;
    }
    return null;
  }

  @override
  Future<User?> signInUsingEmailPassword({
    required String email,
    required String password,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
      user = auth.currentUser;
      if (user != null) {
        return user;
      }
    } on FirebaseAuthException catch (e) {
      CustomSnackBar.showSnackBar(message: e.message.toString());
      rethrow;
    } catch (e) {
      CustomSnackBar.showSnackBar(message: "Something went wrong");
      rethrow;
    }
    return null;
  }
}
