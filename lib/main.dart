import 'package:expense_tracker_app/src/presentation/bloc/auth/auth_cubit.dart';
import 'package:expense_tracker_app/src/presentation/bloc/signup/signup_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'injection.dart';
import 'src/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  initializeDependencies();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(
    MultiBlocProvider(providers: [
      BlocProvider(
        create: (context) => AuthCubit(),
      ),
      BlocProvider(
        create: (context) => SignupCubit(BlocProvider.of<AuthCubit>(context)),
      )
    ], child: MyApp()),
  );
}
