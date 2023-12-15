import 'package:bharath_work_assessment/data/datasource/api/api_service.dart';
import 'package:bharath_work_assessment/data/repositories/for_you_repository.dart';
import 'package:bharath_work_assessment/features/foryou/domain/models/m_c_question_model_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final apiService = APIService();

  test("MCQuestion test", () async {
    final repository = ForYouRepositoryImpl(apiService: apiService);

    final response = await repository.fetchQuestion();
    expect(response.success != null, true);
    expect(response.success is MCQuestionModelEntity, true);
  });
}
