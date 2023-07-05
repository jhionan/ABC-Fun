// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'action_item_dto.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetActionItemDtoCollection on Isar {
  IsarCollection<ActionItemDto> get actionItemDtos => this.collection();
}

const ActionItemDtoSchema = CollectionSchema(
  name: r'ActionItemDto',
  id: 8180479277777778131,
  properties: {
    r'audioBytes': PropertySchema(
      id: 0,
      name: r'audioBytes',
      type: IsarType.byteList,
    ),
    r'audioHash': PropertySchema(
      id: 1,
      name: r'audioHash',
      type: IsarType.long,
    ),
    r'dificulty': PropertySchema(
      id: 2,
      name: r'dificulty',
      type: IsarType.long,
    ),
    r'group': PropertySchema(
      id: 3,
      name: r'group',
      type: IsarType.string,
      enumMap: _ActionItemDtogroupEnumValueMap,
    ),
    r'hashCode': PropertySchema(
      id: 4,
      name: r'hashCode',
      type: IsarType.long,
    ),
    r'imageBytes': PropertySchema(
      id: 5,
      name: r'imageBytes',
      type: IsarType.byteList,
    ),
    r'imageHash': PropertySchema(
      id: 6,
      name: r'imageHash',
      type: IsarType.long,
    ),
    r'imagePath': PropertySchema(
      id: 7,
      name: r'imagePath',
      type: IsarType.string,
    ),
    r'isActive': PropertySchema(
      id: 8,
      name: r'isActive',
      type: IsarType.bool,
    ),
    r'name': PropertySchema(
      id: 9,
      name: r'name',
      type: IsarType.string,
    ),
    r'notAllowedWith': PropertySchema(
      id: 10,
      name: r'notAllowedWith',
      type: IsarType.stringList,
      enumMap: _ActionItemDtonotAllowedWithEnumValueMap,
    )
  },
  estimateSize: _actionItemDtoEstimateSize,
  serialize: _actionItemDtoSerialize,
  deserialize: _actionItemDtoDeserialize,
  deserializeProp: _actionItemDtoDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _actionItemDtoGetId,
  getLinks: _actionItemDtoGetLinks,
  attach: _actionItemDtoAttach,
  version: '3.1.0+1',
);

int _actionItemDtoEstimateSize(
  ActionItemDto object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.audioBytes;
    if (value != null) {
      bytesCount += 3 + value.length;
    }
  }
  bytesCount += 3 + object.group.name.length * 3;
  {
    final value = object.imageBytes;
    if (value != null) {
      bytesCount += 3 + value.length;
    }
  }
  bytesCount += 3 + object.imagePath.length * 3;
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.notAllowedWith.length * 3;
  {
    for (var i = 0; i < object.notAllowedWith.length; i++) {
      final value = object.notAllowedWith[i];
      bytesCount += value.name.length * 3;
    }
  }
  return bytesCount;
}

void _actionItemDtoSerialize(
  ActionItemDto object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeByteList(offsets[0], object.audioBytes);
  writer.writeLong(offsets[1], object.audioHash);
  writer.writeLong(offsets[2], object.dificulty);
  writer.writeString(offsets[3], object.group.name);
  writer.writeLong(offsets[4], object.hashCode);
  writer.writeByteList(offsets[5], object.imageBytes);
  writer.writeLong(offsets[6], object.imageHash);
  writer.writeString(offsets[7], object.imagePath);
  writer.writeBool(offsets[8], object.isActive);
  writer.writeString(offsets[9], object.name);
  writer.writeStringList(
      offsets[10], object.notAllowedWith.map((e) => e.name).toList());
}

ActionItemDto _actionItemDtoDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ActionItemDto(
    audioBytes: reader.readByteList(offsets[0]),
    audioHash: reader.readLongOrNull(offsets[1]),
    dificulty: reader.readLongOrNull(offsets[2]) ?? 2,
    group:
        _ActionItemDtogroupValueEnumMap[reader.readStringOrNull(offsets[3])] ??
            ActionGroup.answeringPhone,
    imageBytes: reader.readByteList(offsets[5]),
    imageHash: reader.readLongOrNull(offsets[6]),
    imagePath: reader.readStringOrNull(offsets[7]) ?? '',
    isActive: reader.readBool(offsets[8]),
    name: reader.readString(offsets[9]),
    notAllowedWith: reader
            .readStringList(offsets[10])
            ?.map((e) =>
                _ActionItemDtonotAllowedWithValueEnumMap[e] ??
                ActionGroup.answeringPhone)
            .toList() ??
        const [],
  );
  object.id = id;
  return object;
}

P _actionItemDtoDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readByteList(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset) ?? 2) as P;
    case 3:
      return (_ActionItemDtogroupValueEnumMap[
              reader.readStringOrNull(offset)] ??
          ActionGroup.answeringPhone) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readByteList(offset)) as P;
    case 6:
      return (reader.readLongOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset) ?? '') as P;
    case 8:
      return (reader.readBool(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    case 10:
      return (reader
              .readStringList(offset)
              ?.map((e) =>
                  _ActionItemDtonotAllowedWithValueEnumMap[e] ??
                  ActionGroup.answeringPhone)
              .toList() ??
          const []) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _ActionItemDtogroupEnumValueMap = {
  r'answeringPhone': r'answeringPhone',
  r'bathing': r'bathing',
  r'blowingBubbles': r'blowingBubbles',
  r'brushingHair': r'brushingHair',
  r'brushingTeeth': r'brushingTeeth',
  r'buttoningShirt': r'buttoningShirt',
  r'catPlayingWithWoolBall': r'catPlayingWithWoolBall',
  r'catchingBall': r'catchingBall',
  r'chasingButterflies': r'chasingButterflies',
  r'clappingHands': r'clappingHands',
  r'clearingTable': r'clearingTable',
  r'climbingStairs': r'climbingStairs',
  r'climbingTree': r'climbingTree',
  r'cooking': r'cooking',
  r'crying': r'crying',
  r'custom': r'custom',
  r'dancing': r'dancing',
  r'dog': r'dog',
  r'drawing': r'drawing',
  r'drinkingWater': r'drinkingWater',
  r'eating': r'eating',
  r'jumpingRope': r'jumpingRope',
  r'playingBlocks': r'playingBlocks',
  r'playingWithDog': r'playingWithDog',
  r'readingBook': r'readingBook',
  r'receivingGift': r'receivingGift',
  r'ridingBike': r'ridingBike',
  r'running': r'running',
  r'singing': r'singing',
  r'sleeping': r'sleeping',
  r'swinging': r'swinging',
  r'usingComputer': r'usingComputer',
  r'washingDishes': r'washingDishes',
  r'washingHands': r'washingHands',
  r'watchingTV': r'watchingTV',
  r'wateringPlants': r'wateringPlants',
};
const _ActionItemDtogroupValueEnumMap = {
  r'answeringPhone': ActionGroup.answeringPhone,
  r'bathing': ActionGroup.bathing,
  r'blowingBubbles': ActionGroup.blowingBubbles,
  r'brushingHair': ActionGroup.brushingHair,
  r'brushingTeeth': ActionGroup.brushingTeeth,
  r'buttoningShirt': ActionGroup.buttoningShirt,
  r'catPlayingWithWoolBall': ActionGroup.catPlayingWithWoolBall,
  r'catchingBall': ActionGroup.catchingBall,
  r'chasingButterflies': ActionGroup.chasingButterflies,
  r'clappingHands': ActionGroup.clappingHands,
  r'clearingTable': ActionGroup.clearingTable,
  r'climbingStairs': ActionGroup.climbingStairs,
  r'climbingTree': ActionGroup.climbingTree,
  r'cooking': ActionGroup.cooking,
  r'crying': ActionGroup.crying,
  r'custom': ActionGroup.custom,
  r'dancing': ActionGroup.dancing,
  r'dog': ActionGroup.dog,
  r'drawing': ActionGroup.drawing,
  r'drinkingWater': ActionGroup.drinkingWater,
  r'eating': ActionGroup.eating,
  r'jumpingRope': ActionGroup.jumpingRope,
  r'playingBlocks': ActionGroup.playingBlocks,
  r'playingWithDog': ActionGroup.playingWithDog,
  r'readingBook': ActionGroup.readingBook,
  r'receivingGift': ActionGroup.receivingGift,
  r'ridingBike': ActionGroup.ridingBike,
  r'running': ActionGroup.running,
  r'singing': ActionGroup.singing,
  r'sleeping': ActionGroup.sleeping,
  r'swinging': ActionGroup.swinging,
  r'usingComputer': ActionGroup.usingComputer,
  r'washingDishes': ActionGroup.washingDishes,
  r'washingHands': ActionGroup.washingHands,
  r'watchingTV': ActionGroup.watchingTV,
  r'wateringPlants': ActionGroup.wateringPlants,
};
const _ActionItemDtonotAllowedWithEnumValueMap = {
  r'answeringPhone': r'answeringPhone',
  r'bathing': r'bathing',
  r'blowingBubbles': r'blowingBubbles',
  r'brushingHair': r'brushingHair',
  r'brushingTeeth': r'brushingTeeth',
  r'buttoningShirt': r'buttoningShirt',
  r'catPlayingWithWoolBall': r'catPlayingWithWoolBall',
  r'catchingBall': r'catchingBall',
  r'chasingButterflies': r'chasingButterflies',
  r'clappingHands': r'clappingHands',
  r'clearingTable': r'clearingTable',
  r'climbingStairs': r'climbingStairs',
  r'climbingTree': r'climbingTree',
  r'cooking': r'cooking',
  r'crying': r'crying',
  r'custom': r'custom',
  r'dancing': r'dancing',
  r'dog': r'dog',
  r'drawing': r'drawing',
  r'drinkingWater': r'drinkingWater',
  r'eating': r'eating',
  r'jumpingRope': r'jumpingRope',
  r'playingBlocks': r'playingBlocks',
  r'playingWithDog': r'playingWithDog',
  r'readingBook': r'readingBook',
  r'receivingGift': r'receivingGift',
  r'ridingBike': r'ridingBike',
  r'running': r'running',
  r'singing': r'singing',
  r'sleeping': r'sleeping',
  r'swinging': r'swinging',
  r'usingComputer': r'usingComputer',
  r'washingDishes': r'washingDishes',
  r'washingHands': r'washingHands',
  r'watchingTV': r'watchingTV',
  r'wateringPlants': r'wateringPlants',
};
const _ActionItemDtonotAllowedWithValueEnumMap = {
  r'answeringPhone': ActionGroup.answeringPhone,
  r'bathing': ActionGroup.bathing,
  r'blowingBubbles': ActionGroup.blowingBubbles,
  r'brushingHair': ActionGroup.brushingHair,
  r'brushingTeeth': ActionGroup.brushingTeeth,
  r'buttoningShirt': ActionGroup.buttoningShirt,
  r'catPlayingWithWoolBall': ActionGroup.catPlayingWithWoolBall,
  r'catchingBall': ActionGroup.catchingBall,
  r'chasingButterflies': ActionGroup.chasingButterflies,
  r'clappingHands': ActionGroup.clappingHands,
  r'clearingTable': ActionGroup.clearingTable,
  r'climbingStairs': ActionGroup.climbingStairs,
  r'climbingTree': ActionGroup.climbingTree,
  r'cooking': ActionGroup.cooking,
  r'crying': ActionGroup.crying,
  r'custom': ActionGroup.custom,
  r'dancing': ActionGroup.dancing,
  r'dog': ActionGroup.dog,
  r'drawing': ActionGroup.drawing,
  r'drinkingWater': ActionGroup.drinkingWater,
  r'eating': ActionGroup.eating,
  r'jumpingRope': ActionGroup.jumpingRope,
  r'playingBlocks': ActionGroup.playingBlocks,
  r'playingWithDog': ActionGroup.playingWithDog,
  r'readingBook': ActionGroup.readingBook,
  r'receivingGift': ActionGroup.receivingGift,
  r'ridingBike': ActionGroup.ridingBike,
  r'running': ActionGroup.running,
  r'singing': ActionGroup.singing,
  r'sleeping': ActionGroup.sleeping,
  r'swinging': ActionGroup.swinging,
  r'usingComputer': ActionGroup.usingComputer,
  r'washingDishes': ActionGroup.washingDishes,
  r'washingHands': ActionGroup.washingHands,
  r'watchingTV': ActionGroup.watchingTV,
  r'wateringPlants': ActionGroup.wateringPlants,
};

Id _actionItemDtoGetId(ActionItemDto object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _actionItemDtoGetLinks(ActionItemDto object) {
  return [];
}

void _actionItemDtoAttach(
    IsarCollection<dynamic> col, Id id, ActionItemDto object) {
  object.id = id;
}

extension ActionItemDtoQueryWhereSort
    on QueryBuilder<ActionItemDto, ActionItemDto, QWhere> {
  QueryBuilder<ActionItemDto, ActionItemDto, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ActionItemDtoQueryWhere
    on QueryBuilder<ActionItemDto, ActionItemDto, QWhereClause> {
  QueryBuilder<ActionItemDto, ActionItemDto, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterWhereClause> idBetween(
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

extension ActionItemDtoQueryFilter
    on QueryBuilder<ActionItemDto, ActionItemDto, QFilterCondition> {
  QueryBuilder<ActionItemDto, ActionItemDto, QAfterFilterCondition>
      audioBytesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'audioBytes',
      ));
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterFilterCondition>
      audioBytesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'audioBytes',
      ));
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterFilterCondition>
      audioBytesElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'audioBytes',
        value: value,
      ));
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterFilterCondition>
      audioBytesElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'audioBytes',
        value: value,
      ));
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterFilterCondition>
      audioBytesElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'audioBytes',
        value: value,
      ));
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterFilterCondition>
      audioBytesElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'audioBytes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterFilterCondition>
      audioBytesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'audioBytes',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterFilterCondition>
      audioBytesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'audioBytes',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterFilterCondition>
      audioBytesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'audioBytes',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterFilterCondition>
      audioBytesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'audioBytes',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterFilterCondition>
      audioBytesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'audioBytes',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterFilterCondition>
      audioBytesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'audioBytes',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterFilterCondition>
      audioHashIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'audioHash',
      ));
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterFilterCondition>
      audioHashIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'audioHash',
      ));
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterFilterCondition>
      audioHashEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'audioHash',
        value: value,
      ));
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterFilterCondition>
      audioHashGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'audioHash',
        value: value,
      ));
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterFilterCondition>
      audioHashLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'audioHash',
        value: value,
      ));
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterFilterCondition>
      audioHashBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'audioHash',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterFilterCondition>
      dificultyEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dificulty',
        value: value,
      ));
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterFilterCondition>
      dificultyGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dificulty',
        value: value,
      ));
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterFilterCondition>
      dificultyLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dificulty',
        value: value,
      ));
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterFilterCondition>
      dificultyBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dificulty',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterFilterCondition>
      groupEqualTo(
    ActionGroup value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'group',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterFilterCondition>
      groupGreaterThan(
    ActionGroup value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'group',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterFilterCondition>
      groupLessThan(
    ActionGroup value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'group',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterFilterCondition>
      groupBetween(
    ActionGroup lower,
    ActionGroup upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'group',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterFilterCondition>
      groupStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'group',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterFilterCondition>
      groupEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'group',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterFilterCondition>
      groupContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'group',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterFilterCondition>
      groupMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'group',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterFilterCondition>
      groupIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'group',
        value: '',
      ));
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterFilterCondition>
      groupIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'group',
        value: '',
      ));
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterFilterCondition>
      hashCodeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hashCode',
        value: value,
      ));
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterFilterCondition>
      hashCodeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'hashCode',
        value: value,
      ));
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterFilterCondition>
      hashCodeLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'hashCode',
        value: value,
      ));
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterFilterCondition>
      hashCodeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'hashCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterFilterCondition>
      idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterFilterCondition> idEqualTo(
      Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterFilterCondition>
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

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterFilterCondition> idBetween(
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

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterFilterCondition>
      imageBytesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'imageBytes',
      ));
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterFilterCondition>
      imageBytesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'imageBytes',
      ));
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterFilterCondition>
      imageBytesElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imageBytes',
        value: value,
      ));
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterFilterCondition>
      imageBytesElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'imageBytes',
        value: value,
      ));
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterFilterCondition>
      imageBytesElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'imageBytes',
        value: value,
      ));
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterFilterCondition>
      imageBytesElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'imageBytes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterFilterCondition>
      imageBytesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'imageBytes',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterFilterCondition>
      imageBytesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'imageBytes',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterFilterCondition>
      imageBytesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'imageBytes',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterFilterCondition>
      imageBytesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'imageBytes',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterFilterCondition>
      imageBytesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'imageBytes',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterFilterCondition>
      imageBytesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'imageBytes',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterFilterCondition>
      imageHashIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'imageHash',
      ));
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterFilterCondition>
      imageHashIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'imageHash',
      ));
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterFilterCondition>
      imageHashEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imageHash',
        value: value,
      ));
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterFilterCondition>
      imageHashGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'imageHash',
        value: value,
      ));
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterFilterCondition>
      imageHashLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'imageHash',
        value: value,
      ));
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterFilterCondition>
      imageHashBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'imageHash',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterFilterCondition>
      imagePathEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imagePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterFilterCondition>
      imagePathGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'imagePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterFilterCondition>
      imagePathLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'imagePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterFilterCondition>
      imagePathBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'imagePath',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterFilterCondition>
      imagePathStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'imagePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterFilterCondition>
      imagePathEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'imagePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterFilterCondition>
      imagePathContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'imagePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterFilterCondition>
      imagePathMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'imagePath',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterFilterCondition>
      imagePathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imagePath',
        value: '',
      ));
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterFilterCondition>
      imagePathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'imagePath',
        value: '',
      ));
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterFilterCondition>
      isActiveEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isActive',
        value: value,
      ));
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterFilterCondition>
      nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterFilterCondition>
      nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterFilterCondition>
      nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterFilterCondition>
      nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterFilterCondition>
      notAllowedWithElementEqualTo(
    ActionGroup value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notAllowedWith',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterFilterCondition>
      notAllowedWithElementGreaterThan(
    ActionGroup value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'notAllowedWith',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterFilterCondition>
      notAllowedWithElementLessThan(
    ActionGroup value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'notAllowedWith',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterFilterCondition>
      notAllowedWithElementBetween(
    ActionGroup lower,
    ActionGroup upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'notAllowedWith',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterFilterCondition>
      notAllowedWithElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'notAllowedWith',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterFilterCondition>
      notAllowedWithElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'notAllowedWith',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterFilterCondition>
      notAllowedWithElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'notAllowedWith',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterFilterCondition>
      notAllowedWithElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'notAllowedWith',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterFilterCondition>
      notAllowedWithElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notAllowedWith',
        value: '',
      ));
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterFilterCondition>
      notAllowedWithElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'notAllowedWith',
        value: '',
      ));
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterFilterCondition>
      notAllowedWithLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'notAllowedWith',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterFilterCondition>
      notAllowedWithIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'notAllowedWith',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterFilterCondition>
      notAllowedWithIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'notAllowedWith',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterFilterCondition>
      notAllowedWithLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'notAllowedWith',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterFilterCondition>
      notAllowedWithLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'notAllowedWith',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterFilterCondition>
      notAllowedWithLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'notAllowedWith',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension ActionItemDtoQueryObject
    on QueryBuilder<ActionItemDto, ActionItemDto, QFilterCondition> {}

extension ActionItemDtoQueryLinks
    on QueryBuilder<ActionItemDto, ActionItemDto, QFilterCondition> {}

extension ActionItemDtoQuerySortBy
    on QueryBuilder<ActionItemDto, ActionItemDto, QSortBy> {
  QueryBuilder<ActionItemDto, ActionItemDto, QAfterSortBy> sortByAudioHash() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'audioHash', Sort.asc);
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterSortBy>
      sortByAudioHashDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'audioHash', Sort.desc);
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterSortBy> sortByDificulty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dificulty', Sort.asc);
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterSortBy>
      sortByDificultyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dificulty', Sort.desc);
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterSortBy> sortByGroup() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'group', Sort.asc);
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterSortBy> sortByGroupDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'group', Sort.desc);
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterSortBy> sortByHashCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.asc);
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterSortBy>
      sortByHashCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.desc);
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterSortBy> sortByImageHash() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageHash', Sort.asc);
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterSortBy>
      sortByImageHashDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageHash', Sort.desc);
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterSortBy> sortByImagePath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imagePath', Sort.asc);
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterSortBy>
      sortByImagePathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imagePath', Sort.desc);
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterSortBy> sortByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterSortBy>
      sortByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension ActionItemDtoQuerySortThenBy
    on QueryBuilder<ActionItemDto, ActionItemDto, QSortThenBy> {
  QueryBuilder<ActionItemDto, ActionItemDto, QAfterSortBy> thenByAudioHash() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'audioHash', Sort.asc);
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterSortBy>
      thenByAudioHashDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'audioHash', Sort.desc);
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterSortBy> thenByDificulty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dificulty', Sort.asc);
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterSortBy>
      thenByDificultyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dificulty', Sort.desc);
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterSortBy> thenByGroup() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'group', Sort.asc);
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterSortBy> thenByGroupDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'group', Sort.desc);
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterSortBy> thenByHashCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.asc);
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterSortBy>
      thenByHashCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.desc);
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterSortBy> thenByImageHash() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageHash', Sort.asc);
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterSortBy>
      thenByImageHashDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageHash', Sort.desc);
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterSortBy> thenByImagePath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imagePath', Sort.asc);
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterSortBy>
      thenByImagePathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imagePath', Sort.desc);
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterSortBy> thenByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterSortBy>
      thenByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension ActionItemDtoQueryWhereDistinct
    on QueryBuilder<ActionItemDto, ActionItemDto, QDistinct> {
  QueryBuilder<ActionItemDto, ActionItemDto, QDistinct> distinctByAudioBytes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'audioBytes');
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QDistinct> distinctByAudioHash() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'audioHash');
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QDistinct> distinctByDificulty() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dificulty');
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QDistinct> distinctByGroup(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'group', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QDistinct> distinctByHashCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hashCode');
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QDistinct> distinctByImageBytes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'imageBytes');
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QDistinct> distinctByImageHash() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'imageHash');
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QDistinct> distinctByImagePath(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'imagePath', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QDistinct> distinctByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isActive');
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ActionItemDto, ActionItemDto, QDistinct>
      distinctByNotAllowedWith() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notAllowedWith');
    });
  }
}

extension ActionItemDtoQueryProperty
    on QueryBuilder<ActionItemDto, ActionItemDto, QQueryProperty> {
  QueryBuilder<ActionItemDto, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ActionItemDto, List<int>?, QQueryOperations>
      audioBytesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'audioBytes');
    });
  }

  QueryBuilder<ActionItemDto, int?, QQueryOperations> audioHashProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'audioHash');
    });
  }

  QueryBuilder<ActionItemDto, int, QQueryOperations> dificultyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dificulty');
    });
  }

  QueryBuilder<ActionItemDto, ActionGroup, QQueryOperations> groupProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'group');
    });
  }

  QueryBuilder<ActionItemDto, int, QQueryOperations> hashCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hashCode');
    });
  }

  QueryBuilder<ActionItemDto, List<int>?, QQueryOperations>
      imageBytesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'imageBytes');
    });
  }

  QueryBuilder<ActionItemDto, int?, QQueryOperations> imageHashProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'imageHash');
    });
  }

  QueryBuilder<ActionItemDto, String, QQueryOperations> imagePathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'imagePath');
    });
  }

  QueryBuilder<ActionItemDto, bool, QQueryOperations> isActiveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isActive');
    });
  }

  QueryBuilder<ActionItemDto, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<ActionItemDto, List<ActionGroup>, QQueryOperations>
      notAllowedWithProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notAllowedWith');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActionItemDto _$ActionItemDtoFromJson(Map<String, dynamic> json) =>
    ActionItemDto(
      group: $enumDecode(_$ActionGroupEnumMap, json['group']),
      dificulty: json['dificulty'] as int? ?? 2,
      audioHash: json['audioHash'] as int?,
      imageHash: json['imageHash'] as int?,
      name: json['name'] as String,
      isActive: json['isActive'] as bool,
    );

Map<String, dynamic> _$ActionItemDtoToJson(ActionItemDto instance) =>
    <String, dynamic>{
      'group': _$ActionGroupEnumMap[instance.group]!,
      'dificulty': instance.dificulty,
      'name': instance.name,
      'isActive': instance.isActive,
      'imageHash': instance.imageHash,
      'audioHash': instance.audioHash,
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
