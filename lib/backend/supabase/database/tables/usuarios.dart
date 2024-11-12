import '../database.dart';

class UsuariosTable extends SupabaseTable<UsuariosRow> {
  @override
  String get tableName => 'usuarios';

  @override
  UsuariosRow createRow(Map<String, dynamic> data) => UsuariosRow(data);
}

class UsuariosRow extends SupabaseDataRow {
  UsuariosRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UsuariosTable();

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get nomeCompleto => getField<String>('nome_completo');
  set nomeCompleto(String? value) => setField<String>('nome_completo', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  int get usuarioId => getField<int>('usuario_id')!;
  set usuarioId(int value) => setField<int>('usuario_id', value);

  String? get fotoPath => getField<String>('foto_path');
  set fotoPath(String? value) => setField<String>('foto_path', value);

  String? get descricao => getField<String>('descricao');
  set descricao(String? value) => setField<String>('descricao', value);

  DateTime? get acessoAt => getField<DateTime>('acesso_at');
  set acessoAt(DateTime? value) => setField<DateTime>('acesso_at', value);

  int? get tipoUsuarioId => getField<int>('tipo_usuario_id');
  set tipoUsuarioId(int? value) => setField<int>('tipo_usuario_id', value);

  int? get agenciaId => getField<int>('agencia_id');
  set agenciaId(int? value) => setField<int>('agencia_id', value);
}
