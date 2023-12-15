import 'package:bharath_work_assessment/di/assembler.dart';
import 'package:bharath_work_assessment/di/blocs_assembly.dart';
import 'package:bharath_work_assessment/di/features_assembly.dart';
import 'package:bharath_work_assessment/di/usecases_assembly.dart';
import 'package:bharath_work_assessment/di/utils_assembly.dart';

class AppAssembly extends Assembler {
  bool assembled = false;

  AppAssembly()
      : super(<Assembly>[
          UtilsAssembly(),
          FeaturesAssembly(),
          UsecasesAssembly(),
        ]);

  @override
  Future assembleAll() async {
    if (assembled) {
      return;
    }
    await super.assembleAll();
    assembled = true;
  }
}
