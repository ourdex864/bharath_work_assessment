import 'package:bharath_work_assessment/di/assembler.dart';
import 'package:bharath_work_assessment/features/foryou/domain/usecases/fetch_question_usecase.dart';
import 'package:bharath_work_assessment/features/foryou/domain/usecases/validate_answer_usecase.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

class UsecasesAssembly extends Assembly {
  @override
  Future<void> assemble(GetIt container) async {
    debugPrint("Dependencies for Usecases");
    container.registerFactory(() => FetchQuestionUseCase(forYouRepository: container()));
    container.registerFactory(() => ValidateAnswerUsecase(forYouRepository: container()));
  }
}
