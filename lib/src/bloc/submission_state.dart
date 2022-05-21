class SubmissionState {
  const SubmissionState.init()
      : submissionStatus = SubmissionStatus.idle,
        error = "";
  SubmissionState(this.error, this.submissionStatus);

  final String error;
  final SubmissionStatus submissionStatus;

  SubmissionState copyWith({
    String? error,
    SubmissionStatus? submissionStatus,
  }) {
    return SubmissionState(
      error ?? this.error,
      submissionStatus ?? this.submissionStatus,
    );
  }
}

enum SubmissionStatus { idle, success, error, submitting }
