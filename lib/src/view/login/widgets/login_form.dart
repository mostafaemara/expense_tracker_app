import 'package:expense_tracker_app/src/bloc/login/login_cubit.dart';
import 'package:expense_tracker_app/src/bloc/submission_status.dart';

import 'package:expense_tracker_app/src/routes/app_router.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:auto_route/auto_route.dart';

import '../../common/email_form_field.dart';
import '../../common/error_dialog.dart';
import '../../common/loading_dialog.dart';
import '../../common/login_with_google_button.dart';
import '../../common/password_form_field.dart';
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
      listener: (context, state) => _handleState(state),
    );
  }

  void _handleState(SubmissionState state) {
    switch (state.submissionStatus) {
      case Status.success:
        context.replaceRoute(const MainRoute());
        break;
      case Status.error:
        _showErrorDialog(context, state.error);
        break;
      case Status.loading:
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) => const LoadingDialog(),
        );
        break;

      default:
        break;
    }
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
        title: AppLocalizations.of(context)!.serverError,
        body: failure,
      ),
    );
  }
}
