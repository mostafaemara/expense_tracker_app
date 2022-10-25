import 'dart:io';

import 'package:expense_tracker_app/src/bloc/profile/profile_cubit.dart';
import 'package:expense_tracker_app/src/view/common/submit_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

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
  XFile? image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) => Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Container(
                            height: 90,
                            width: 90,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(90),
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
                          ElevatedButton.icon(
                              icon: const Icon(Icons.image),
                              onPressed: () async {
                                final pickedImage = await ImagePicker()
                                    .pickImage(source: ImageSource.gallery);

                                setState(() {
                                  image = pickedImage;
                                });
                              },
                              label: const Text("Pick Image")),
                        ],
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Username",
                            style: TextStyle(
                                fontSize: 14, color: AppColors.light20),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width - 160,
                            child: TextFormField(
                              initialValue: widget.user.name,
                            ),
                          )
                        ],
                      ),
                      const Spacer(),
                    ],
                  ),
                  const Spacer(),
                  SubmitButton(
                    isLoading: state.isLoading,
                    onPressed: () {
                      BlocProvider.of<ProfileCubit>(context).updateProfile(
                          userName: "sasa", image: File(image!.path));
                    },
                  )
                ],
              ))),
    );
  }
}
