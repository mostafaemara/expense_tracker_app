import 'package:expense_tracker_app/src/bloc/splash/splash_cubit.dart';
import 'package:expense_tracker_app/src/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late SplashCubit _splashBloc;

  @override
  void didChangeDependencies() {
    _splashBloc = SplashCubit();
    _splashBloc.init();

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: BlocListener<SplashCubit, SplashState>(
          bloc: _splashBloc,
          listener: (context, state) => state.whenOrNull(
                redirectToHome: () => context.replaceRoute(const MainRoute()),
                redirectToLogin: () =>
                    context.replaceRoute(const OnBoardingRoute()),
                redirectToSetUpAccount: () =>
                    context.replaceRoute(const SetupAccountRoute()),
              ),
          child: Center(
            child: Image.asset("assets/images/expense_tracker_logo.png"),
          )),
    );
  }
}
