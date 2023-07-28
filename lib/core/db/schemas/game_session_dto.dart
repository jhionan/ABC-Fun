import 'dart:convert';

import 'package:abc_fun/core/domain/models/action_item_entity.dart';
import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

part 'game_session_dto.g.dart';

@JsonSerializable()
@collection
class GameSessionDto {
  GameSessionDto({
    this.id,
    required this.createdAt,
    required this.totalStages,
    required this.totalWrongAnswers,
    required this.totalMoves,
    required this.totalActionsJson,
  });
  @JsonKey(includeFromJson: false, includeToJson: false)
  Id? id;
  final DateTime createdAt;
  final int totalStages;
  final int totalWrongAnswers;
  final int totalMoves;
  String totalActionsJson;
  @ignore
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<GameSessionAction>? get totalActions {
    if (totalActionsJson.isEmpty) return [];
    List<Map<String, dynamic>> total = List.from(jsonDecode(totalActionsJson));
    return total.map((e) => GameSessionAction.fromJson(e)).toList();
  }

  factory GameSessionDto.fromJson(Map<String, dynamic> json) => _$GameSessionDtoFromJson(json);
  Map<String, dynamic> toJson() => _$GameSessionDtoToJson(this);
}

@JsonSerializable()
class GameSessionAction {
  GameSessionAction({
    this.totalPlayed = 1,
    this.totalWrong = 0,
    required this.actionName,
    required this.group,
  });
  int totalPlayed;
  int totalWrong;
  final String actionName;
  final ActionGroup group;

  factory GameSessionAction.fromJson(Map<String, dynamic> json) => _$GameSessionActionFromJson(json);
  Map<String, dynamic> toJson() => _$GameSessionActionToJson(this);
}
