import 'package:bharath_work_assessment/generated/json/base/json_convert_content.dart';
import 'package:bharath_work_assessment/features/foryou/domain/models/m_c_question_model_entity.dart';

MCQuestionModelEntity $MCQuestionModelEntityFromJson(Map<String, dynamic> json) {
  final MCQuestionModelEntity mCQuestionModelEntity = MCQuestionModelEntity();
  final String? type = jsonConvert.convert<String>(json['type']);
  if (type != null) {
    mCQuestionModelEntity.type = type;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    mCQuestionModelEntity.id = id;
  }
  final String? playlist = jsonConvert.convert<String>(json['playlist']);
  if (playlist != null) {
    mCQuestionModelEntity.playlist = playlist;
  }
  final String? description = jsonConvert.convert<String>(json['description']);
  if (description != null) {
    mCQuestionModelEntity.description = description;
  }
  final String? image = jsonConvert.convert<String>(json['image']);
  if (image != null) {
    mCQuestionModelEntity.image = image;
  }
  final String? question = jsonConvert.convert<String>(json['question']);
  if (question != null) {
    mCQuestionModelEntity.question = question;
  }
  final List<MCQuestionModelOptions>? options = (json['options'] as List<dynamic>?)
      ?.map((e) => jsonConvert.convert<MCQuestionModelOptions>(e) as MCQuestionModelOptions)
      .toList();
  if (options != null) {
    mCQuestionModelEntity.options = options;
  }
  final MCQuestionModelUser? user = jsonConvert.convert<MCQuestionModelUser>(json['user']);
  if (user != null) {
    mCQuestionModelEntity.user = user;
  }
  return mCQuestionModelEntity;
}

Map<String, dynamic> $MCQuestionModelEntityToJson(MCQuestionModelEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['type'] = entity.type;
  data['id'] = entity.id;
  data['playlist'] = entity.playlist;
  data['description'] = entity.description;
  data['image'] = entity.image;
  data['question'] = entity.question;
  data['options'] = entity.options?.map((v) => v.toJson()).toList();
  data['user'] = entity.user?.toJson();
  return data;
}

extension MCQuestionModelEntityExtension on MCQuestionModelEntity {
  MCQuestionModelEntity copyWith({
    String? type,
    int? id,
    String? playlist,
    String? description,
    String? image,
    String? question,
    List<MCQuestionModelOptions>? options,
    MCQuestionModelUser? user,
  }) {
    return MCQuestionModelEntity()
      ..type = type ?? this.type
      ..id = id ?? this.id
      ..playlist = playlist ?? this.playlist
      ..description = description ?? this.description
      ..image = image ?? this.image
      ..question = question ?? this.question
      ..options = options ?? this.options
      ..user = user ?? this.user;
  }
}

MCQuestionModelOptions $MCQuestionModelOptionsFromJson(Map<String, dynamic> json) {
  final MCQuestionModelOptions mCQuestionModelOptions = MCQuestionModelOptions();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    mCQuestionModelOptions.id = id;
  }
  final String? answer = jsonConvert.convert<String>(json['answer']);
  if (answer != null) {
    mCQuestionModelOptions.answer = answer;
  }
  return mCQuestionModelOptions;
}

Map<String, dynamic> $MCQuestionModelOptionsToJson(MCQuestionModelOptions entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['answer'] = entity.answer;
  return data;
}

extension MCQuestionModelOptionsExtension on MCQuestionModelOptions {
  MCQuestionModelOptions copyWith({
    String? id,
    String? answer,
  }) {
    return MCQuestionModelOptions()
      ..id = id ?? this.id
      ..answer = answer ?? this.answer;
  }
}

MCQuestionModelUser $MCQuestionModelUserFromJson(Map<String, dynamic> json) {
  final MCQuestionModelUser mCQuestionModelUser = MCQuestionModelUser();
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    mCQuestionModelUser.name = name;
  }
  final String? avatar = jsonConvert.convert<String>(json['avatar']);
  if (avatar != null) {
    mCQuestionModelUser.avatar = avatar;
  }
  return mCQuestionModelUser;
}

Map<String, dynamic> $MCQuestionModelUserToJson(MCQuestionModelUser entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['name'] = entity.name;
  data['avatar'] = entity.avatar;
  return data;
}

extension MCQuestionModelUserExtension on MCQuestionModelUser {
  MCQuestionModelUser copyWith({
    String? name,
    String? avatar,
  }) {
    return MCQuestionModelUser()
      ..name = name ?? this.name
      ..avatar = avatar ?? this.avatar;
  }
}
