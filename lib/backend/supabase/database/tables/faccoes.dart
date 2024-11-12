import '../database.dart';

class FaccoesTable extends SupabaseTable<FaccoesRow> {
  @override
  String get tableName => 'faccoes';

  @override
  FaccoesRow createRow(Map<String, dynamic> data) => FaccoesRow(data);
}

class FaccoesRow extends SupabaseDataRow {
  FaccoesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => FaccoesTable();

  int get faccaoId => getField<int>('faccao_id')!;
  set faccaoId(int value) => setField<int>('faccao_id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get nome => getField<String>('nome');
  set nome(String? value) => setField<String>('nome', value);

  String? get descricao => getField<String>('descricao');
  set descricao(String? value) => setField<String>('descricao', value);

  DateTime? get dataCriacao => getField<DateTime>('data_criacao');
  set dataCriacao(DateTime? value) => setField<DateTime>('data_criacao', value);

  List<String> get fundadores => getListField<String>('fundadores');
  set fundadores(List<String>? value) =>
      setListField<String>('fundadores', value);

  String? get imagemPath => getField<String>('imagem_path');
  set imagemPath(String? value) => setField<String>('imagem_path', value);
}
