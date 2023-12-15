import 'package:bharath_work_assessment/data/datasource/api/api_constants.dart';
import 'package:bharath_work_assessment/data/datasource/api/api_service.dart';
import 'package:bharath_work_assessment/data/response_model.dart';
import 'package:bharath_work_assessment/features/foryou/domain/models/m_c_q_answer_model_entity.dart';
import 'package:bharath_work_assessment/features/foryou/domain/models/m_c_question_model_entity.dart';

abstract class ForYouRepository {
  Future<DataResponse<MCQuestionModelEntity, Exception>> fetchQuestion();

  Future<DataResponse<MCQAnswerModelEntity, Exception>> validateAnswer(MCQuestionModelEntity entity);
}

class ForYouRepositoryImpl extends ForYouRepository {
  final APIService _apiService;

  ForYouRepositoryImpl({required APIService apiService}) : _apiService = apiService;

  @override
  Future<DataResponse<MCQuestionModelEntity, Exception>> fetchQuestion() async {
    try {
      final response = await _apiService.executeRequest(APIEnpoint.question, {});
      if (response != null) {
        final data = MCQuestionModelEntity.fromJson(response);
        return DataResponse.success(data);
      } else {
        return DataResponse.failure(Exception("Empty response from server"));
      }
    } catch (exception) {
      return DataResponse.failure(Exception(exception.toString()));
    }
  }

  @override
  Future<DataResponse<MCQAnswerModelEntity, Exception>> validateAnswer(MCQuestionModelEntity entity) async {
    try {
      final response = await _apiService.executeRequest(APIEnpoint.answer, {"id": entity.id});
      if (response != null) {
        return DataResponse.success(MCQAnswerModelEntity.fromJson(response));
      } else {
        return DataResponse.failure(Exception("Empty response from server"));
      }
    } catch (exception) {
      return DataResponse.failure(Exception(exception.toString()));
    }
  }
}
