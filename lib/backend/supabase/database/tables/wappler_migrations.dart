import '../database.dart';

class WapplerMigrationsTable extends SupabaseTable<WapplerMigrationsRow> {
  @override
  String get tableName => 'wappler_migrations';

  @override
  WapplerMigrationsRow createRow(Map<String, dynamic> data) =>
      WapplerMigrationsRow(data);
}

class WapplerMigrationsRow extends SupabaseDataRow {
  WapplerMigrationsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => WapplerMigrationsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  int? get batch => getField<int>('batch');
  set batch(int? value) => setField<int>('batch', value);

  DateTime? get migrationTime => getField<DateTime>('migration_time');
  set migrationTime(DateTime? value) =>
      setField<DateTime>('migration_time', value);
}
