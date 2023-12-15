import 'package:bharath_work_assessment/data/repositories/for_you_repository.dart';
import 'package:bharath_work_assessment/features/foryou/domain/models/m_c_q_answer_model_entity.dart';
import 'package:bharath_work_assessment/features/foryou/domain/models/m_c_question_model_entity.dart';

class ValidateAnswerUsecase {
  final ForYouRepository _forYouRepository;

  ValidateAnswerUsecase({required ForYouRepository forYouRepository})
      : _forYouRepository = forYouRepository;

  Future<MCQAnswerModelCorrectOptions?> validateAnswer(
      MCQuestionModelEntity entity, MCQuestionModelOptions selectedAnswer) async {
    final response = await _forYouRepository.validateAnswer(entity);
    if (response.success != null) {
      final item = response.success?.correctOptions
          ?.where((element) => element.id == selectedAnswer.id)
          .firstOrNull;
      // final item = response.success?.correctOptions
      //     ?.firstWhere((element) => element.id == selectedAnswer.id);
      if (item != null) {
        return response.success!.correctOptions?.first;
      } else {
        return response.success!.correctOptions?.first;
      }
    } else {
      throw Exception("Fail to validate answer");
    }
  }
}
