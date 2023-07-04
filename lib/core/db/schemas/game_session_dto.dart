import 'dart:convert';

import 'package:isar/isar.dart';

import 'package:abc_fun/core/domain/models/action_item_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'game_session_dto.g.dart';

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
  Id? id;
  final DateTime createdAt;
  final int totalStages;
  final int totalWrongAnswers;
  final int totalMoves;
  final List<String> totalActionsJson;
  @ignore
  List<GameSessionAction> get totalActions {
    return totalActionsJson.map((e) => GameSessionAction.fromJson(jsonDecode(e))).toList();
  }
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

  factory GameSessionAction.fromJson(Map<String, dynamic> json) =>
      _$GameSessionActionFromJson(json);
  Map<String, dynamic> toJson() => _$GameSessionActionToJson(this);
}
