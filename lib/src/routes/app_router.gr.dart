// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const SplashPage(),
      );
    },
    OnBoardingRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const OnBoardingPage(),
      );
    },
    FinancialReportRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const FinancialReportPage(),
      );
    },
    SignupRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const SignupPage(),
      );
    },
    TransactionDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<TransactionDetailsRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: TransactionDetailsPage(
          key: args.key,
          transaction: args.transaction,
        ),
      );
    },
    LoginRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const LoginPage(),
      );
    },
    RestPasswordRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const RestPasswordPage(),
      );
    },
    EmailSentRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const EmailSentPage(),
      );
    },
    SetupAccountRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const SetupAccountPage(),
      );
    },
    AddNewAccountRoute.name: (routeData) {
      final args = routeData.argsAs<AddNewAccountRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: AddNewAccountPage(
          key: args.key,
          account: args.account,
          isSetupAccount: args.isSetupAccount,
        ),
      );
    },
    AccountAllSetRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const AccountAllSetPage(),
      );
    },
    NewTransactionRoute.name: (routeData) {
      final args = routeData.argsAs<NewTransactionRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: NewTransactionPage(
          key: args.key,
          transactionType: args.transactionType,
        ),
      );
    },
    NewTransferRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const NewTransferPage(),
      );
    },
    NotificationRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const NotificationPage(),
      );
    },
    FinancialDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<FinancialDetailsRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: FinancialDetailsPage(
          key: args.key,
          financialReport: args.financialReport,
        ),
      );
    },
    NewBudgetRoute.name: (routeData) {
      final args = routeData.argsAs<NewBudgetRouteArgs>(
          orElse: () => const NewBudgetRouteArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: NewBudgetPage(
          key: args.key,
          budget: args.budget,
        ),
      );
    },
    AccountsRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const AccountsPage(),
      );
    },
    AccountDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<AccountDetailsRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: AccountDetailsPage(
          key: args.key,
          account: args.account,
        ),
      );
    },
    BudgetDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<BudgetDetailsRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: BudgetDetailsPage(
          key: args.key,
          budget: args.budget,
        ),
      );
    },
    SettingsRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const SettingsPage(),
      );
    },
    AboutRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const AboutPage(),
      );
    },
    CurrencyRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const CurrencyPage(),
      );
    },
    LanguageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const LanguagePage(),
      );
    },
    ThemeRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const ThemePage(),
      );
    },
    EditeProfileRoute.name: (routeData) {
      final args = routeData.argsAs<EditeProfileRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: EditeProfilePage(
          key: args.key,
          user: args.user,
        ),
      );
    },
    MainRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const MainPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    TransactionRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const TransactionPage(),
      );
    },
    BudgetRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const BudgetPage(),
      );
    },
    ProfileRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const ProfilePage(),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          SplashRoute.name,
          path: '/',
        ),
        RouteConfig(
          OnBoardingRoute.name,
          path: '/on-boarding-page',
        ),
        RouteConfig(
          FinancialReportRoute.name,
          path: '/financial-report-page',
        ),
        RouteConfig(
          SignupRoute.name,
          path: '/signup-page',
        ),
        RouteConfig(
          TransactionDetailsRoute.name,
          path: '/transaction-details-page',
        ),
        RouteConfig(
          LoginRoute.name,
          path: '/login-page',
        ),
        RouteConfig(
          RestPasswordRoute.name,
          path: '/rest-password-page',
        ),
        RouteConfig(
          EmailSentRoute.name,
          path: '/email-sent-page',
        ),
        RouteConfig(
          SetupAccountRoute.name,
          path: '/setup-account-page',
        ),
        RouteConfig(
          AddNewAccountRoute.name,
          path: '/add-new-account-page',
        ),
        RouteConfig(
          AccountAllSetRoute.name,
          path: '/account-all-set-page',
        ),
        RouteConfig(
          NewTransactionRoute.name,
          path: '/new-transaction-page',
        ),
        RouteConfig(
          NewTransferRoute.name,
          path: '/new-transfer-page',
        ),
        RouteConfig(
          NotificationRoute.name,
          path: '/notification-page',
        ),
        RouteConfig(
          FinancialDetailsRoute.name,
          path: '/financial-details-page',
        ),
        RouteConfig(
          NewBudgetRoute.name,
          path: '/new-budget-page',
        ),
        RouteConfig(
          AccountsRoute.name,
          path: '/accounts-page',
        ),
        RouteConfig(
          AccountDetailsRoute.name,
          path: '/account-details-page',
        ),
        RouteConfig(
          BudgetDetailsRoute.name,
          path: '/budget-details-page',
        ),
        RouteConfig(
          SettingsRoute.name,
          path: '/settings-page',
        ),
        RouteConfig(
          AboutRoute.name,
          path: '/about-page',
        ),
        RouteConfig(
          CurrencyRoute.name,
          path: '/currency-page',
        ),
        RouteConfig(
          LanguageRoute.name,
          path: '/language-page',
        ),
        RouteConfig(
          ThemeRoute.name,
          path: '/theme-page',
        ),
        RouteConfig(
          EditeProfileRoute.name,
          path: '/edite-profile-page',
        ),
        RouteConfig(
          MainRoute.name,
          path: '/',
          children: [
            RouteConfig(
              '#redirect',
              path: '',
              parent: MainRoute.name,
              redirectTo: 'home',
              fullMatch: true,
            ),
            RouteConfig(
              HomeRoute.name,
              path: 'home',
              parent: MainRoute.name,
            ),
            RouteConfig(
              TransactionRoute.name,
              path: 'transaction',
              parent: MainRoute.name,
            ),
            RouteConfig(
              BudgetRoute.name,
              path: 'budget',
              parent: MainRoute.name,
            ),
            RouteConfig(
              ProfileRoute.name,
              path: 'profile',
              parent: MainRoute.name,
            ),
          ],
        ),
      ];
}

/// generated route for
/// [SplashPage]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute()
      : super(
          SplashRoute.name,
          path: '/',
        );

  static const String name = 'SplashRoute';
}

/// generated route for
/// [OnBoardingPage]
class OnBoardingRoute extends PageRouteInfo<void> {
  const OnBoardingRoute()
      : super(
          OnBoardingRoute.name,
          path: '/on-boarding-page',
        );

  static const String name = 'OnBoardingRoute';
}

/// generated route for
/// [FinancialReportPage]
class FinancialReportRoute extends PageRouteInfo<void> {
  const FinancialReportRoute()
      : super(
          FinancialReportRoute.name,
          path: '/financial-report-page',
        );

  static const String name = 'FinancialReportRoute';
}

/// generated route for
/// [SignupPage]
class SignupRoute extends PageRouteInfo<void> {
  const SignupRoute()
      : super(
          SignupRoute.name,
          path: '/signup-page',
        );

  static const String name = 'SignupRoute';
}

/// generated route for
/// [TransactionDetailsPage]
class TransactionDetailsRoute
    extends PageRouteInfo<TransactionDetailsRouteArgs> {
  TransactionDetailsRoute({
    Key? key,
    required Transaction transaction,
  }) : super(
          TransactionDetailsRoute.name,
          path: '/transaction-details-page',
          args: TransactionDetailsRouteArgs(
            key: key,
            transaction: transaction,
          ),
        );

  static const String name = 'TransactionDetailsRoute';
}

class TransactionDetailsRouteArgs {
  const TransactionDetailsRouteArgs({
    this.key,
    required this.transaction,
  });

  final Key? key;

  final Transaction transaction;

  @override
  String toString() {
    return 'TransactionDetailsRouteArgs{key: $key, transaction: $transaction}';
  }
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: '/login-page',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [RestPasswordPage]
class RestPasswordRoute extends PageRouteInfo<void> {
  const RestPasswordRoute()
      : super(
          RestPasswordRoute.name,
          path: '/rest-password-page',
        );

  static const String name = 'RestPasswordRoute';
}

/// generated route for
/// [EmailSentPage]
class EmailSentRoute extends PageRouteInfo<void> {
  const EmailSentRoute()
      : super(
          EmailSentRoute.name,
          path: '/email-sent-page',
        );

  static const String name = 'EmailSentRoute';
}

/// generated route for
/// [SetupAccountPage]
class SetupAccountRoute extends PageRouteInfo<void> {
  const SetupAccountRoute()
      : super(
          SetupAccountRoute.name,
          path: '/setup-account-page',
        );

  static const String name = 'SetupAccountRoute';
}

/// generated route for
/// [AddNewAccountPage]
class AddNewAccountRoute extends PageRouteInfo<AddNewAccountRouteArgs> {
  AddNewAccountRoute({
    Key? key,
    Account? account,
    required bool isSetupAccount,
  }) : super(
          AddNewAccountRoute.name,
          path: '/add-new-account-page',
          args: AddNewAccountRouteArgs(
            key: key,
            account: account,
            isSetupAccount: isSetupAccount,
          ),
        );

  static const String name = 'AddNewAccountRoute';
}

class AddNewAccountRouteArgs {
  const AddNewAccountRouteArgs({
    this.key,
    this.account,
    required this.isSetupAccount,
  });

  final Key? key;

  final Account? account;

  final bool isSetupAccount;

  @override
  String toString() {
    return 'AddNewAccountRouteArgs{key: $key, account: $account, isSetupAccount: $isSetupAccount}';
  }
}

/// generated route for
/// [AccountAllSetPage]
class AccountAllSetRoute extends PageRouteInfo<void> {
  const AccountAllSetRoute()
      : super(
          AccountAllSetRoute.name,
          path: '/account-all-set-page',
        );

  static const String name = 'AccountAllSetRoute';
}

/// generated route for
/// [NewTransactionPage]
class NewTransactionRoute extends PageRouteInfo<NewTransactionRouteArgs> {
  NewTransactionRoute({
    Key? key,
    required TransactionType transactionType,
  }) : super(
          NewTransactionRoute.name,
          path: '/new-transaction-page',
          args: NewTransactionRouteArgs(
            key: key,
            transactionType: transactionType,
          ),
        );

  static const String name = 'NewTransactionRoute';
}

class NewTransactionRouteArgs {
  const NewTransactionRouteArgs({
    this.key,
    required this.transactionType,
  });

  final Key? key;

  final TransactionType transactionType;

  @override
  String toString() {
    return 'NewTransactionRouteArgs{key: $key, transactionType: $transactionType}';
  }
}

/// generated route for
/// [NewTransferPage]
class NewTransferRoute extends PageRouteInfo<void> {
  const NewTransferRoute()
      : super(
          NewTransferRoute.name,
          path: '/new-transfer-page',
        );

  static const String name = 'NewTransferRoute';
}

/// generated route for
/// [NotificationPage]
class NotificationRoute extends PageRouteInfo<void> {
  const NotificationRoute()
      : super(
          NotificationRoute.name,
          path: '/notification-page',
        );

  static const String name = 'NotificationRoute';
}

/// generated route for
/// [FinancialDetailsPage]
class FinancialDetailsRoute extends PageRouteInfo<FinancialDetailsRouteArgs> {
  FinancialDetailsRoute({
    Key? key,
    required FinancialReport financialReport,
  }) : super(
          FinancialDetailsRoute.name,
          path: '/financial-details-page',
          args: FinancialDetailsRouteArgs(
            key: key,
            financialReport: financialReport,
          ),
        );

  static const String name = 'FinancialDetailsRoute';
}

class FinancialDetailsRouteArgs {
  const FinancialDetailsRouteArgs({
    this.key,
    required this.financialReport,
  });

  final Key? key;

  final FinancialReport financialReport;

  @override
  String toString() {
    return 'FinancialDetailsRouteArgs{key: $key, financialReport: $financialReport}';
  }
}

/// generated route for
/// [NewBudgetPage]
class NewBudgetRoute extends PageRouteInfo<NewBudgetRouteArgs> {
  NewBudgetRoute({
    Key? key,
    Budget? budget,
  }) : super(
          NewBudgetRoute.name,
          path: '/new-budget-page',
          args: NewBudgetRouteArgs(
            key: key,
            budget: budget,
          ),
        );

  static const String name = 'NewBudgetRoute';
}

class NewBudgetRouteArgs {
  const NewBudgetRouteArgs({
    this.key,
    this.budget,
  });

  final Key? key;

  final Budget? budget;

  @override
  String toString() {
    return 'NewBudgetRouteArgs{key: $key, budget: $budget}';
  }
}

/// generated route for
/// [AccountsPage]
class AccountsRoute extends PageRouteInfo<void> {
  const AccountsRoute()
      : super(
          AccountsRoute.name,
          path: '/accounts-page',
        );

  static const String name = 'AccountsRoute';
}

/// generated route for
/// [AccountDetailsPage]
class AccountDetailsRoute extends PageRouteInfo<AccountDetailsRouteArgs> {
  AccountDetailsRoute({
    Key? key,
    required Account account,
  }) : super(
          AccountDetailsRoute.name,
          path: '/account-details-page',
          args: AccountDetailsRouteArgs(
            key: key,
            account: account,
          ),
        );

  static const String name = 'AccountDetailsRoute';
}

class AccountDetailsRouteArgs {
  const AccountDetailsRouteArgs({
    this.key,
    required this.account,
  });

  final Key? key;

  final Account account;

  @override
  String toString() {
    return 'AccountDetailsRouteArgs{key: $key, account: $account}';
  }
}

/// generated route for
/// [BudgetDetailsPage]
class BudgetDetailsRoute extends PageRouteInfo<BudgetDetailsRouteArgs> {
  BudgetDetailsRoute({
    Key? key,
    required Budget budget,
  }) : super(
          BudgetDetailsRoute.name,
          path: '/budget-details-page',
          args: BudgetDetailsRouteArgs(
            key: key,
            budget: budget,
          ),
        );

  static const String name = 'BudgetDetailsRoute';
}

class BudgetDetailsRouteArgs {
  const BudgetDetailsRouteArgs({
    this.key,
    required this.budget,
  });

  final Key? key;

  final Budget budget;

  @override
  String toString() {
    return 'BudgetDetailsRouteArgs{key: $key, budget: $budget}';
  }
}

/// generated route for
/// [SettingsPage]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute()
      : super(
          SettingsRoute.name,
          path: '/settings-page',
        );

  static const String name = 'SettingsRoute';
}

/// generated route for
/// [AboutPage]
class AboutRoute extends PageRouteInfo<void> {
  const AboutRoute()
      : super(
          AboutRoute.name,
          path: '/about-page',
        );

  static const String name = 'AboutRoute';
}

/// generated route for
/// [CurrencyPage]
class CurrencyRoute extends PageRouteInfo<void> {
  const CurrencyRoute()
      : super(
          CurrencyRoute.name,
          path: '/currency-page',
        );

  static const String name = 'CurrencyRoute';
}

/// generated route for
/// [LanguagePage]
class LanguageRoute extends PageRouteInfo<void> {
  const LanguageRoute()
      : super(
          LanguageRoute.name,
          path: '/language-page',
        );

  static const String name = 'LanguageRoute';
}

/// generated route for
/// [ThemePage]
class ThemeRoute extends PageRouteInfo<void> {
  const ThemeRoute()
      : super(
          ThemeRoute.name,
          path: '/theme-page',
        );

  static const String name = 'ThemeRoute';
}

/// generated route for
/// [EditeProfilePage]
class EditeProfileRoute extends PageRouteInfo<EditeProfileRouteArgs> {
  EditeProfileRoute({
    Key? key,
    required User user,
  }) : super(
          EditeProfileRoute.name,
          path: '/edite-profile-page',
          args: EditeProfileRouteArgs(
            key: key,
            user: user,
          ),
        );

  static const String name = 'EditeProfileRoute';
}

class EditeProfileRouteArgs {
  const EditeProfileRouteArgs({
    this.key,
    required this.user,
  });

  final Key? key;

  final User user;

  @override
  String toString() {
    return 'EditeProfileRouteArgs{key: $key, user: $user}';
  }
}

/// generated route for
/// [MainPage]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children})
      : super(
          MainRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'MainRoute';
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: 'home',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [TransactionPage]
class TransactionRoute extends PageRouteInfo<void> {
  const TransactionRoute()
      : super(
          TransactionRoute.name,
          path: 'transaction',
        );

  static const String name = 'TransactionRoute';
}

/// generated route for
/// [BudgetPage]
class BudgetRoute extends PageRouteInfo<void> {
  const BudgetRoute()
      : super(
          BudgetRoute.name,
          path: 'budget',
        );

  static const String name = 'BudgetRoute';
}

/// generated route for
/// [ProfilePage]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute()
      : super(
          ProfileRoute.name,
          path: 'profile',
        );

  static const String name = 'ProfileRoute';
}
