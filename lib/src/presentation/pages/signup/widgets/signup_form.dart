import 'package:expense_tracker_app/src/domain/exceptions/auth_exception.dart';

import 'package:expense_tracker_app/src/presentation/bloc/signup/signup_cubit.dart';
import 'package:expense_tracker_app/src/presentation/bloc/submission_state.dart';
import 'package:expense_tracker_app/src/presentation/routes/app_router.dart';
import 'package:expense_tracker_app/src/presentation/styles/app_colors.dart';

import 'package:expense_tracker_app/src/presentation/widgets/email_form_field.dart';
import 'package:expense_tracker_app/src/presentation/widgets/error_dialog.dart';
import 'package:expense_tracker_app/src/presentation/widgets/loading_dialog.dart';
import 'package:expense_tracker_app/src/presentation/widgets/password_form_field.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'check_box_tile.dart';
import 'confirm_password_form_field.dart';
import 'login_button.dart';
import '../../../widgets/login_with_google_button.dart';
import 'signup_button.dart';
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

  bool _boxChecked = false;

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
            CheckboxTile(
              value: _boxChecked,
              handleCheckbox: _setCheckbox,
            ),
            const SizedBox(
              height: 27,
            ),
            SignupButton(
              onPressed: _signUp,
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
            LoginWithGoogleButton(
              onPressed: () {
                //TODO login with google
              },
            ),
            const SizedBox(
              height: 12,
            ),
            const LoginButton()
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
          success: () {
            context.replaceRoute(const SetupAccountRoute());
          },
          failed: (failure) => _handleSubmissionFailure(failure),
        );
      },
    );
  }

  void _signUp() {
    if (_isFormValid()) {
      if (_boxChecked) {
        BlocProvider.of<SignupCubit>(context).signUp(
            email: _emailController.text,
            password: _passwordController.text,
            username: _userNameController.text);
      } else {
        _showUserAgreementNotAcceptedToast();
      }
    }
  }

  void _showUserAgreementNotAcceptedToast() {
    Fluttertoast.showToast(
        msg: AppLocalizations.of(context)!.userAgreementWarnningMessage,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: AppColors.dark50,
        textColor: AppColors.light,
        fontSize: 16.0);
  }

  void _setCheckbox(bool? value) {
    if (value == null) {
      return;
    }
    setState(() {
      _boxChecked = value;
    });
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
      case AuthError.emailAlreadyInUse:
        errorMessage = AppLocalizations.of(context)!.emailAlreadyInUse;
        break;

      case AuthError.serverError:
        errorMessage = AppLocalizations.of(context)!.serverError;
        break;
      default:
        errorMessage = AppLocalizations.of(context)!.serverError;
        break;
    }
    _showErrorDialog(context, errorMessage);
  }
}
