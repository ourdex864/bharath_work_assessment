part of 'for_you_bloc.dart';

class ForYouState {
  final MCQuestionModelEntity? question;
  final String? selectedAnswer;
  final String? validAnswer;
  final bool? isValidAnswer;
  final bool? isLoading;
  final String? errorString;

  ForYouState._(
      {this.question,
      this.selectedAnswer,
      this.isLoading,
      this.errorString,
      this.validAnswer,
      this.isValidAnswer});

  ForYouState copyWith(
      {MCQuestionModelEntity? question,
      String? selectedAnswer,
      bool? isLoading,
      String? errorString,
      bool? isValidAnswer,
      String? validAnswer}) {
    return ForYouState._(
        question: question ?? this.question,
        selectedAnswer: selectedAnswer ?? this.selectedAnswer,
        isLoading: isLoading,
        errorString: errorString,
        isValidAnswer: isValidAnswer,
        validAnswer: validAnswer ?? this.selectedAnswer);
  }

  factory ForYouState.initial() => ForYouState._();
}
