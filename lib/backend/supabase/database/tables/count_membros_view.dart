import '../database.dart';

class CountMembrosViewTable extends SupabaseTable<CountMembrosViewRow> {
  @override
  String get tableName => 'count_membros_view';

  @override
  CountMembrosViewRow createRow(Map<String, dynamic> data) =>
      CountMembrosViewRow(data);
}

class CountMembrosViewRow extends SupabaseDataRow {
  CountMembrosViewRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CountMembrosViewTable();

  int? get total => getField<int>('total');
  set total(int? value) => setField<int>('total', value);
}
