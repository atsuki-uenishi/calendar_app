// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_db.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: type=lint
class ScheduleItemData extends DataClass
    implements Insertable<ScheduleItemData> {
  final int id;
  final String title;
  final String comment;
  final DateTime startDate;
  final DateTime endDate;
  final bool allDay;
  ScheduleItemData(
      {required this.id,
      required this.title,
      required this.comment,
      required this.startDate,
      required this.endDate,
      required this.allDay});
  factory ScheduleItemData.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return ScheduleItemData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      comment: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}comment'])!,
      startDate: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}start_date'])!,
      endDate: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}end_date'])!,
      allDay: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}all_day'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['comment'] = Variable<String>(comment);
    map['start_date'] = Variable<DateTime>(startDate);
    map['end_date'] = Variable<DateTime>(endDate);
    map['all_day'] = Variable<bool>(allDay);
    return map;
  }

  ScheduleItemCompanion toCompanion(bool nullToAbsent) {
    return ScheduleItemCompanion(
      id: Value(id),
      title: Value(title),
      comment: Value(comment),
      startDate: Value(startDate),
      endDate: Value(endDate),
      allDay: Value(allDay),
    );
  }

  factory ScheduleItemData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ScheduleItemData(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      comment: serializer.fromJson<String>(json['comment']),
      startDate: serializer.fromJson<DateTime>(json['startDate']),
      endDate: serializer.fromJson<DateTime>(json['endDate']),
      allDay: serializer.fromJson<bool>(json['allDay']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'comment': serializer.toJson<String>(comment),
      'startDate': serializer.toJson<DateTime>(startDate),
      'endDate': serializer.toJson<DateTime>(endDate),
      'allDay': serializer.toJson<bool>(allDay),
    };
  }

  ScheduleItemData copyWith(
          {int? id,
          String? title,
          String? comment,
          DateTime? startDate,
          DateTime? endDate,
          bool? allDay}) =>
      ScheduleItemData(
        id: id ?? this.id,
        title: title ?? this.title,
        comment: comment ?? this.comment,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        allDay: allDay ?? this.allDay,
      );
  @override
  String toString() {
    return (StringBuffer('ScheduleItemData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('comment: $comment, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('allDay: $allDay')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, title, comment, startDate, endDate, allDay);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ScheduleItemData &&
          other.id == this.id &&
          other.title == this.title &&
          other.comment == this.comment &&
          other.startDate == this.startDate &&
          other.endDate == this.endDate &&
          other.allDay == this.allDay);
}

class ScheduleItemCompanion extends UpdateCompanion<ScheduleItemData> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> comment;
  final Value<DateTime> startDate;
  final Value<DateTime> endDate;
  final Value<bool> allDay;
  const ScheduleItemCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.comment = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.allDay = const Value.absent(),
  });
  ScheduleItemCompanion.insert({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.comment = const Value.absent(),
    required DateTime startDate,
    required DateTime endDate,
    this.allDay = const Value.absent(),
  })  : startDate = Value(startDate),
        endDate = Value(endDate);
  static Insertable<ScheduleItemData> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? comment,
    Expression<DateTime>? startDate,
    Expression<DateTime>? endDate,
    Expression<bool>? allDay,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (comment != null) 'comment': comment,
      if (startDate != null) 'start_date': startDate,
      if (endDate != null) 'end_date': endDate,
      if (allDay != null) 'all_day': allDay,
    });
  }

  ScheduleItemCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String>? comment,
      Value<DateTime>? startDate,
      Value<DateTime>? endDate,
      Value<bool>? allDay}) {
    return ScheduleItemCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      comment: comment ?? this.comment,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      allDay: allDay ?? this.allDay,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (comment.present) {
      map['comment'] = Variable<String>(comment.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<DateTime>(startDate.value);
    }
    if (endDate.present) {
      map['end_date'] = Variable<DateTime>(endDate.value);
    }
    if (allDay.present) {
      map['all_day'] = Variable<bool>(allDay.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ScheduleItemCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('comment: $comment, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('allDay: $allDay')
          ..write(')'))
        .toString();
  }
}

class $ScheduleItemTable extends ScheduleItem
    with TableInfo<$ScheduleItemTable, ScheduleItemData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ScheduleItemTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String?> title =
      GeneratedColumn<String?>('title', aliasedName, false,
          additionalChecks: GeneratedColumn.checkTextLength(
            minTextLength: 1,
          ),
          type: const StringType(),
          requiredDuringInsert: false,
          defaultValue: const Constant(''));
  final VerificationMeta _commentMeta = const VerificationMeta('comment');
  @override
  late final GeneratedColumn<String?> comment = GeneratedColumn<String?>(
      'comment', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  final VerificationMeta _startDateMeta = const VerificationMeta('startDate');
  @override
  late final GeneratedColumn<DateTime?> startDate = GeneratedColumn<DateTime?>(
      'start_date', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _endDateMeta = const VerificationMeta('endDate');
  @override
  late final GeneratedColumn<DateTime?> endDate = GeneratedColumn<DateTime?>(
      'end_date', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _allDayMeta = const VerificationMeta('allDay');
  @override
  late final GeneratedColumn<bool?> allDay = GeneratedColumn<bool?>(
      'all_day', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (all_day IN (0, 1))',
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns =>
      [id, title, comment, startDate, endDate, allDay];
  @override
  String get aliasedName => _alias ?? 'schedule_item';
  @override
  String get actualTableName => 'schedule_item';
  @override
  VerificationContext validateIntegrity(Insertable<ScheduleItemData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    }
    if (data.containsKey('comment')) {
      context.handle(_commentMeta,
          comment.isAcceptableOrUnknown(data['comment']!, _commentMeta));
    }
    if (data.containsKey('start_date')) {
      context.handle(_startDateMeta,
          startDate.isAcceptableOrUnknown(data['start_date']!, _startDateMeta));
    } else if (isInserting) {
      context.missing(_startDateMeta);
    }
    if (data.containsKey('end_date')) {
      context.handle(_endDateMeta,
          endDate.isAcceptableOrUnknown(data['end_date']!, _endDateMeta));
    } else if (isInserting) {
      context.missing(_endDateMeta);
    }
    if (data.containsKey('all_day')) {
      context.handle(_allDayMeta,
          allDay.isAcceptableOrUnknown(data['all_day']!, _allDayMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ScheduleItemData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return ScheduleItemData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $ScheduleItemTable createAlias(String alias) {
    return $ScheduleItemTable(attachedDatabase, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $ScheduleItemTable scheduleItem = $ScheduleItemTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [scheduleItem];
}
