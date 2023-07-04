// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_dto.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSettingsDtoCollection on Isar {
  IsarCollection<SettingsDto> get settingsDtos => this.collection();
}

const SettingsDtoSchema = CollectionSchema(
  name: r'SettingsDto',
  id: -2943621942359096483,
  properties: {
    r'rewardImageBytes': PropertySchema(
      id: 0,
      name: r'rewardImageBytes',
      type: IsarType.byteList,
    ),
    r'selectedActionsPerStage': PropertySchema(
      id: 1,
      name: r'selectedActionsPerStage',
      type: IsarType.long,
    ),
    r'selectedStageQuantity': PropertySchema(
      id: 2,
      name: r'selectedStageQuantity',
      type: IsarType.long,
    )
  },
  estimateSize: _settingsDtoEstimateSize,
  serialize: _settingsDtoSerialize,
  deserialize: _settingsDtoDeserialize,
  deserializeProp: _settingsDtoDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _settingsDtoGetId,
  getLinks: _settingsDtoGetLinks,
  attach: _settingsDtoAttach,
  version: '3.1.0+1',
);

int _settingsDtoEstimateSize(
  SettingsDto object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.rewardImageBytes;
    if (value != null) {
      bytesCount += 3 + value.length;
    }
  }
  return bytesCount;
}

void _settingsDtoSerialize(
  SettingsDto object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeByteList(offsets[0], object.rewardImageBytes);
  writer.writeLong(offsets[1], object.selectedActionsPerStage);
  writer.writeLong(offsets[2], object.selectedStageQuantity);
}

SettingsDto _settingsDtoDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SettingsDto(
    id: id,
    rewardImageBytes: reader.readByteList(offsets[0]),
    selectedActionsPerStage: reader.readLong(offsets[1]),
    selectedStageQuantity: reader.readLong(offsets[2]),
  );
  return object;
}

P _settingsDtoDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readByteList(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _settingsDtoGetId(SettingsDto object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _settingsDtoGetLinks(SettingsDto object) {
  return [];
}

void _settingsDtoAttach(
    IsarCollection<dynamic> col, Id id, SettingsDto object) {
  object.id = id;
}

extension SettingsDtoQueryWhereSort
    on QueryBuilder<SettingsDto, SettingsDto, QWhere> {
  QueryBuilder<SettingsDto, SettingsDto, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension SettingsDtoQueryWhere
    on QueryBuilder<SettingsDto, SettingsDto, QWhereClause> {
  QueryBuilder<SettingsDto, SettingsDto, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<SettingsDto, SettingsDto, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<SettingsDto, SettingsDto, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<SettingsDto, SettingsDto, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<SettingsDto, SettingsDto, QAfterWhereClause> idBetween(
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

extension SettingsDtoQueryFilter
    on QueryBuilder<SettingsDto, SettingsDto, QFilterCondition> {
  QueryBuilder<SettingsDto, SettingsDto, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<SettingsDto, SettingsDto, QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<SettingsDto, SettingsDto, QAfterFilterCondition> idEqualTo(
      Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsDto, SettingsDto, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<SettingsDto, SettingsDto, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<SettingsDto, SettingsDto, QAfterFilterCondition> idBetween(
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

  QueryBuilder<SettingsDto, SettingsDto, QAfterFilterCondition>
      rewardImageBytesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'rewardImageBytes',
      ));
    });
  }

  QueryBuilder<SettingsDto, SettingsDto, QAfterFilterCondition>
      rewardImageBytesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'rewardImageBytes',
      ));
    });
  }

  QueryBuilder<SettingsDto, SettingsDto, QAfterFilterCondition>
      rewardImageBytesElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rewardImageBytes',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsDto, SettingsDto, QAfterFilterCondition>
      rewardImageBytesElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rewardImageBytes',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsDto, SettingsDto, QAfterFilterCondition>
      rewardImageBytesElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rewardImageBytes',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsDto, SettingsDto, QAfterFilterCondition>
      rewardImageBytesElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rewardImageBytes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SettingsDto, SettingsDto, QAfterFilterCondition>
      rewardImageBytesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'rewardImageBytes',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<SettingsDto, SettingsDto, QAfterFilterCondition>
      rewardImageBytesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'rewardImageBytes',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<SettingsDto, SettingsDto, QAfterFilterCondition>
      rewardImageBytesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'rewardImageBytes',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<SettingsDto, SettingsDto, QAfterFilterCondition>
      rewardImageBytesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'rewardImageBytes',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<SettingsDto, SettingsDto, QAfterFilterCondition>
      rewardImageBytesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'rewardImageBytes',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<SettingsDto, SettingsDto, QAfterFilterCondition>
      rewardImageBytesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'rewardImageBytes',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<SettingsDto, SettingsDto, QAfterFilterCondition>
      selectedActionsPerStageEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'selectedActionsPerStage',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsDto, SettingsDto, QAfterFilterCondition>
      selectedActionsPerStageGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'selectedActionsPerStage',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsDto, SettingsDto, QAfterFilterCondition>
      selectedActionsPerStageLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'selectedActionsPerStage',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsDto, SettingsDto, QAfterFilterCondition>
      selectedActionsPerStageBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'selectedActionsPerStage',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SettingsDto, SettingsDto, QAfterFilterCondition>
      selectedStageQuantityEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'selectedStageQuantity',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsDto, SettingsDto, QAfterFilterCondition>
      selectedStageQuantityGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'selectedStageQuantity',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsDto, SettingsDto, QAfterFilterCondition>
      selectedStageQuantityLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'selectedStageQuantity',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsDto, SettingsDto, QAfterFilterCondition>
      selectedStageQuantityBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'selectedStageQuantity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension SettingsDtoQueryObject
    on QueryBuilder<SettingsDto, SettingsDto, QFilterCondition> {}

extension SettingsDtoQueryLinks
    on QueryBuilder<SettingsDto, SettingsDto, QFilterCondition> {}

extension SettingsDtoQuerySortBy
    on QueryBuilder<SettingsDto, SettingsDto, QSortBy> {
  QueryBuilder<SettingsDto, SettingsDto, QAfterSortBy>
      sortBySelectedActionsPerStage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'selectedActionsPerStage', Sort.asc);
    });
  }

  QueryBuilder<SettingsDto, SettingsDto, QAfterSortBy>
      sortBySelectedActionsPerStageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'selectedActionsPerStage', Sort.desc);
    });
  }

  QueryBuilder<SettingsDto, SettingsDto, QAfterSortBy>
      sortBySelectedStageQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'selectedStageQuantity', Sort.asc);
    });
  }

  QueryBuilder<SettingsDto, SettingsDto, QAfterSortBy>
      sortBySelectedStageQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'selectedStageQuantity', Sort.desc);
    });
  }
}

extension SettingsDtoQuerySortThenBy
    on QueryBuilder<SettingsDto, SettingsDto, QSortThenBy> {
  QueryBuilder<SettingsDto, SettingsDto, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<SettingsDto, SettingsDto, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<SettingsDto, SettingsDto, QAfterSortBy>
      thenBySelectedActionsPerStage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'selectedActionsPerStage', Sort.asc);
    });
  }

  QueryBuilder<SettingsDto, SettingsDto, QAfterSortBy>
      thenBySelectedActionsPerStageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'selectedActionsPerStage', Sort.desc);
    });
  }

  QueryBuilder<SettingsDto, SettingsDto, QAfterSortBy>
      thenBySelectedStageQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'selectedStageQuantity', Sort.asc);
    });
  }

  QueryBuilder<SettingsDto, SettingsDto, QAfterSortBy>
      thenBySelectedStageQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'selectedStageQuantity', Sort.desc);
    });
  }
}

extension SettingsDtoQueryWhereDistinct
    on QueryBuilder<SettingsDto, SettingsDto, QDistinct> {
  QueryBuilder<SettingsDto, SettingsDto, QDistinct>
      distinctByRewardImageBytes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rewardImageBytes');
    });
  }

  QueryBuilder<SettingsDto, SettingsDto, QDistinct>
      distinctBySelectedActionsPerStage() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'selectedActionsPerStage');
    });
  }

  QueryBuilder<SettingsDto, SettingsDto, QDistinct>
      distinctBySelectedStageQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'selectedStageQuantity');
    });
  }
}

extension SettingsDtoQueryProperty
    on QueryBuilder<SettingsDto, SettingsDto, QQueryProperty> {
  QueryBuilder<SettingsDto, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<SettingsDto, List<int>?, QQueryOperations>
      rewardImageBytesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rewardImageBytes');
    });
  }

  QueryBuilder<SettingsDto, int, QQueryOperations>
      selectedActionsPerStageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'selectedActionsPerStage');
    });
  }

  QueryBuilder<SettingsDto, int, QQueryOperations>
      selectedStageQuantityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'selectedStageQuantity');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SettingsDto _$SettingsDtoFromJson(Map<String, dynamic> json) => SettingsDto(
      selectedActionsPerStage: json['selectedActionsPerStage'] as int,
      selectedStageQuantity: json['selectedStageQuantity'] as int,
    );

Map<String, dynamic> _$SettingsDtoToJson(SettingsDto instance) =>
    <String, dynamic>{
      'selectedActionsPerStage': instance.selectedActionsPerStage,
      'selectedStageQuantity': instance.selectedStageQuantity,
    };
