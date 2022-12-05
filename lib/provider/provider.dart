// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class AuthWidgetBuilder extends StatelessWidget {
//   const AuthWidgetBuilder({Key? key, required this.builder}) : super(key: key);
//   final Widget Function(BuildContext, AsyncSnapshot<MyAppUser>) builder;

//   @override
//   Widget build(BuildContext context) {
//     final authService = Provider.of<AuthService>(context, listen: false);
//     return StreamBuilder<MyAppUser>(
//       stream: authService.onAuthStateChanged,
//       builder: (BuildContext context, AsyncSnapshot<MyAppUser> snapshot) {
//         final MyAppUser user = snapshot.data as MyAppUser;
//         if (user != null) {
//           return MultiProvider(
//             providers: [
//               Provider<MyAppUser>.value(value: user),
//               // NOTE: Any other user-bound providers here can be added here
//             ],
//             child: builder(context, snapshot),
//           );
//         }
//         return builder(context, snapshot);
//       },
//     );
//   }
// }

// @immutable
// class MyAppUser {
//   const MyAppUser({
//     required this.uid,
//     this.email,
//     this.photoUrl,
//     this.displayName,
//   });

//   final String uid;
//   final String? email;
//   final String? photoUrl;
//   final String? displayName;
// }

// abstract class AuthService {
//   Future<MyAppUser> currentUser();
//   Future<MyAppUser> signInAnonymously();
//   Future<MyAppUser> signInWithEmailAndPassword(String email, String password);
//   Future<MyAppUser> createUserWithEmailAndPassword(
//       String email, String password);
//   Future<void> sendPasswordResetEmail(String email);
//   Future<MyAppUser> signInWithEmailAndLink({String email, String link});
//   bool isSignInWithEmailLink(String link);
//   Future<void> sendSignInWithEmailLink({
//     @required String email,
//     @required String url,
//     @required bool handleCodeInApp,
//     @required String iOSBundleId,
//     @required String androidPackageName,
//     @required bool androidInstallApp,
//     @required String androidMinimumVersion,
//   });

//   Future<void> signOut();
//   Stream<MyAppUser> get onAuthStateChanged;
//   void dispose();
// }
