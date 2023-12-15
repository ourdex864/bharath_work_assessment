import 'package:bharath_work_assessment/di/assembler.dart';
import 'package:bharath_work_assessment/features/foryou/di/for_you_assembly.dart';
import 'package:get_it/get_it.dart';

class FeaturesAssembly extends Assembly {
  @override
  Future<void> assemble(GetIt container) async {
    await ForYouAssembly().assemble(container);
  }
}
