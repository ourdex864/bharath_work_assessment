import 'package:bharath_work_assessment/generated/json/base/json_convert_content.dart';
import 'package:bharath_work_assessment/features/foryou/domain/models/m_c_q_answer_model_entity.dart';

MCQAnswerModelEntity $MCQAnswerModelEntityFromJson(Map<String, dynamic> json) {
  final MCQAnswerModelEntity mCQAnswerModelEntity = MCQAnswerModelEntity();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    mCQAnswerModelEntity.id = id;
  }
  final List<MCQAnswerModelCorrectOptions>? correctOptions = (json['correct_options'] as List<dynamic>?)
      ?.map((e) => jsonConvert.convert<MCQAnswerModelCorrectOptions>(e) as MCQAnswerModelCorrectOptions)
      .toList();
  if (correctOptions != null) {
    mCQAnswerModelEntity.correctOptions = correctOptions;
  }
  return mCQAnswerModelEntity;
}

Map<String, dynamic> $MCQAnswerModelEntityToJson(MCQAnswerModelEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['correct_options'] = entity.correctOptions?.map((v) => v.toJson()).toList();
  return data;
}

extension MCQAnswerModelEntityExtension on MCQAnswerModelEntity {
  MCQAnswerModelEntity copyWith({
    int? id,
    List<MCQAnswerModelCorrectOptions>? correctOptions,
  }) {
    return MCQAnswerModelEntity()
      ..id = id ?? this.id
      ..correctOptions = correctOptions ?? this.correctOptions;
  }
}

MCQAnswerModelCorrectOptions $MCQAnswerModelCorrectOptionsFromJson(Map<String, dynamic> json) {
  final MCQAnswerModelCorrectOptions mCQAnswerModelCorrectOptions = MCQAnswerModelCorrectOptions();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    mCQAnswerModelCorrectOptions.id = id;
  }
  final String? answer = jsonConvert.convert<String>(json['answer']);
  if (answer != null) {
    mCQAnswerModelCorrectOptions.answer = answer;
  }
  return mCQAnswerModelCorrectOptions;
}

Map<String, dynamic> $MCQAnswerModelCorrectOptionsToJson(MCQAnswerModelCorrectOptions entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['answer'] = entity.answer;
  return data;
}

extension MCQAnswerModelCorrectOptionsExtension on MCQAnswerModelCorrectOptions {
  MCQAnswerModelCorrectOptions copyWith({
    String? id,
    String? answer,
  }) {
    return MCQAnswerModelCorrectOptions()
      ..id = id ?? this.id
      ..answer = answer ?? this.answer;
  }
}
