// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_session_dto.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetGameSessionDtoCollection on Isar {
  IsarCollection<GameSessionDto> get gameSessionDtos => this.collection();
}

const GameSessionDtoSchema = CollectionSchema(
  name: r'GameSessionDto',
  id: -1026401066377987475,
  properties: {
    r'createdAt': PropertySchema(
      id: 0,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'totalActionsJson': PropertySchema(
      id: 1,
      name: r'totalActionsJson',
      type: IsarType.stringList,
    ),
    r'totalMoves': PropertySchema(
      id: 2,
      name: r'totalMoves',
      type: IsarType.long,
    ),
    r'totalStages': PropertySchema(
      id: 3,
      name: r'totalStages',
      type: IsarType.long,
    ),
    r'totalWrongAnswers': PropertySchema(
      id: 4,
      name: r'totalWrongAnswers',
      type: IsarType.long,
    )
  },
  estimateSize: _gameSessionDtoEstimateSize,
  serialize: _gameSessionDtoSerialize,
  deserialize: _gameSessionDtoDeserialize,
  deserializeProp: _gameSessionDtoDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _gameSessionDtoGetId,
  getLinks: _gameSessionDtoGetLinks,
  attach: _gameSessionDtoAttach,
  version: '3.1.0+1',
);

int _gameSessionDtoEstimateSize(
  GameSessionDto object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.totalActionsJson.length * 3;
  {
    for (var i = 0; i < object.totalActionsJson.length; i++) {
      final value = object.totalActionsJson[i];
      bytesCount += value.length * 3;
    }
  }
  return bytesCount;
}

void _gameSessionDtoSerialize(
  GameSessionDto object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.createdAt);
  writer.writeStringList(offsets[1], object.totalActionsJson);
  writer.writeLong(offsets[2], object.totalMoves);
  writer.writeLong(offsets[3], object.totalStages);
  writer.writeLong(offsets[4], object.totalWrongAnswers);
}

GameSessionDto _gameSessionDtoDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = GameSessionDto(
    createdAt: reader.readDateTime(offsets[0]),
    id: id,
    totalActionsJson: reader.readStringList(offsets[1]) ?? [],
    totalMoves: reader.readLong(offsets[2]),
    totalStages: reader.readLong(offsets[3]),
    totalWrongAnswers: reader.readLong(offsets[4]),
  );
  return object;
}

P _gameSessionDtoDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readStringList(offset) ?? []) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _gameSessionDtoGetId(GameSessionDto object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _gameSessionDtoGetLinks(GameSessionDto object) {
  return [];
}

void _gameSessionDtoAttach(
    IsarCollection<dynamic> col, Id id, GameSessionDto object) {
  object.id = id;
}

extension GameSessionDtoQueryWhereSort
    on QueryBuilder<GameSessionDto, GameSessionDto, QWhere> {
  QueryBuilder<GameSessionDto, GameSessionDto, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension GameSessionDtoQueryWhere
    on QueryBuilder<GameSessionDto, GameSessionDto, QWhereClause> {
  QueryBuilder<GameSessionDto, GameSessionDto, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<GameSessionDto, GameSessionDto, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<GameSessionDto, GameSessionDto, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<GameSessionDto, GameSessionDto, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<GameSessionDto, GameSessionDto, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension GameSessionDtoQueryFilter
    on QueryBuilder<GameSessionDto, GameSessionDto, QFilterCondition> {
  QueryBuilder<GameSessionDto, GameSessionDto, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<GameSessionDto, GameSessionDto, QAfterFilterCondition>
      createdAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<GameSessionDto, GameSessionDto, QAfterFilterCondition>
      createdAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<GameSessionDto, GameSessionDto, QAfterFilterCondition>
      createdAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<GameSessionDto, GameSessionDto, QAfterFilterCondition>
      idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<GameSessionDto, GameSessionDto, QAfterFilterCondition>
      idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<GameSessionDto, GameSessionDto, QAfterFilterCondition> idEqualTo(
      Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<GameSessionDto, GameSessionDto, QAfterFilterCondition>
      idGreaterThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<GameSessionDto, GameSessionDto, QAfterFilterCondition>
      idLessThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<GameSessionDto, GameSessionDto, QAfterFilterCondition> idBetween(
    Id? lower,
    Id? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<GameSessionDto, GameSessionDto, QAfterFilterCondition>
      totalActionsJsonElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalActionsJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameSessionDto, GameSessionDto, QAfterFilterCondition>
      totalActionsJsonElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalActionsJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameSessionDto, GameSessionDto, QAfterFilterCondition>
      totalActionsJsonElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalActionsJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameSessionDto, GameSessionDto, QAfterFilterCondition>
      totalActionsJsonElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalActionsJson',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameSessionDto, GameSessionDto, QAfterFilterCondition>
      totalActionsJsonElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'totalActionsJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameSessionDto, GameSessionDto, QAfterFilterCondition>
      totalActionsJsonElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'totalActionsJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameSessionDto, GameSessionDto, QAfterFilterCondition>
      totalActionsJsonElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'totalActionsJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameSessionDto, GameSessionDto, QAfterFilterCondition>
      totalActionsJsonElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'totalActionsJson',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameSessionDto, GameSessionDto, QAfterFilterCondition>
      totalActionsJsonElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalActionsJson',
        value: '',
      ));
    });
  }

  QueryBuilder<GameSessionDto, GameSessionDto, QAfterFilterCondition>
      totalActionsJsonElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'totalActionsJson',
        value: '',
      ));
    });
  }

  QueryBuilder<GameSessionDto, GameSessionDto, QAfterFilterCondition>
      totalActionsJsonLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'totalActionsJson',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<GameSessionDto, GameSessionDto, QAfterFilterCondition>
      totalActionsJsonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'totalActionsJson',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<GameSessionDto, GameSessionDto, QAfterFilterCondition>
      totalActionsJsonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'totalActionsJson',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<GameSessionDto, GameSessionDto, QAfterFilterCondition>
      totalActionsJsonLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'totalActionsJson',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<GameSessionDto, GameSessionDto, QAfterFilterCondition>
      totalActionsJsonLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'totalActionsJson',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<GameSessionDto, GameSessionDto, QAfterFilterCondition>
      totalActionsJsonLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'totalActionsJson',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<GameSessionDto, GameSessionDto, QAfterFilterCondition>
      totalMovesEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalMoves',
        value: value,
      ));
    });
  }

  QueryBuilder<GameSessionDto, GameSessionDto, QAfterFilterCondition>
      totalMovesGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalMoves',
        value: value,
      ));
    });
  }

  QueryBuilder<GameSessionDto, GameSessionDto, QAfterFilterCondition>
      totalMovesLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalMoves',
        value: value,
      ));
    });
  }

  QueryBuilder<GameSessionDto, GameSessionDto, QAfterFilterCondition>
      totalMovesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalMoves',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<GameSessionDto, GameSessionDto, QAfterFilterCondition>
      totalStagesEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalStages',
        value: value,
      ));
    });
  }

  QueryBuilder<GameSessionDto, GameSessionDto, QAfterFilterCondition>
      totalStagesGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalStages',
        value: value,
      ));
    });
  }

  QueryBuilder<GameSessionDto, GameSessionDto, QAfterFilterCondition>
      totalStagesLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalStages',
        value: value,
      ));
    });
  }

  QueryBuilder<GameSessionDto, GameSessionDto, QAfterFilterCondition>
      totalStagesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalStages',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<GameSessionDto, GameSessionDto, QAfterFilterCondition>
      totalWrongAnswersEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalWrongAnswers',
        value: value,
      ));
    });
  }

  QueryBuilder<GameSessionDto, GameSessionDto, QAfterFilterCondition>
      totalWrongAnswersGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalWrongAnswers',
        value: value,
      ));
    });
  }

  QueryBuilder<GameSessionDto, GameSessionDto, QAfterFilterCondition>
      totalWrongAnswersLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalWrongAnswers',
        value: value,
      ));
    });
  }

  QueryBuilder<GameSessionDto, GameSessionDto, QAfterFilterCondition>
      totalWrongAnswersBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalWrongAnswers',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension GameSessionDtoQueryObject
    on QueryBuilder<GameSessionDto, GameSessionDto, QFilterCondition> {}

extension GameSessionDtoQueryLinks
    on QueryBuilder<GameSessionDto, GameSessionDto, QFilterCondition> {}

extension GameSessionDtoQuerySortBy
    on QueryBuilder<GameSessionDto, GameSessionDto, QSortBy> {
  QueryBuilder<GameSessionDto, GameSessionDto, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<GameSessionDto, GameSessionDto, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<GameSessionDto, GameSessionDto, QAfterSortBy>
      sortByTotalMoves() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalMoves', Sort.asc);
    });
  }

  QueryBuilder<GameSessionDto, GameSessionDto, QAfterSortBy>
      sortByTotalMovesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalMoves', Sort.desc);
    });
  }

  QueryBuilder<GameSessionDto, GameSessionDto, QAfterSortBy>
      sortByTotalStages() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalStages', Sort.asc);
    });
  }

  QueryBuilder<GameSessionDto, GameSessionDto, QAfterSortBy>
      sortByTotalStagesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalStages', Sort.desc);
    });
  }

  QueryBuilder<GameSessionDto, GameSessionDto, QAfterSortBy>
      sortByTotalWrongAnswers() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalWrongAnswers', Sort.asc);
    });
  }

  QueryBuilder<GameSessionDto, GameSessionDto, QAfterSortBy>
      sortByTotalWrongAnswersDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalWrongAnswers', Sort.desc);
    });
  }
}

extension GameSessionDtoQuerySortThenBy
    on QueryBuilder<GameSessionDto, GameSessionDto, QSortThenBy> {
  QueryBuilder<GameSessionDto, GameSessionDto, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<GameSessionDto, GameSessionDto, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<GameSessionDto, GameSessionDto, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<GameSessionDto, GameSessionDto, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<GameSessionDto, GameSessionDto, QAfterSortBy>
      thenByTotalMoves() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalMoves', Sort.asc);
    });
  }

  QueryBuilder<GameSessionDto, GameSessionDto, QAfterSortBy>
      thenByTotalMovesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalMoves', Sort.desc);
    });
  }

  QueryBuilder<GameSessionDto, GameSessionDto, QAfterSortBy>
      thenByTotalStages() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalStages', Sort.asc);
    });
  }

  QueryBuilder<GameSessionDto, GameSessionDto, QAfterSortBy>
      thenByTotalStagesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalStages', Sort.desc);
    });
  }

  QueryBuilder<GameSessionDto, GameSessionDto, QAfterSortBy>
      thenByTotalWrongAnswers() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalWrongAnswers', Sort.asc);
    });
  }

  QueryBuilder<GameSessionDto, GameSessionDto, QAfterSortBy>
      thenByTotalWrongAnswersDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalWrongAnswers', Sort.desc);
    });
  }
}

extension GameSessionDtoQueryWhereDistinct
    on QueryBuilder<GameSessionDto, GameSessionDto, QDistinct> {
  QueryBuilder<GameSessionDto, GameSessionDto, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<GameSessionDto, GameSessionDto, QDistinct>
      distinctByTotalActionsJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalActionsJson');
    });
  }

  QueryBuilder<GameSessionDto, GameSessionDto, QDistinct>
      distinctByTotalMoves() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalMoves');
    });
  }

  QueryBuilder<GameSessionDto, GameSessionDto, QDistinct>
      distinctByTotalStages() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalStages');
    });
  }

  QueryBuilder<GameSessionDto, GameSessionDto, QDistinct>
      distinctByTotalWrongAnswers() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalWrongAnswers');
    });
  }
}

extension GameSessionDtoQueryProperty
    on QueryBuilder<GameSessionDto, GameSessionDto, QQueryProperty> {
  QueryBuilder<GameSessionDto, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<GameSessionDto, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<GameSessionDto, List<String>, QQueryOperations>
      totalActionsJsonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalActionsJson');
    });
  }

  QueryBuilder<GameSessionDto, int, QQueryOperations> totalMovesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalMoves');
    });
  }

  QueryBuilder<GameSessionDto, int, QQueryOperations> totalStagesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalStages');
    });
  }

  QueryBuilder<GameSessionDto, int, QQueryOperations>
      totalWrongAnswersProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalWrongAnswers');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameSessionAction _$GameSessionActionFromJson(Map<String, dynamic> json) =>
    GameSessionAction(
      totalPlayed: json['totalPlayed'] as int? ?? 1,
      totalWrong: json['totalWrong'] as int? ?? 0,
      actionName: json['actionName'] as String,
      group: $enumDecode(_$ActionGroupEnumMap, json['group']),
    );

Map<String, dynamic> _$GameSessionActionToJson(GameSessionAction instance) =>
    <String, dynamic>{
      'totalPlayed': instance.totalPlayed,
      'totalWrong': instance.totalWrong,
      'actionName': instance.actionName,
      'group': _$ActionGroupEnumMap[instance.group]!,
    };

const _$ActionGroupEnumMap = {
  ActionGroup.answeringPhone: 'answeringPhone',
  ActionGroup.bathing: 'bathing',
  ActionGroup.blowingBubbles: 'blowingBubbles',
  ActionGroup.brushingHair: 'brushingHair',
  ActionGroup.brushingTeeth: 'brushingTeeth',
  ActionGroup.buttoningShirt: 'buttoningShirt',
  ActionGroup.catPlayingWithWoolBall: 'catPlayingWithWoolBall',
  ActionGroup.catchingBall: 'catchingBall',
  ActionGroup.chasingButterflies: 'chasingButterflies',
  ActionGroup.clappingHands: 'clappingHands',
  ActionGroup.clearingTable: 'clearingTable',
  ActionGroup.climbingStairs: 'climbingStairs',
  ActionGroup.climbingTree: 'climbingTree',
  ActionGroup.cooking: 'cooking',
  ActionGroup.crying: 'crying',
  ActionGroup.custom: 'custom',
  ActionGroup.dancing: 'dancing',
  ActionGroup.dog: 'dog',
  ActionGroup.drawing: 'drawing',
  ActionGroup.drinkingWater: 'drinkingWater',
  ActionGroup.eating: 'eating',
  ActionGroup.jumpingRope: 'jumpingRope',
  ActionGroup.playingBlocks: 'playingBlocks',
  ActionGroup.playingWithDog: 'playingWithDog',
  ActionGroup.readingBook: 'readingBook',
  ActionGroup.receivingGift: 'receivingGift',
  ActionGroup.ridingBike: 'ridingBike',
  ActionGroup.running: 'running',
  ActionGroup.singing: 'singing',
  ActionGroup.sleeping: 'sleeping',
  ActionGroup.swinging: 'swinging',
  ActionGroup.usingComputer: 'usingComputer',
  ActionGroup.washingDishes: 'washingDishes',
  ActionGroup.washingHands: 'washingHands',
  ActionGroup.watchingTV: 'watchingTV',
  ActionGroup.wateringPlants: 'wateringPlants',
};
