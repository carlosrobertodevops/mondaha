import '../database.dart';

class EstadosTable extends SupabaseTable<EstadosRow> {
  @override
  String get tableName => 'estados';

  @override
  EstadosRow createRow(Map<String, dynamic> data) => EstadosRow(data);
}

class EstadosRow extends SupabaseDataRow {
  EstadosRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => EstadosTable();

  int get estadoId => getField<int>('estado_id')!;
  set estadoId(int value) => setField<int>('estado_id', value);

  String? get nome => getField<String>('nome');
  set nome(String? value) => setField<String>('nome', value);

  String? get sigla => getField<String>('sigla');
  set sigla(String? value) => setField<String>('sigla', value);

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);
}
