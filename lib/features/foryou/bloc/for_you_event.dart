part of 'for_you_bloc.dart';

@immutable
abstract class ForYouEvent {}

class FetchQuestionEvent extends ForYouEvent {}

class ValidateAnswerEvent extends ForYouEvent {
  final MCQuestionModelEntity questionModelEntity;
  final MCQuestionModelOptions selectedOption;

  ValidateAnswerEvent({required this.questionModelEntity, required this.selectedOption});
}
