import 'package:expense_tracker_app/src/bloc/Home/home_cubit.dart';
import 'package:expense_tracker_app/src/bloc/accounts/accounts_cubit.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hive_flutter/hive_flutter.dart';
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
  await Hive.initFlutter();
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
        create: (context) => AuthCubit(),
      ),
      BlocProvider(
        lazy: false,
        create: (context) => AccountsCubit(),
      ),
      BlocProvider(
        lazy: false,
        create: (context) => SignupCubit(BlocProvider.of<AuthCubit>(context)),
      ),
      BlocProvider(
        lazy: false,
        create: (context) => LoginCubit(BlocProvider.of<AuthCubit>(context)),
      ),
      BlocProvider(
        lazy: false,
        create: (context) =>
            HomeCubit(accountsCubit: BlocProvider.of<AccountsCubit>(context)),
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
