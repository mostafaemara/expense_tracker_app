import 'package:expense_tracker_app/src/bloc/new_transaction/newtransaction_cubit.dart';
import 'package:expense_tracker_app/src/bloc/new_transaction/newtransaction_state.dart';
import 'package:expense_tracker_app/src/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import "../../../helpers/image_helper.dart";

class AddAttachmentButton extends StatelessWidget {
  const AddAttachmentButton({Key? key, required this.onPressed})
      : super(key: key);
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewTransactionCubit, NewTransactionState>(
        buildWhen: (previous, current) =>
            current.selectedAttachment != previous.selectedAttachment,
        builder: (context, state) => state.selectedAttachment == null
            ? SizedBox(
                height: 56,
                width: double.infinity,
                child: TextButton.icon(
                  onPressed: onPressed,
                  icon: Transform.rotate(
                    angle: 180,
                    child: const Icon(Icons.attach_file),
                  ),
                  label: Text(AppLocalizations.of(context)!.addAttachment),
                ),
              )
            : Container(
                height: 112,
                alignment: AlignmentDirectional.centerStart,
                width: double.infinity,
                child: SizedBox(
                  height: 112,
                  width: 112,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.memory(
                          state.selectedAttachment!.base64ToImage(),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned.fill(
                        left: 80,
                        bottom: 80,
                        child: IconButton(
                            color: AppColors.light.withOpacity(0.32),
                            onPressed: () {
                              context
                                  .read<NewTransactionCubit>()
                                  .cancelAttachment();
                            },
                            icon: const Icon(
                              Icons.cancel_sharp,
                            )),
                      ),
                    ],
                  ),
                ),
              ));
  }
}
