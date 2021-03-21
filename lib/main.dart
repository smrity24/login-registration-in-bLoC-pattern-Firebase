import 'package:driver_application/repositories/user_repositories.dart';
import 'package:driver_application/screens/Signup.dart';
import 'package:driver_application/ui/home_screen.dart';
import 'package:driver_application/ui/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth/bloc/auth_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  UserRepository userRepository;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SignUpScreen(),
      // BlocProvider(
      //   create: (context) =>
      //       AuthBloc(userRepository: userRepository)..add(AppLoaded()),
      //   child: MainScreen(),
      // ),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is UnAuthenticateState) {
          return SplashScreen();
        } else if (state is AuthenticateState) {
          return HomeScreen();
        }

        return Container();
      },
    );
  }
}
//
