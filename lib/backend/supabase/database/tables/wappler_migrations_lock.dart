import '../database.dart';

class WapplerMigrationsLockTable
    extends SupabaseTable<WapplerMigrationsLockRow> {
  @override
  String get tableName => 'wappler_migrations_lock';

  @override
  WapplerMigrationsLockRow createRow(Map<String, dynamic> data) =>
      WapplerMigrationsLockRow(data);
}

class WapplerMigrationsLockRow extends SupabaseDataRow {
  WapplerMigrationsLockRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => WapplerMigrationsLockTable();

  int get index => getField<int>('index')!;
  set index(int value) => setField<int>('index', value);

  int? get isLocked => getField<int>('is_locked');
  set isLocked(int? value) => setField<int>('is_locked', value);
}
