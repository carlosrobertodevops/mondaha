import '../database.dart';

class CountUsuariosViewTable extends SupabaseTable<CountUsuariosViewRow> {
  @override
  String get tableName => 'count_usuarios_view';

  @override
  CountUsuariosViewRow createRow(Map<String, dynamic> data) =>
      CountUsuariosViewRow(data);
}

class CountUsuariosViewRow extends SupabaseDataRow {
  CountUsuariosViewRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CountUsuariosViewTable();

  int? get total => getField<int>('total');
  set total(int? value) => setField<int>('total', value);
}
