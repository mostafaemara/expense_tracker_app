import 'dart:io';

import 'package:expense_tracker_app/src/bloc/profile/profile_cubit.dart';
import 'package:expense_tracker_app/src/bloc/update_profile/update_profile.dart';
import 'package:expense_tracker_app/src/helpers/ui_helper.dart';
import 'package:expense_tracker_app/src/view/common/submit_button.dart';
import 'package:expense_tracker_app/src/view/signup/widgets/username_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../bloc/submission_status.dart';
import '../../data/models/user.dart';
import '../../styles/app_colors.dart';

class EditeProfilePage extends StatefulWidget {
  const EditeProfilePage({
    Key? key,
    required this.user,
  }) : super(key: key);
  final User user;

  @override
  State<EditeProfilePage> createState() => _EditeProfilePageState();
}

class _EditeProfilePageState extends State<EditeProfilePage> {
  late TextEditingController _userNameController;

  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    _userNameController = TextEditingController(text: widget.user.name);
    super.initState();
  }

  XFile? image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: BlocConsumer<UpdateProfileCubit, SubmissionState>(
          builder: (context, state) => Container(
              padding: const EdgeInsets.all(40),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Stack(
                        children: [
                          Container(
                            height: 120,
                            width: 120,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(120),
                                border: Border.all(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    width: 2)),
                            child: Padding(
                              padding: const EdgeInsets.all(3),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(80),
                                child: image != null
                                    ? Image.file(File(image!.path))
                                    : widget.user.image.isNotEmpty
                                        ? Image.network(
                                            widget.user.image,
                                            fit: BoxFit.cover,
                                          )
                                        : Image.asset(
                                            "assets/images/user_place_holder.png"),
                              ),
                            ),
                          ),
                          Positioned(
                            right: 0,
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(40),
                                  border: Border.all(
                                      color: Colors.white, width: 2)),
                              child: IconButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: () async {
                                    final pickedImage = await ImagePicker()
                                        .pickImage(source: ImageSource.gallery);

                                    setState(() {
                                      image = pickedImage;
                                    });
                                  },
                                  icon: const Icon(
                                    Icons.image,
                                    color: Colors.white,
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Username",
                      style: TextStyle(fontSize: 14, color: AppColors.light20),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    UsernameFormField(
                      controller: _userNameController,
                    ),
                    const Spacer(),
                    const Spacer(),
                    SubmitButton(
                      isLoading: state.submissionStatus == Status.loading,
                      onPressed: _update,
                    ),
                  ],
                ),
              )),
          listener: (context, state) => _handleState(state),
        ));
  }

  void _update() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      BlocProvider.of<UpdateProfileCubit>(context).updateProfile(
          userName: _userNameController.text,
          image: image != null ? File(image!.path) : null);
    }
  }

  void _handleState(SubmissionState state) {
    switch (state.submissionStatus) {
      case Status.success:
        context.showSnackBar(
            AppLocalizations.of(context)!.submittedSuccessfully,
            backgroundColor: AppColors.green);
        BlocProvider.of<ProfileCubit>(context).init();

        break;
      case Status.error:
        context.showSnackBar(state.error, backgroundColor: AppColors.red);
        break;

      default:
        break;
    }
  }
}
