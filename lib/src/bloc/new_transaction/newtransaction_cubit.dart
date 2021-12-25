import 'package:bloc/bloc.dart';
import 'package:expense_tracker_app/src/bloc/submission_state.dart';

class NewtransactionCubit extends Cubit<SubmissionState> {
  NewtransactionCubit() : super(const SubmissionState.idle());
}
