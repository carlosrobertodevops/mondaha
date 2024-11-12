import '../database.dart';

class TiposUsuariosTable extends SupabaseTable<TiposUsuariosRow> {
  @override
  String get tableName => 'tipos_usuarios';

  @override
  TiposUsuariosRow createRow(Map<String, dynamic> data) =>
      TiposUsuariosRow(data);
}

class TiposUsuariosRow extends SupabaseDataRow {
  TiposUsuariosRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TiposUsuariosTable();

  int get tipoUsuarioId => getField<int>('tipo_usuario_id')!;
  set tipoUsuarioId(int value) => setField<int>('tipo_usuario_id', value);

  String? get descricao => getField<String>('descricao');
  set descricao(String? value) => setField<String>('descricao', value);

  int? get nivel => getField<int>('nivel');
  set nivel(int? value) => setField<int>('nivel', value);
}
