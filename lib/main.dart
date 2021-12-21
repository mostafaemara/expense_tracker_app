import 'package:expense_tracker_app/src/presentation/bloc/auth/auth_cubit.dart';
import 'package:expense_tracker_app/src/presentation/bloc/login/login_cubit.dart';
import 'package:expense_tracker_app/src/presentation/bloc/signup/signup_cubit.dart';
import 'package:expense_tracker_app/src/presentation/bloc/splash/splash_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'firebase_options.dart';
import 'injection.dart';
import 'src/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  initializeDependencies();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(
    MultiBlocProvider(providers: [
      BlocProvider(
        create: (context) => AuthCubit()..checkAuthState(),
      ),
      BlocProvider(
        create: (context) => SplashCubit(BlocProvider.of<AuthCubit>(context)),
      ),
      BlocProvider(
        create: (context) => SignupCubit(BlocProvider.of<AuthCubit>(context)),
      ),
      BlocProvider(
        create: (context) => LoginCubit(BlocProvider.of<AuthCubit>(context)),
      )
    ], child: MyApp()),
  );
}
