// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'action_custom_item_entity.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class ActionCustomItemEntity extends _ActionCustomItemEntity
    with RealmEntity, RealmObjectBase, RealmObject {
  ActionCustomItemEntity(
    String name,
    String imagePath, {
    String? audioPath,
    Iterable<ActionGroup> notAllowedWith = const [],
  }) {
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'imagePath', imagePath);
    RealmObjectBase.set(this, 'audioPath', audioPath);
    RealmObjectBase.set<RealmList<ActionGroup>>(
        this, 'notAllowedWith', RealmList<ActionGroup>(notAllowedWith));
  }

  ActionCustomItemEntity._();

  @override
  String get name => RealmObjectBase.get<String>(this, 'name') as String;
  @override
  set name(String value) => RealmObjectBase.set(this, 'name', value);

  @override
  String get imagePath =>
      RealmObjectBase.get<String>(this, 'imagePath') as String;
  @override
  set imagePath(String value) => RealmObjectBase.set(this, 'imagePath', value);

  @override
  String? get audioPath =>
      RealmObjectBase.get<String>(this, 'audioPath') as String?;
  @override
  set audioPath(String? value) => RealmObjectBase.set(this, 'audioPath', value);

  @override
  RealmList<ActionGroup> get notAllowedWith =>
      RealmObjectBase.get<ActionGroup>(this, 'notAllowedWith')
          as RealmList<ActionGroup>;
  @override
  set notAllowedWith(covariant RealmList<ActionGroup> value) =>
      throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<ActionCustomItemEntity>> get changes =>
      RealmObjectBase.getChanges<ActionCustomItemEntity>(this);

  @override
  ActionCustomItemEntity freeze() =>
      RealmObjectBase.freezeObject<ActionCustomItemEntity>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(ActionCustomItemEntity._);
    return const SchemaObject(ObjectType.realmObject, ActionCustomItemEntity,
        'ActionCustomItemEntity', [
      SchemaProperty('name', RealmPropertyType.string),
      SchemaProperty('imagePath', RealmPropertyType.string),
      SchemaProperty('audioPath', RealmPropertyType.string, optional: true),
      SchemaProperty('notAllowedWith', RealmPropertyType.object,
          linkTarget: 'ActionGroup', collectionType: RealmCollectionType.list),
    ]);
  }
}
