import '../database.dart';

class ProcedimentosTable extends SupabaseTable<ProcedimentosRow> {
  @override
  String get tableName => 'procedimentos';

  @override
  ProcedimentosRow createRow(Map<String, dynamic> data) =>
      ProcedimentosRow(data);
}

class ProcedimentosRow extends SupabaseDataRow {
  ProcedimentosRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ProcedimentosTable();

  int get procedimentoId => getField<int>('procedimento_id')!;
  set procedimentoId(int value) => setField<int>('procedimento_id', value);

  int? get membroId => getField<int>('membro_id');
  set membroId(int? value) => setField<int>('membro_id', value);

  String? get procedimentoNo => getField<String>('procedimento_no');
  set procedimentoNo(String? value) =>
      setField<String>('procedimento_no', value);

  String? get unidade => getField<String>('unidade');
  set unidade(String? value) => setField<String>('unidade', value);

  String? get procedimentoTipo => getField<String>('procedimento_tipo');
  set procedimentoTipo(String? value) =>
      setField<String>('procedimento_tipo', value);

  String? get crime => getField<String>('crime');
  set crime(String? value) => setField<String>('crime', value);

  String? get dataField => getField<String>('data');
  set dataField(String? value) => setField<String>('data', value);
}
