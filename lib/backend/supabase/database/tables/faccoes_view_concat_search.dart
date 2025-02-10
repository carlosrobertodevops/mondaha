import '../database.dart';

class FaccoesViewConcatSearchTable
    extends SupabaseTable<FaccoesViewConcatSearchRow> {
  @override
  String get tableName => 'faccoes_view_concat_search';

  @override
  FaccoesViewConcatSearchRow createRow(Map<String, dynamic> data) =>
      FaccoesViewConcatSearchRow(data);
}

class FaccoesViewConcatSearchRow extends SupabaseDataRow {
  FaccoesViewConcatSearchRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => FaccoesViewConcatSearchTable();

  int? get faccaoId => getField<int>('faccao_id');
  set faccaoId(int? value) => setField<int>('faccao_id', value);

  String? get imagemPath => getField<String>('imagem_path');
  set imagemPath(String? value) => setField<String>('imagem_path', value);

  String? get nome => getField<String>('nome');
  set nome(String? value) => setField<String>('nome', value);

  String? get descricao => getField<String>('descricao');
  set descricao(String? value) => setField<String>('descricao', value);

  DateTime? get dataCriacao => getField<DateTime>('data_criacao');
  set dataCriacao(DateTime? value) => setField<DateTime>('data_criacao', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  int? get totalMembros => getField<int>('total_membros');
  set totalMembros(int? value) => setField<int>('total_membros', value);

  String? get pesquisa => getField<String>('pesquisa');
  set pesquisa(String? value) => setField<String>('pesquisa', value);
}
