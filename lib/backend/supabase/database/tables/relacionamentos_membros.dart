import '../database.dart';

class RelacionamentosMembrosTable
    extends SupabaseTable<RelacionamentosMembrosRow> {
  @override
  String get tableName => 'relacionamentos_membros';

  @override
  RelacionamentosMembrosRow createRow(Map<String, dynamic> data) =>
      RelacionamentosMembrosRow(data);
}

class RelacionamentosMembrosRow extends SupabaseDataRow {
  RelacionamentosMembrosRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => RelacionamentosMembrosTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  int? get membro01Id => getField<int>('membro_01_id');
  set membro01Id(int? value) => setField<int>('membro_01_id', value);

  int? get membro02 => getField<int>('membro_02_');
  set membro02(int? value) => setField<int>('membro_02_', value);
}
