import '../database.dart';

class UsuariosViewTable extends SupabaseTable<UsuariosViewRow> {
  @override
  String get tableName => 'usuarios_view';

  @override
  UsuariosViewRow createRow(Map<String, dynamic> data) => UsuariosViewRow(data);
}

class UsuariosViewRow extends SupabaseDataRow {
  UsuariosViewRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UsuariosViewTable();

  int? get usuarioId => getField<int>('usuario_id');
  set usuarioId(int? value) => setField<int>('usuario_id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get nomeCompleto => getField<String>('nome_completo');
  set nomeCompleto(String? value) => setField<String>('nome_completo', value);

  String? get agenciaNome => getField<String>('agencia_nome');
  set agenciaNome(String? value) => setField<String>('agencia_nome', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  String? get fotoPath => getField<String>('foto_path');
  set fotoPath(String? value) => setField<String>('foto_path', value);

  String? get descricao => getField<String>('descricao');
  set descricao(String? value) => setField<String>('descricao', value);

  DateTime? get acessoAt => getField<DateTime>('acesso_at');
  set acessoAt(DateTime? value) => setField<DateTime>('acesso_at', value);

  int? get tipoUsuarioId => getField<int>('tipo_usuario_id');
  set tipoUsuarioId(int? value) => setField<int>('tipo_usuario_id', value);

  String? get tipoUsuarioDescricao =>
      getField<String>('tipo_usuario_descricao');
  set tipoUsuarioDescricao(String? value) =>
      setField<String>('tipo_usuario_descricao', value);

  int? get agenciaId => getField<int>('agencia_id');
  set agenciaId(int? value) => setField<int>('agencia_id', value);

  bool? get excluido => getField<bool>('excluido');
  set excluido(bool? value) => setField<bool>('excluido', value);

  bool? get bloqueado => getField<bool>('bloqueado');
  set bloqueado(bool? value) => setField<bool>('bloqueado', value);

  int? get situacao => getField<int>('situacao');
  set situacao(int? value) => setField<int>('situacao', value);
}
