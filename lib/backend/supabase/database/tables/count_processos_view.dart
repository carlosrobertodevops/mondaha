import '../database.dart';

class CountProcessosViewTable extends SupabaseTable<CountProcessosViewRow> {
  @override
  String get tableName => 'count_processos_view';

  @override
  CountProcessosViewRow createRow(Map<String, dynamic> data) =>
      CountProcessosViewRow(data);
}

class CountProcessosViewRow extends SupabaseDataRow {
  CountProcessosViewRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CountProcessosViewTable();

  int? get membroId => getField<int>('membro_id');
  set membroId(int? value) => setField<int>('membro_id', value);

  int? get total => getField<int>('total');
  set total(int? value) => setField<int>('total', value);
}
