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

  String? get nome => getField<String>('nome');
  set nome(String? value) => setField<String>('nome', value);

  String? get descricao => getField<String>('descricao');
  set descricao(String? value) => setField<String>('descricao', value);

  DateTime? get dataCriacao => getField<DateTime>('data_criacao');
  set dataCriacao(DateTime? value) => setField<DateTime>('data_criacao', value);

  int? get totalMembros => getField<int>('total_membros');
  set totalMembros(int? value) => setField<int>('total_membros', value);
}
