import 'package:auto_route/auto_route.dart';
import 'package:expense_tracker_app/src/bloc/rest_password/rest_password_bloc.dart';
import 'package:expense_tracker_app/src/routes/app_router.dart';
import 'package:expense_tracker_app/src/view/common/email_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../bloc/submission_status.dart';
import '../../common/error_dialog.dart';
import '../../common/loading_dialog.dart';

class RestPasswordForm extends StatefulWidget {
  const RestPasswordForm({
    Key? key,
  }) : super(key: key);

  @override
  State<RestPasswordForm> createState() => _RestPasswordFormState();
}

class _RestPasswordFormState extends State<RestPasswordForm> {
  final spacing = const SizedBox(
    height: 24,
  );

  final double formTextFieldHight = 56;
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocListener<RestPasswordBLoc, SubmissionState>(
      listener: (context, state) => _handleState(state),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Text(
              AppLocalizations.of(context)!.enterYourEmailToRestPassword,
              style: Theme.of(context).textTheme.headline5,
            ),
            const SizedBox(
              height: 46,
            ),
            EmailFormField(
              controller: _emailController,
            ),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              height: 56,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _sendEmail,
                child: Text(AppLocalizations.of(context)!.continueButtonTitle),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleState(SubmissionState state) {
    switch (state.submissionStatus) {
      case Status.success:
        context.replaceRoute(const EmailSentRoute());
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

  void _sendEmail() {
    if (_isFormValid()) {
      BlocProvider.of<RestPasswordBLoc>(context).sendRestPasswordEmail(
        _emailController.text,
      );
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
