import '../database.dart';

class LogsTable extends SupabaseTable<LogsRow> {
  @override
  String get tableName => 'logs';

  @override
  LogsRow createRow(Map<String, dynamic> data) => LogsRow(data);
}

class LogsRow extends SupabaseDataRow {
  LogsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => LogsTable();

  int get logId => getField<int>('log_id')!;
  set logId(int value) => setField<int>('log_id', value);

  int? get usuarioId => getField<int>('usuario_id');
  set usuarioId(int? value) => setField<int>('usuario_id', value);

  int? get agenciaId => getField<int>('agencia_id');
  set agenciaId(int? value) => setField<int>('agencia_id', value);

  int? get moduloId => getField<int>('modulo_id');
  set moduloId(int? value) => setField<int>('modulo_id', value);

  int? get acaoId => getField<int>('acao_id');
  set acaoId(int? value) => setField<int>('acao_id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);
}
