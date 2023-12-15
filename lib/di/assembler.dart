import 'package:bharath_work_assessment/di/locator.dart';
import 'package:get_it/get_it.dart';

class Assembler {
  final List<Assembly> assemblies;

  Assembler(this.assemblies);

  Future assembleAll() async {
    for (var assembly in assemblies) {
      await assembly.assemble(locator);
    }
  }
}

abstract class Assembly {
  Future<void> assemble(GetIt container);
}

class MyAssembler extends Assembler {
  MyAssembler() : super([]);
}
