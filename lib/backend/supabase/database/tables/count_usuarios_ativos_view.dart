import '../database.dart';

class CountUsuariosAtivosViewTable
    extends SupabaseTable<CountUsuariosAtivosViewRow> {
  @override
  String get tableName => 'count_usuarios_ativos_view';

  @override
  CountUsuariosAtivosViewRow createRow(Map<String, dynamic> data) =>
      CountUsuariosAtivosViewRow(data);
}

class CountUsuariosAtivosViewRow extends SupabaseDataRow {
  CountUsuariosAtivosViewRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CountUsuariosAtivosViewTable();

  int? get total => getField<int>('total');
  set total(int? value) => setField<int>('total', value);
}
