import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:io';

part 'schedule_db.g.dart';

class ScheduleItem extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title =>
      text().withDefault(const Constant('')).withLength(min: 1)();
  TextColumn get comment => text().withDefault(const Constant(''))();
  DateTimeColumn get startDate => dateTime()();
  DateTimeColumn get endDate => dateTime()();
  BoolColumn get allDay => boolean().withDefault(const Constant(false))();
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(join(dbFolder.path, 'db.sqlite'));
    driftRuntimeOptions.dontWarnAboutMultipleDatabases = true;
    return NativeDatabase(file);
  });
}

@DriftDatabase(tables: [ScheduleItem])
class MyDatabase extends _$MyDatabase {
  MyDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<List<ScheduleItemData>> readAllScheduleData() =>
      select(scheduleItem).get();

  Future writeSchedule(ScheduleItemCompanion data) =>
      into(scheduleItem).insert(data);

  Future updateSchedule(ScheduleItemCompanion data, int id) =>
      (update(scheduleItem)..where((it) => it.id.equals(id))).write(data);

  Future deleteSchedule(int id) =>
      (delete(scheduleItem)..where((it) => it.id.equals(id))).go();
}
