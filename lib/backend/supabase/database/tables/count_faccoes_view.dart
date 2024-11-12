import '../database.dart';

class CountFaccoesViewTable extends SupabaseTable<CountFaccoesViewRow> {
  @override
  String get tableName => 'count_faccoes_view';

  @override
  CountFaccoesViewRow createRow(Map<String, dynamic> data) =>
      CountFaccoesViewRow(data);
}

class CountFaccoesViewRow extends SupabaseDataRow {
  CountFaccoesViewRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CountFaccoesViewTable();

  int? get total => getField<int>('total');
  set total(int? value) => setField<int>('total', value);
}
