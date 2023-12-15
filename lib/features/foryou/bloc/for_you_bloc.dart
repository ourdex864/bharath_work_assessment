import 'dart:async';

import 'package:bharath_work_assessment/features/foryou/domain/models/m_c_question_model_entity.dart';
import 'package:bharath_work_assessment/features/foryou/domain/usecases/fetch_question_usecase.dart';
import 'package:bharath_work_assessment/features/foryou/domain/usecases/validate_answer_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'for_you_event.dart';
part 'for_you_state.dart';

class ForYouBloc extends Bloc<ForYouEvent, ForYouState> {
  final FetchQuestionUseCase _fetchQuestionUseCase;
  final ValidateAnswerUsecase _validateAnswerUsecase;

  ForYouBloc(
      {required FetchQuestionUseCase fetchQuestionUseCase,
      required ValidateAnswerUsecase validateAnswerUsecase})
      : _fetchQuestionUseCase = fetchQuestionUseCase,
        _validateAnswerUsecase = validateAnswerUsecase,
        super(ForYouState.initial()) {
    on<FetchQuestionEvent>(
      (event, emit) => _fetchQuestion(event, emit),
    );
    on<ValidateAnswerEvent>(
      (event, emit) => _validateAnswer(event, emit),
    );
  }

  Future _fetchQuestion(FetchQuestionEvent event, Emitter<ForYouState> emit) async {
    if (state.question == null) {
      emit(state.copyWith(isLoading: true));

      try {
        final response = await _fetchQuestionUseCase.fetchQuestion();
        emit(state.copyWith(question: response, isLoading: false));
      } catch (error) {
        emit(state.copyWith(isLoading: false, errorString: error.toString()));
      }
    }
  }

  Future _validateAnswer(ValidateAnswerEvent event, Emitter<ForYouState> emit) async {
    emit(state.copyWith(isLoading: true));
    try {
      final response = await _validateAnswerUsecase.validateAnswer(
          event.questionModelEntity, event.selectedOption);
      emit(state.copyWith(
          selectedAnswer: event.selectedOption.id,
          isValidAnswer: response?.id == event.selectedOption.id,
          validAnswer: response?.id,
          isLoading: false));
      // if (response?.id == event.selectedOption.id) {
      // }
    } catch (error) {
      emit(state.copyWith(isLoading: false, errorString: error.toString()));
    }
  }
}
