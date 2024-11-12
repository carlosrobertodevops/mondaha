import '../database.dart';

class AgenciasTable extends SupabaseTable<AgenciasRow> {
  @override
  String get tableName => 'agencias';

  @override
  AgenciasRow createRow(Map<String, dynamic> data) => AgenciasRow(data);
}

class AgenciasRow extends SupabaseDataRow {
  AgenciasRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AgenciasTable();

  int get agenciaId => getField<int>('agencia_id')!;
  set agenciaId(int value) => setField<int>('agencia_id', value);

  String? get nome => getField<String>('nome');
  set nome(String? value) => setField<String>('nome', value);

  String? get descricao => getField<String>('descricao');
  set descricao(String? value) => setField<String>('descricao', value);

  int? get nivelAgencia => getField<int>('nivel_agencia');
  set nivelAgencia(int? value) => setField<int>('nivel_agencia', value);
}
