import 'package:expense_tracker_app/src/domain/exceptions/auth_exception.dart';

import 'package:expense_tracker_app/src/presentation/bloc/signup/signup_cubit.dart';
import 'package:expense_tracker_app/src/presentation/bloc/submission_state.dart';
import 'package:expense_tracker_app/src/presentation/routes/app_router.dart';
import 'package:expense_tracker_app/src/presentation/styles/app_colors.dart';
import 'package:expense_tracker_app/src/presentation/widgets/error_dialog.dart';
import 'package:expense_tracker_app/src/presentation/widgets/loading_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:auto_route/auto_route.dart';

import 'confirm_password_form_field.dart';
import 'email_form_field.dart';
import 'password_form_field.dart';
import 'username_form_field.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({Key? key}) : super(key: key);

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final spacing = const SizedBox(
    height: 24,
  );
  final _formKey = GlobalKey<FormState>();
  final _userNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final double formTextFieldHight = 56;

  void _signUp() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      BlocProvider.of<SignupCubit>(context).signUp(
          email: _emailController.text,
          password: _passwordController.text,
          username: _userNameController.text);
    }
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

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit, SubmissionState>(
      child: Form(
        autovalidateMode: AutovalidateMode.disabled,
        key: _formKey,
        child: Column(
          children: [
            UsernameFormField(
              controller: _userNameController,
            ),
            spacing,
            EmailFormField(controller: _emailController),
            spacing,
            PasswordFormField(
              controller: _passwordController,
            ),
            spacing,
            ConfirmPasswordFormField(
              passwordController: _passwordController,
              controller: _confirmPasswordController,
            ),
            spacing,
            CheckboxListTile(
              checkColor: Theme.of(context).colorScheme.primary,
              controlAffinity: ListTileControlAffinity.leading,
              activeColor: Theme.of(context).colorScheme.surface,
              title: RichText(
                text: TextSpan(
                    style: Theme.of(context).textTheme.bodyText1,
                    children: [
                      TextSpan(
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(color: AppColors.violet),
                          text:
                              AppLocalizations.of(context)!.formCheckBoxTitle2),
                    ],
                    text:
                        AppLocalizations.of(context)!.formCheckBoxTitle1 + " "),
              ),
              value: false,
              onChanged: (value) {
                //TODO signup check box
              },
            ),
            const SizedBox(
              height: 27,
            ),
            SizedBox(
              height: 56,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _signUp,
                child: Text(AppLocalizations.of(context)!.signUp),
              ),
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
            SizedBox(
              height: 56,
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    side: BorderSide(
                        color: Theme.of(context)
                            .inputDecorationTheme
                            .enabledBorder!
                            .borderSide
                            .color),
                    elevation: 0,
                    onPrimary: Theme.of(context).colorScheme.onBackground,
                    primary: Theme.of(context).colorScheme.background),
                icon: Image.asset("assets/images/google_logo.png"),
                onPressed: () {
                  //TODO signup with google
                },
                label: Text(AppLocalizations.of(context)!.loginWithGoogle),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppLocalizations.of(context)!.alreadyHaveAccount,
                  style: TextStyle(
                      color: Theme.of(context)
                          .inputDecorationTheme
                          .hintStyle!
                          .color!),
                ),
                TextButton(
                    style: TextButton.styleFrom(
                        padding: const EdgeInsetsDirectional.only(start: 3),
                        alignment: AlignmentDirectional.centerStart),
                    onPressed: () => context.replaceRoute(const LoginRoute()),
                    child: Text(AppLocalizations.of(context)!.login)),
              ],
            )
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
            failed: (failure) {
              String errorMessage = "";

              switch (failure) {
                case AuthError.emailAlreadyInUse:
                  errorMessage =
                      AppLocalizations.of(context)!.emailAlreadyInUse;
                  break;

                case AuthError.serverError:
                  errorMessage = AppLocalizations.of(context)!.serverError;
                  break;
                default:
                  errorMessage = AppLocalizations.of(context)!.serverError;
                  break;
              }
              _showErrorDialog(context, errorMessage);
            });
      },
    );
  }
}
