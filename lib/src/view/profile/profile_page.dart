import 'package:auto_route/auto_route.dart';
import 'package:expense_tracker_app/src/bloc/profile/profile_cubit.dart';
import 'package:expense_tracker_app/src/routes/app_router.dart';
import 'package:expense_tracker_app/src/styles/app_colors.dart';
import 'package:expense_tracker_app/src/view/profile/widgets/profile_list_view.dart';
import 'package:expense_tracker_app/src/view/profile/widgets/profile_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    context.read<ProfileCubit>().init();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    context.read<ProfileCubit>().init();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.light60,
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) => state.isLoading
                ? Container()
                : SingleChildScrollView(
                    child: Column(children: [
                      const SizedBox(height: 74),
                      ProfileHeader(
                          onEditePressed: () {
                            AutoRouter.of(context)
                                .navigate(EditeProfileRoute(user: state.user));
                          },
                          user: state.user),
                      const SizedBox(
                        height: 40,
                      ),
                      const ProfileListView()
                    ]),
                  ),
          )),
    );
  }
}
