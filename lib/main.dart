import 'package:expense_tracker_app/src/bloc/account_details/account_details_bloc.dart';
import 'package:expense_tracker_app/src/bloc/accounts/accounts_cubit.dart';
import 'package:expense_tracker_app/src/bloc/auth/auth_cubit.dart';
import 'package:expense_tracker_app/src/bloc/budgets/budgets_cubit.dart';
import 'package:expense_tracker_app/src/bloc/financial_report/financial_report_bloc.dart';
import 'package:expense_tracker_app/src/bloc/home/home_cubit.dart';
import 'package:expense_tracker_app/src/bloc/login/login_cubit.dart';
import 'package:expense_tracker_app/src/bloc/signup/signup_cubit.dart';
import 'package:expense_tracker_app/src/bloc/transactions/transactions_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'injection.dart';
import 'src/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDependencies();
  // Workmanager().initialize(
  //     callbackDispatcher, // The top level function, aka callbackDispatcher
  //     isInDebugMode:
  //         true // If enabled it will post a notification whenever the task is running. Handy for debugging tasks
  //     );

  // Workmanager().registerOneOffTask("2", "name",
  //     initialDelay: Duration(seconds: 60),
  //     existingWorkPolicy: ExistingWorkPolicy.replace);

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(
    MultiBlocProvider(providers: [
      BlocProvider(
        lazy: false,
        create: (context) => TransactionCubit()..init(),
      ),
      BlocProvider(
        lazy: false,
        create: (context) => AuthCubit(),
      ),
      BlocProvider(
        lazy: false,
        create: (context) => SignupCubit(),
      ),
      BlocProvider(
        lazy: false,
        create: (context) => LoginCubit(),
      ),
      BlocProvider(
        lazy: false,
        create: (context) => HomeCubit(),
      ),
      BlocProvider(
        lazy: false,
        create: (context) => FinancialReportCubit(),
      ),
      BlocProvider(
        lazy: false,
        create: (context) => BudgetsCubit(),
      ),
      BlocProvider(
        lazy: false,
        create: (context) => AccountsCubit()..init(),
      ),
      BlocProvider(
        lazy: false,
        create: (context) => AccountDetailsCubit(),
      )
    ], child: MyApp()),
  );
}

  // await AndroidAlarmManager.cancel(helloAlarmID);
// }

// void callbackDispatcher() {
//   Workmanager().executeTask((task, inputData) async {
//     print("Native called background task: $task");
//     try {
//       // await Firebase.initializeApp(
//       //   options: DefaultFirebaseOptions.currentPlatform,
//       // );
//       // initializeDependencies();
//       final _transactionRepo = locator<TransactionRepository>();
//       await _transactionRepo.addTransaction(
//           TransactionInput(
//               accountId: "YmBBW0OfvR82i4j6Hx2l",
//               amount: 500,
//               attachment: "",
//               category: Category(
//                 iconUrl: "",
//                 id: "VLVJ0nG0NJ0gWieU0PyB",
//                 title: Multilingual(arabic: "asdas", english: "asas"),
//               ),
//               description: "asdasd",
//               type: TransactionType.income()),
//           "KVbwHkHe5idFcNopIeRa15XRVOG3");

//       return Future.value(true);
//     } catch (e) {
//       return Future.error(e.toString());
//     }
// //simpleTask will be emitted here.
//   });
// }
