import '../database.dart';

class FuncoesTable extends SupabaseTable<FuncoesRow> {
  @override
  String get tableName => 'funcoes';

  @override
  FuncoesRow createRow(Map<String, dynamic> data) => FuncoesRow(data);
}

class FuncoesRow extends SupabaseDataRow {
  FuncoesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => FuncoesTable();

  int get funcaoId => getField<int>('funcao_id')!;
  set funcaoId(int value) => setField<int>('funcao_id', value);

  String? get descricao => getField<String>('descricao');
  set descricao(String? value) => setField<String>('descricao', value);

  int? get grauHierarquico => getField<int>('grau_hierarquico');
  set grauHierarquico(int? value) => setField<int>('grau_hierarquico', value);

  String? get nome => getField<String>('nome');
  set nome(String? value) => setField<String>('nome', value);

  int? get faccaoId => getField<int>('faccao_id');
  set faccaoId(int? value) => setField<int>('faccao_id', value);
}
