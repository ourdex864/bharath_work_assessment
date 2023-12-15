import 'package:bharath_work_assessment/data/repositories/for_you_repository.dart';
import 'package:bharath_work_assessment/features/foryou/domain/models/m_c_question_model_entity.dart';

class FetchQuestionUseCase {
  final ForYouRepository _forYouRepository;

  FetchQuestionUseCase({required ForYouRepository forYouRepository}) : _forYouRepository = forYouRepository;

  Future<MCQuestionModelEntity?> fetchQuestion() async {
    final response = await _forYouRepository.fetchQuestion();
    if (response.success != null) {
      return response.success;
    } else {
      throw Exception(response.failure?.toString());
    }
  }
}
