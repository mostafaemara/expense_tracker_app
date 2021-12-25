import 'package:expense_tracker_app/src/bloc/accounts/accounts_cubit.dart';
import 'package:expense_tracker_app/src/bloc/categories/categories_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'firebase_options.dart';
import 'injection.dart';
import 'src/app.dart';
import 'src/bloc/auth/auth_cubit.dart';
import 'src/bloc/login/login_cubit.dart';
import 'src/bloc/signup/signup_cubit.dart';

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
        lazy: false,
        create: (context) => AuthCubit(),
      ),
      BlocProvider(
        lazy: false,
        create: (context) => CategoriesCubit()..init(),
      ),
      BlocProvider(
        lazy: false,
        create: (context) => AccountsCubit(BlocProvider.of<AuthCubit>(context)),
      ),
      BlocProvider(
        lazy: false,
        create: (context) => SignupCubit(BlocProvider.of<AuthCubit>(context)),
      ),
      BlocProvider(
        lazy: false,
        create: (context) => LoginCubit(BlocProvider.of<AuthCubit>(context)),
      )
    ], child: MyApp()),
  );
}
