import 'package:bharath_work_assessment/data/repositories/for_you_repository.dart';
import 'package:bharath_work_assessment/di/assembler.dart';
import 'package:bharath_work_assessment/features/foryou/bloc/for_you_bloc.dart';
import 'package:get_it/get_it.dart';

class ForYouAssembly extends Assembly {
  @override
  Future<void> assemble(GetIt container) async {
    container.registerSingleton<ForYouRepository>(
        ForYouRepositoryImpl(apiService: container()));
    container.registerFactory<ForYouBloc>(() => ForYouBloc(
        fetchQuestionUseCase: container(), validateAnswerUsecase: container()));
  }
}
