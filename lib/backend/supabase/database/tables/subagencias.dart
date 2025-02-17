import '../database.dart';

class SubagenciasTable extends SupabaseTable<SubagenciasRow> {
  @override
  String get tableName => 'subagencias';

  @override
  SubagenciasRow createRow(Map<String, dynamic> data) => SubagenciasRow(data);
}

class SubagenciasRow extends SupabaseDataRow {
  SubagenciasRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => SubagenciasTable();

  int get subagenciaId => getField<int>('subagencia_id')!;
  set subagenciaId(int value) => setField<int>('subagencia_id', value);

  int get agenciaId => getField<int>('agencia_id')!;
  set agenciaId(int value) => setField<int>('agencia_id', value);

  String? get nome => getField<String>('nome');
  set nome(String? value) => setField<String>('nome', value);

  String? get descricao => getField<String>('descricao');
  set descricao(String? value) => setField<String>('descricao', value);

  int? get nivelSubagencia => getField<int>('nivel_subagencia');
  set nivelSubagencia(int? value) => setField<int>('nivel_subagencia', value);
}
