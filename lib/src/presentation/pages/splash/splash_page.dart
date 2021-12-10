import 'package:expense_tracker_app/src/presentation/bloc/auth/auth_cubit.dart';
import 'package:expense_tracker_app/src/presentation/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void didChangeDependencies() {
    context.read<AuthCubit>().checkAuthState();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: BlocListener<AuthCubit, AuthState>(
          listener: (context, state) => state.whenOrNull(
                authenticated: (user) => context.navigateTo(
                  const MainRoute(),
                ),
                notAuthenticated: () =>
                    context.navigateTo(const OnBoardingRoute()),
              ),
          child: Center(
            child: Image.asset("assets/images/expense_tracker_logo.png"),
          )),
    );
  }
}
