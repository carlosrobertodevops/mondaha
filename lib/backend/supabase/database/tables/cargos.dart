import '../database.dart';

class CargosTable extends SupabaseTable<CargosRow> {
  @override
  String get tableName => 'cargos';

  @override
  CargosRow createRow(Map<String, dynamic> data) => CargosRow(data);
}

class CargosRow extends SupabaseDataRow {
  CargosRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CargosTable();

  int get cargoId => getField<int>('cargo_id')!;
  set cargoId(int value) => setField<int>('cargo_id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get nome => getField<String>('nome');
  set nome(String? value) => setField<String>('nome', value);

  String? get descricao => getField<String>('descricao');
  set descricao(String? value) => setField<String>('descricao', value);

  int? get faccaoId => getField<int>('faccao_id');
  set faccaoId(int? value) => setField<int>('faccao_id', value);
}
