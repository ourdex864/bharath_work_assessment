import 'package:bharath_work_assessment/data/datasource/api/api_service.dart';
import 'package:bharath_work_assessment/di/assembler.dart';
import 'package:get_it/get_it.dart';

class UtilsAssembly extends Assembly {
  @override
  Future<void> assemble(GetIt container) async {
    container.registerSingleton<APIService>(APIService());
  }
}
