// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const SplashPage());
    },
    OnBoardingRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const OnBoardingPage());
    },
    SignupRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const SignupPage());
    },
    LoginRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const LoginPage());
    },
    RestPasswordRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const RestPasswordPage());
    },
    SetupAccountRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const SetupAccountPage());
    },
    AddNewAccountRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const AddNewAccountPage());
    },
    AccountAllSetRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const AccountAllSetPage());
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(SplashRoute.name, path: '/splash-page'),
        RouteConfig(OnBoardingRoute.name, path: '/on-boarding-page'),
        RouteConfig(SignupRoute.name, path: '/signup-page'),
        RouteConfig(LoginRoute.name, path: '/login-page'),
        RouteConfig(RestPasswordRoute.name, path: '/rest-password-page'),
        RouteConfig(SetupAccountRoute.name, path: '/setup-account-page'),
        RouteConfig(AddNewAccountRoute.name, path: '/add-new-account-page'),
        RouteConfig(AccountAllSetRoute.name, path: '/')
      ];
}

/// generated route for [SplashPage]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute() : super(name, path: '/splash-page');

  static const String name = 'SplashRoute';
}

/// generated route for [OnBoardingPage]
class OnBoardingRoute extends PageRouteInfo<void> {
  const OnBoardingRoute() : super(name, path: '/on-boarding-page');

  static const String name = 'OnBoardingRoute';
}

/// generated route for [SignupPage]
class SignupRoute extends PageRouteInfo<void> {
  const SignupRoute() : super(name, path: '/signup-page');

  static const String name = 'SignupRoute';
}

/// generated route for [LoginPage]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute() : super(name, path: '/login-page');

  static const String name = 'LoginRoute';
}

/// generated route for [RestPasswordPage]
class RestPasswordRoute extends PageRouteInfo<void> {
  const RestPasswordRoute() : super(name, path: '/rest-password-page');

  static const String name = 'RestPasswordRoute';
}

/// generated route for [SetupAccountPage]
class SetupAccountRoute extends PageRouteInfo<void> {
  const SetupAccountRoute() : super(name, path: '/setup-account-page');

  static const String name = 'SetupAccountRoute';
}

/// generated route for [AddNewAccountPage]
class AddNewAccountRoute extends PageRouteInfo<void> {
  const AddNewAccountRoute() : super(name, path: '/add-new-account-page');

  static const String name = 'AddNewAccountRoute';
}

/// generated route for [AccountAllSetPage]
class AccountAllSetRoute extends PageRouteInfo<void> {
  const AccountAllSetRoute() : super(name, path: '/');

  static const String name = 'AccountAllSetRoute';
}
