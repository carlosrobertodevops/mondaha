import '../database.dart';

class FaccoesViewTable extends SupabaseTable<FaccoesViewRow> {
  @override
  String get tableName => 'faccoes_view';

  @override
  FaccoesViewRow createRow(Map<String, dynamic> data) => FaccoesViewRow(data);
}

class FaccoesViewRow extends SupabaseDataRow {
  FaccoesViewRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => FaccoesViewTable();

  int? get faccaoId => getField<int>('faccao_id');
  set faccaoId(int? value) => setField<int>('faccao_id', value);

  String? get imagemPath => getField<String>('imagem_path');
  set imagemPath(String? value) => setField<String>('imagem_path', value);

  String? get nome => getField<String>('nome');
  set nome(String? value) => setField<String>('nome', value);

  String? get descricao => getField<String>('descricao');
  set descricao(String? value) => setField<String>('descricao', value);

  String? get dataCriacao => getField<String>('data_criacao');
  set dataCriacao(String? value) => setField<String>('data_criacao', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  int? get totalMembros => getField<int>('total_membros');
  set totalMembros(int? value) => setField<int>('total_membros', value);

  String? get pesquisa => getField<String>('pesquisa');
  set pesquisa(String? value) => setField<String>('pesquisa', value);
}
