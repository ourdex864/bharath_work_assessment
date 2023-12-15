import 'package:bharath_work_assessment/generated/json/base/json_field.dart';
import 'package:bharath_work_assessment/generated/json/m_c_question_model_entity.g.dart';
import 'dart:convert';
export 'package:bharath_work_assessment/generated/json/m_c_question_model_entity.g.dart';

@JsonSerializable()
class MCQuestionModelEntity {
  String? type;
  int? id;
  String? playlist;
  String? description;
  String? image;
  String? question;
  List<MCQuestionModelOptions>? options;
  MCQuestionModelUser? user;

  MCQuestionModelEntity();

  factory MCQuestionModelEntity.fromJson(Map<String, dynamic> json) => $MCQuestionModelEntityFromJson(json);

  Map<String, dynamic> toJson() => $MCQuestionModelEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class MCQuestionModelOptions {
  String? id;
  String? answer;

  MCQuestionModelOptions();

  factory MCQuestionModelOptions.fromJson(Map<String, dynamic> json) => $MCQuestionModelOptionsFromJson(json);

  Map<String, dynamic> toJson() => $MCQuestionModelOptionsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class MCQuestionModelUser {
  String? name;
  String? avatar;

  MCQuestionModelUser();

  factory MCQuestionModelUser.fromJson(Map<String, dynamic> json) => $MCQuestionModelUserFromJson(json);

  Map<String, dynamic> toJson() => $MCQuestionModelUserToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
