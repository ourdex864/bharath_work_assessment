import 'package:bharath_work_assessment/generated/json/base/json_field.dart';
import 'package:bharath_work_assessment/generated/json/m_c_q_answer_model_entity.g.dart';
import 'dart:convert';
export 'package:bharath_work_assessment/generated/json/m_c_q_answer_model_entity.g.dart';

@JsonSerializable()
class MCQAnswerModelEntity {
  int? id;
  @JSONField(name: "correct_options")
  List<MCQAnswerModelCorrectOptions>? correctOptions;

  MCQAnswerModelEntity();

  factory MCQAnswerModelEntity.fromJson(Map<String, dynamic> json) => $MCQAnswerModelEntityFromJson(json);

  Map<String, dynamic> toJson() => $MCQAnswerModelEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class MCQAnswerModelCorrectOptions {
  String? id;
  String? answer;

  MCQAnswerModelCorrectOptions();

  factory MCQAnswerModelCorrectOptions.fromJson(Map<String, dynamic> json) =>
      $MCQAnswerModelCorrectOptionsFromJson(json);

  Map<String, dynamic> toJson() => $MCQAnswerModelCorrectOptionsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
