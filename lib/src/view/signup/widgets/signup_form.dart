import 'package:expense_tracker_app/src/bloc/submission_status.dart';
import 'package:expense_tracker_app/src/routes/app_router.dart';
import 'package:expense_tracker_app/src/styles/app_colors.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../bloc/signup/signup_cubit.dart';

import '../../common/email_form_field.dart';
import '../../common/error_dialog.dart';
import '../../common/loading_dialog.dart';
import '../../common/login_with_google_button.dart';
import '../../common/password_form_field.dart';
import 'check_box_tile.dart';
import 'confirm_password_form_field.dart';
import 'login_button.dart';

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
        title: AppLocalizations.of(context)!.serverError,
        body: failure,
      ),
    );
  }
}
