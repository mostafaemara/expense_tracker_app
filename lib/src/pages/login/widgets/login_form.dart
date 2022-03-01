import 'package:expense_tracker_app/src/application/login/login_cubit.dart';
import 'package:expense_tracker_app/src/application/submission_state.dart';
import 'package:expense_tracker_app/src/data/exceptions/auth_exception.dart';
import 'package:expense_tracker_app/src/routes/app_router.dart';
import 'package:expense_tracker_app/src/widgets/email_form_field.dart';
import 'package:expense_tracker_app/src/widgets/error_dialog.dart';
import 'package:expense_tracker_app/src/widgets/loading_dialog.dart';
import 'package:expense_tracker_app/src/widgets/login_with_google_button.dart';
import 'package:expense_tracker_app/src/widgets/password_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:auto_route/auto_route.dart';

import 'forgot_password_button.dart';
import 'login_button.dart';
import 'signup_button.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final spacing = const SizedBox(
    height: 24,
  );

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, SubmissionState>(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            EmailFormField(controller: _emailController),
            spacing,
            PasswordFormField(controller: _passwordController),
            const SizedBox(
              height: 40,
            ),
            LoginButton(
              onPressed: _login,
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              AppLocalizations.of(context)!.orWith,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  color:
                      Theme.of(context).inputDecorationTheme.hintStyle!.color!),
            ),
            const SizedBox(
              height: 12,
            ),
            LoginWithGoogleButton(onPressed: () {}),
            const ForgotPasswordButton(),
            const SignupButton(),
          ],
        ),
      ),
      listener: (context, state) {
        state.whenOrNull(
          submitting: () => showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) => const LoadingDialog(),
          ),
          success: () => context.replaceRoute(const MainRoute()),
          failed: (failure) => _handleSubmissionFailure(failure),
        );
      },
    );
  }

  void _login() {
    if (_isFormValid()) {
      BlocProvider.of<LoginCubit>(context).login(
          email: _emailController.text, password: _passwordController.text);
    }
  }

  bool _isFormValid() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      return true;
    }
    return false;
  }

  void _showErrorDialog(BuildContext context, String failure) {
    Navigator.of(context).pop();
    showDialog(
      context: context,
      builder: (context) => ErrorDialog(
        title: AppLocalizations.of(context)!.error,
        body: failure,
      ),
    );
  }

  void _handleSubmissionFailure(AuthError error) {
    String errorMessage = "";

    switch (error) {
      case AuthError.serverError:
        errorMessage = AppLocalizations.of(context)!.serverError;
        break;

      case AuthError.invalidEmailOrPassword:
        errorMessage = AppLocalizations.of(context)!.emailOrPasswordIncorrect;
        break;
      case AuthError.emailNotFound:
        errorMessage = AppLocalizations.of(context)!.emailOrPasswordIncorrect;
        break;

      default:
        errorMessage = AppLocalizations.of(context)!.serverError;
        break;
    }
    _showErrorDialog(context, errorMessage);
  }
}
