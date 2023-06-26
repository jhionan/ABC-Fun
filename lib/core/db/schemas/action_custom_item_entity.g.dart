// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'action_custom_item_entity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetActionCustomItemEntityCollection on Isar {
  IsarCollection<ActionCustomItemEntity> get actionCustomItemEntitys =>
      this.collection();
}

const ActionCustomItemEntitySchema = CollectionSchema(
  name: r'ActionCustomItemEntity',
  id: 272646321258518201,
  properties: {
    r'dificulty': PropertySchema(
      id: 0,
      name: r'dificulty',
      type: IsarType.long,
    ),
    r'group': PropertySchema(
      id: 1,
      name: r'group',
      type: IsarType.string,
      enumMap: _ActionCustomItemEntitygroupEnumValueMap,
    ),
    r'hashCode': PropertySchema(
      id: 2,
      name: r'hashCode',
      type: IsarType.long,
    ),
    r'imagePath': PropertySchema(
      id: 3,
      name: r'imagePath',
      type: IsarType.string,
    ),
    r'isActive': PropertySchema(
      id: 4,
      name: r'isActive',
      type: IsarType.bool,
    ),
    r'name': PropertySchema(
      id: 5,
      name: r'name',
      type: IsarType.string,
    ),
    r'notAllowedWith': PropertySchema(
      id: 6,
      name: r'notAllowedWith',
      type: IsarType.stringList,
      enumMap: _ActionCustomItemEntitynotAllowedWithEnumValueMap,
    )
  },
  estimateSize: _actionCustomItemEntityEstimateSize,
  serialize: _actionCustomItemEntitySerialize,
  deserialize: _actionCustomItemEntityDeserialize,
  deserializeProp: _actionCustomItemEntityDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _actionCustomItemEntityGetId,
  getLinks: _actionCustomItemEntityGetLinks,
  attach: _actionCustomItemEntityAttach,
  version: '3.1.0+1',
);

int _actionCustomItemEntityEstimateSize(
  ActionCustomItemEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.group.name.length * 3;
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

void _actionCustomItemEntitySerialize(
  ActionCustomItemEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.dificulty);
  writer.writeString(offsets[1], object.group.name);
  writer.writeLong(offsets[2], object.hashCode);
  writer.writeString(offsets[3], object.imagePath);
  writer.writeBool(offsets[4], object.isActive);
  writer.writeString(offsets[5], object.name);
  writer.writeStringList(
      offsets[6], object.notAllowedWith.map((e) => e.name).toList());
}

ActionCustomItemEntity _actionCustomItemEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ActionCustomItemEntity(
    dificulty: reader.readLong(offsets[0]),
    group: _ActionCustomItemEntitygroupValueEnumMap[
            reader.readStringOrNull(offsets[1])] ??
        ActionGroup.answeringPhone,
    imagePath: reader.readString(offsets[3]),
    isActive: reader.readBool(offsets[4]),
    name: reader.readString(offsets[5]),
    notAllowedWith: reader
            .readStringList(offsets[6])
            ?.map((e) =>
                _ActionCustomItemEntitynotAllowedWithValueEnumMap[e] ??
                ActionGroup.answeringPhone)
            .toList() ??
        [],
  );
  object.id = id;
  return object;
}

P _actionCustomItemEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (_ActionCustomItemEntitygroupValueEnumMap[
              reader.readStringOrNull(offset)] ??
          ActionGroup.answeringPhone) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readBool(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader
              .readStringList(offset)
              ?.map((e) =>
                  _ActionCustomItemEntitynotAllowedWithValueEnumMap[e] ??
                  ActionGroup.answeringPhone)
              .toList() ??
          []) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _ActionCustomItemEntitygroupEnumValueMap = {
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
const _ActionCustomItemEntitygroupValueEnumMap = {
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
const _ActionCustomItemEntitynotAllowedWithEnumValueMap = {
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
const _ActionCustomItemEntitynotAllowedWithValueEnumMap = {
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

Id _actionCustomItemEntityGetId(ActionCustomItemEntity object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _actionCustomItemEntityGetLinks(
    ActionCustomItemEntity object) {
  return [];
}

void _actionCustomItemEntityAttach(
    IsarCollection<dynamic> col, Id id, ActionCustomItemEntity object) {
  object.id = id;
}

extension ActionCustomItemEntityQueryWhereSort
    on QueryBuilder<ActionCustomItemEntity, ActionCustomItemEntity, QWhere> {
  QueryBuilder<ActionCustomItemEntity, ActionCustomItemEntity, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ActionCustomItemEntityQueryWhere on QueryBuilder<
    ActionCustomItemEntity, ActionCustomItemEntity, QWhereClause> {
  QueryBuilder<ActionCustomItemEntity, ActionCustomItemEntity,
      QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ActionCustomItemEntity, ActionCustomItemEntity,
      QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<ActionCustomItemEntity, ActionCustomItemEntity,
      QAfterWhereClause> idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ActionCustomItemEntity, ActionCustomItemEntity,
      QAfterWhereClause> idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ActionCustomItemEntity, ActionCustomItemEntity,
      QAfterWhereClause> idBetween(
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

extension ActionCustomItemEntityQueryFilter on QueryBuilder<
    ActionCustomItemEntity, ActionCustomItemEntity, QFilterCondition> {
  QueryBuilder<ActionCustomItemEntity, ActionCustomItemEntity,
      QAfterFilterCondition> dificultyEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dificulty',
        value: value,
      ));
    });
  }

  QueryBuilder<ActionCustomItemEntity, ActionCustomItemEntity,
      QAfterFilterCondition> dificultyGreaterThan(
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

  QueryBuilder<ActionCustomItemEntity, ActionCustomItemEntity,
      QAfterFilterCondition> dificultyLessThan(
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

  QueryBuilder<ActionCustomItemEntity, ActionCustomItemEntity,
      QAfterFilterCondition> dificultyBetween(
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

  QueryBuilder<ActionCustomItemEntity, ActionCustomItemEntity,
      QAfterFilterCondition> groupEqualTo(
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

  QueryBuilder<ActionCustomItemEntity, ActionCustomItemEntity,
      QAfterFilterCondition> groupGreaterThan(
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

  QueryBuilder<ActionCustomItemEntity, ActionCustomItemEntity,
      QAfterFilterCondition> groupLessThan(
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

  QueryBuilder<ActionCustomItemEntity, ActionCustomItemEntity,
      QAfterFilterCondition> groupBetween(
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

  QueryBuilder<ActionCustomItemEntity, ActionCustomItemEntity,
      QAfterFilterCondition> groupStartsWith(
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

  QueryBuilder<ActionCustomItemEntity, ActionCustomItemEntity,
      QAfterFilterCondition> groupEndsWith(
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

  QueryBuilder<ActionCustomItemEntity, ActionCustomItemEntity,
          QAfterFilterCondition>
      groupContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'group',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ActionCustomItemEntity, ActionCustomItemEntity,
          QAfterFilterCondition>
      groupMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'group',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ActionCustomItemEntity, ActionCustomItemEntity,
      QAfterFilterCondition> groupIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'group',
        value: '',
      ));
    });
  }

  QueryBuilder<ActionCustomItemEntity, ActionCustomItemEntity,
      QAfterFilterCondition> groupIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'group',
        value: '',
      ));
    });
  }

  QueryBuilder<ActionCustomItemEntity, ActionCustomItemEntity,
      QAfterFilterCondition> hashCodeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hashCode',
        value: value,
      ));
    });
  }

  QueryBuilder<ActionCustomItemEntity, ActionCustomItemEntity,
      QAfterFilterCondition> hashCodeGreaterThan(
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

  QueryBuilder<ActionCustomItemEntity, ActionCustomItemEntity,
      QAfterFilterCondition> hashCodeLessThan(
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

  QueryBuilder<ActionCustomItemEntity, ActionCustomItemEntity,
      QAfterFilterCondition> hashCodeBetween(
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

  QueryBuilder<ActionCustomItemEntity, ActionCustomItemEntity,
      QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<ActionCustomItemEntity, ActionCustomItemEntity,
      QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<ActionCustomItemEntity, ActionCustomItemEntity,
      QAfterFilterCondition> idEqualTo(Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ActionCustomItemEntity, ActionCustomItemEntity,
      QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<ActionCustomItemEntity, ActionCustomItemEntity,
      QAfterFilterCondition> idLessThan(
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

  QueryBuilder<ActionCustomItemEntity, ActionCustomItemEntity,
      QAfterFilterCondition> idBetween(
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

  QueryBuilder<ActionCustomItemEntity, ActionCustomItemEntity,
      QAfterFilterCondition> imagePathEqualTo(
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

  QueryBuilder<ActionCustomItemEntity, ActionCustomItemEntity,
      QAfterFilterCondition> imagePathGreaterThan(
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

  QueryBuilder<ActionCustomItemEntity, ActionCustomItemEntity,
      QAfterFilterCondition> imagePathLessThan(
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

  QueryBuilder<ActionCustomItemEntity, ActionCustomItemEntity,
      QAfterFilterCondition> imagePathBetween(
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

  QueryBuilder<ActionCustomItemEntity, ActionCustomItemEntity,
      QAfterFilterCondition> imagePathStartsWith(
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

  QueryBuilder<ActionCustomItemEntity, ActionCustomItemEntity,
      QAfterFilterCondition> imagePathEndsWith(
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

  QueryBuilder<ActionCustomItemEntity, ActionCustomItemEntity,
          QAfterFilterCondition>
      imagePathContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'imagePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ActionCustomItemEntity, ActionCustomItemEntity,
          QAfterFilterCondition>
      imagePathMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'imagePath',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ActionCustomItemEntity, ActionCustomItemEntity,
      QAfterFilterCondition> imagePathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imagePath',
        value: '',
      ));
    });
  }

  QueryBuilder<ActionCustomItemEntity, ActionCustomItemEntity,
      QAfterFilterCondition> imagePathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'imagePath',
        value: '',
      ));
    });
  }

  QueryBuilder<ActionCustomItemEntity, ActionCustomItemEntity,
      QAfterFilterCondition> isActiveEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isActive',
        value: value,
      ));
    });
  }

  QueryBuilder<ActionCustomItemEntity, ActionCustomItemEntity,
      QAfterFilterCondition> nameEqualTo(
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

  QueryBuilder<ActionCustomItemEntity, ActionCustomItemEntity,
      QAfterFilterCondition> nameGreaterThan(
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

  QueryBuilder<ActionCustomItemEntity, ActionCustomItemEntity,
      QAfterFilterCondition> nameLessThan(
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

  QueryBuilder<ActionCustomItemEntity, ActionCustomItemEntity,
      QAfterFilterCondition> nameBetween(
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

  QueryBuilder<ActionCustomItemEntity, ActionCustomItemEntity,
      QAfterFilterCondition> nameStartsWith(
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

  QueryBuilder<ActionCustomItemEntity, ActionCustomItemEntity,
      QAfterFilterCondition> nameEndsWith(
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

  QueryBuilder<ActionCustomItemEntity, ActionCustomItemEntity,
          QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ActionCustomItemEntity, ActionCustomItemEntity,
          QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ActionCustomItemEntity, ActionCustomItemEntity,
      QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<ActionCustomItemEntity, ActionCustomItemEntity,
      QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<ActionCustomItemEntity, ActionCustomItemEntity,
      QAfterFilterCondition> notAllowedWithElementEqualTo(
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

  QueryBuilder<ActionCustomItemEntity, ActionCustomItemEntity,
      QAfterFilterCondition> notAllowedWithElementGreaterThan(
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

  QueryBuilder<ActionCustomItemEntity, ActionCustomItemEntity,
      QAfterFilterCondition> notAllowedWithElementLessThan(
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

  QueryBuilder<ActionCustomItemEntity, ActionCustomItemEntity,
      QAfterFilterCondition> notAllowedWithElementBetween(
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

  QueryBuilder<ActionCustomItemEntity, ActionCustomItemEntity,
      QAfterFilterCondition> notAllowedWithElementStartsWith(
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

  QueryBuilder<ActionCustomItemEntity, ActionCustomItemEntity,
      QAfterFilterCondition> notAllowedWithElementEndsWith(
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

  QueryBuilder<ActionCustomItemEntity, ActionCustomItemEntity,
          QAfterFilterCondition>
      notAllowedWithElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'notAllowedWith',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ActionCustomItemEntity, ActionCustomItemEntity,
          QAfterFilterCondition>
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

  QueryBuilder<ActionCustomItemEntity, ActionCustomItemEntity,
      QAfterFilterCondition> notAllowedWithElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notAllowedWith',
        value: '',
      ));
    });
  }

  QueryBuilder<ActionCustomItemEntity, ActionCustomItemEntity,
      QAfterFilterCondition> notAllowedWithElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'notAllowedWith',
        value: '',
      ));
    });
  }

  QueryBuilder<ActionCustomItemEntity, ActionCustomItemEntity,
      QAfterFilterCondition> notAllowedWithLengthEqualTo(int length) {
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

  QueryBuilder<ActionCustomItemEntity, ActionCustomItemEntity,
      QAfterFilterCondition> notAllowedWithIsEmpty() {
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

  QueryBuilder<ActionCustomItemEntity, ActionCustomItemEntity,
      QAfterFilterCondition> notAllowedWithIsNotEmpty() {
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

  QueryBuilder<ActionCustomItemEntity, ActionCustomItemEntity,
      QAfterFilterCondition> notAllowedWithLengthLessThan(
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

  QueryBuilder<ActionCustomItemEntity, ActionCustomItemEntity,
      QAfterFilterCondition> notAllowedWithLengthGreaterThan(
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

  QueryBuilder<ActionCustomItemEntity, ActionCustomItemEntity,
      QAfterFilterCondition> notAllowedWithLengthBetween(
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

extension ActionCustomItemEntityQueryObject on QueryBuilder<
    ActionCustomItemEntity, ActionCustomItemEntity, QFilterCondition> {}

extension ActionCustomItemEntityQueryLinks on QueryBuilder<
    ActionCustomItemEntity, ActionCustomItemEntity, QFilterCondition> {}

extension ActionCustomItemEntityQuerySortBy
    on QueryBuilder<ActionCustomItemEntity, ActionCustomItemEntity, QSortBy> {
  QueryBuilder<ActionCustomItemEntity, ActionCustomItemEntity, QAfterSortBy>
      sortByDificulty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dificulty', Sort.asc);
    });
  }

  QueryBuilder<ActionCustomItemEntity, ActionCustomItemEntity, QAfterSortBy>
      sortByDificultyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dificulty', Sort.desc);
    });
  }

  QueryBuilder<ActionCustomItemEntity, ActionCustomItemEntity, QAfterSortBy>
      sortByGroup() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'group', Sort.asc);
    });
  }

  QueryBuilder<ActionCustomItemEntity, ActionCustomItemEntity, QAfterSortBy>
      sortByGroupDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'group', Sort.desc);
    });
  }

  QueryBuilder<ActionCustomItemEntity, ActionCustomItemEntity, QAfterSortBy>
      sortByHashCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.asc);
    });
  }

  QueryBuilder<ActionCustomItemEntity, ActionCustomItemEntity, QAfterSortBy>
      sortByHashCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.desc);
    });
  }

  QueryBuilder<ActionCustomItemEntity, ActionCustomItemEntity, QAfterSortBy>
      sortByImagePath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imagePath', Sort.asc);
    });
  }

  QueryBuilder<ActionCustomItemEntity, ActionCustomItemEntity, QAfterSortBy>
      sortByImagePathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imagePath', Sort.desc);
    });
  }

  QueryBuilder<ActionCustomItemEntity, ActionCustomItemEntity, QAfterSortBy>
      sortByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<ActionCustomItemEntity, ActionCustomItemEntity, QAfterSortBy>
      sortByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<ActionCustomItemEntity, ActionCustomItemEntity, QAfterSortBy>
      sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<ActionCustomItemEntity, ActionCustomItemEntity, QAfterSortBy>
      sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension ActionCustomItemEntityQuerySortThenBy on QueryBuilder<
    ActionCustomItemEntity, ActionCustomItemEntity, QSortThenBy> {
  QueryBuilder<ActionCustomItemEntity, ActionCustomItemEntity, QAfterSortBy>
      thenByDificulty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dificulty', Sort.asc);
    });
  }

  QueryBuilder<ActionCustomItemEntity, ActionCustomItemEntity, QAfterSortBy>
      thenByDificultyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dificulty', Sort.desc);
    });
  }

  QueryBuilder<ActionCustomItemEntity, ActionCustomItemEntity, QAfterSortBy>
      thenByGroup() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'group', Sort.asc);
    });
  }

  QueryBuilder<ActionCustomItemEntity, ActionCustomItemEntity, QAfterSortBy>
      thenByGroupDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'group', Sort.desc);
    });
  }

  QueryBuilder<ActionCustomItemEntity, ActionCustomItemEntity, QAfterSortBy>
      thenByHashCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.asc);
    });
  }

  QueryBuilder<ActionCustomItemEntity, ActionCustomItemEntity, QAfterSortBy>
      thenByHashCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.desc);
    });
  }

  QueryBuilder<ActionCustomItemEntity, ActionCustomItemEntity, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ActionCustomItemEntity, ActionCustomItemEntity, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ActionCustomItemEntity, ActionCustomItemEntity, QAfterSortBy>
      thenByImagePath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imagePath', Sort.asc);
    });
  }

  QueryBuilder<ActionCustomItemEntity, ActionCustomItemEntity, QAfterSortBy>
      thenByImagePathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imagePath', Sort.desc);
    });
  }

  QueryBuilder<ActionCustomItemEntity, ActionCustomItemEntity, QAfterSortBy>
      thenByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<ActionCustomItemEntity, ActionCustomItemEntity, QAfterSortBy>
      thenByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<ActionCustomItemEntity, ActionCustomItemEntity, QAfterSortBy>
      thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<ActionCustomItemEntity, ActionCustomItemEntity, QAfterSortBy>
      thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension ActionCustomItemEntityQueryWhereDistinct
    on QueryBuilder<ActionCustomItemEntity, ActionCustomItemEntity, QDistinct> {
  QueryBuilder<ActionCustomItemEntity, ActionCustomItemEntity, QDistinct>
      distinctByDificulty() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dificulty');
    });
  }

  QueryBuilder<ActionCustomItemEntity, ActionCustomItemEntity, QDistinct>
      distinctByGroup({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'group', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ActionCustomItemEntity, ActionCustomItemEntity, QDistinct>
      distinctByHashCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hashCode');
    });
  }

  QueryBuilder<ActionCustomItemEntity, ActionCustomItemEntity, QDistinct>
      distinctByImagePath({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'imagePath', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ActionCustomItemEntity, ActionCustomItemEntity, QDistinct>
      distinctByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isActive');
    });
  }

  QueryBuilder<ActionCustomItemEntity, ActionCustomItemEntity, QDistinct>
      distinctByName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ActionCustomItemEntity, ActionCustomItemEntity, QDistinct>
      distinctByNotAllowedWith() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notAllowedWith');
    });
  }
}

extension ActionCustomItemEntityQueryProperty on QueryBuilder<
    ActionCustomItemEntity, ActionCustomItemEntity, QQueryProperty> {
  QueryBuilder<ActionCustomItemEntity, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ActionCustomItemEntity, int, QQueryOperations>
      dificultyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dificulty');
    });
  }

  QueryBuilder<ActionCustomItemEntity, ActionGroup, QQueryOperations>
      groupProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'group');
    });
  }

  QueryBuilder<ActionCustomItemEntity, int, QQueryOperations>
      hashCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hashCode');
    });
  }

  QueryBuilder<ActionCustomItemEntity, String, QQueryOperations>
      imagePathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'imagePath');
    });
  }

  QueryBuilder<ActionCustomItemEntity, bool, QQueryOperations>
      isActiveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isActive');
    });
  }

  QueryBuilder<ActionCustomItemEntity, String, QQueryOperations>
      nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<ActionCustomItemEntity, List<ActionGroup>, QQueryOperations>
      notAllowedWithProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notAllowedWith');
    });
  }
}
