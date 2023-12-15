import 'package:bharath_work_assessment/di/assembler.dart';
import 'package:bharath_work_assessment/features/foryou/bloc/for_you_bloc.dart';
import 'package:get_it/get_it.dart';

class BlocsAssembly extends Assembly {
  @override
  Future<void> assemble(GetIt container) async {
    container.registerFactory(() => ForYouBloc(
        fetchQuestionUseCase: container(), validateAnswerUsecase: container()));
  }
}
