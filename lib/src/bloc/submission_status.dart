class SubmissionState {
  const SubmissionState.init()
      : submissionStatus = Status.idle,
        error = "";
  SubmissionState(this.error, this.submissionStatus);

  final String error;
  final Status submissionStatus;

  SubmissionState copyWith({
    String? error,
    Status? submissionStatus,
  }) {
    return SubmissionState(
      error ?? this.error,
      submissionStatus ?? this.submissionStatus,
    );
  }
}

enum Status { idle, success, error, loading }
