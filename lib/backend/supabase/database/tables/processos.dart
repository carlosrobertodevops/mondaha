import '../database.dart';

class ProcessosTable extends SupabaseTable<ProcessosRow> {
  @override
  String get tableName => 'processos';

  @override
  ProcessosRow createRow(Map<String, dynamic> data) => ProcessosRow(data);
}

class ProcessosRow extends SupabaseDataRow {
  ProcessosRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ProcessosTable();

  int get processoId => getField<int>('processo_id')!;
  set processoId(int value) => setField<int>('processo_id', value);

  int? get membroId => getField<int>('membro_id');
  set membroId(int? value) => setField<int>('membro_id', value);

  String? get acaoPenalNo => getField<String>('acao_penal_no');
  set acaoPenalNo(String? value) => setField<String>('acao_penal_no', value);

  String? get vara => getField<String>('vara');
  set vara(String? value) => setField<String>('vara', value);

  String? get situacaoJuridica => getField<String>('situacao_juridica');
  set situacaoJuridica(String? value) =>
      setField<String>('situacao_juridica', value);

  String? get regime => getField<String>('regime');
  set regime(String? value) => setField<String>('regime', value);

  String? get situacaoReu => getField<String>('situacao_reu');
  set situacaoReu(String? value) => setField<String>('situacao_reu', value);
}
