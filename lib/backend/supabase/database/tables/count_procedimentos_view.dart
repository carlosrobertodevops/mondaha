import '../database.dart';

class CountProcedimentosViewTable
    extends SupabaseTable<CountProcedimentosViewRow> {
  @override
  String get tableName => 'count_procedimentos_view';

  @override
  CountProcedimentosViewRow createRow(Map<String, dynamic> data) =>
      CountProcedimentosViewRow(data);
}

class CountProcedimentosViewRow extends SupabaseDataRow {
  CountProcedimentosViewRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CountProcedimentosViewTable();

  int? get membroId => getField<int>('membro_id');
  set membroId(int? value) => setField<int>('membro_id', value);

  int? get total => getField<int>('total');
  set total(int? value) => setField<int>('total', value);
}
