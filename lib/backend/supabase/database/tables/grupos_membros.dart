import '../database.dart';

class GruposMembrosTable extends SupabaseTable<GruposMembrosRow> {
  @override
  String get tableName => 'grupos_membros';

  @override
  GruposMembrosRow createRow(Map<String, dynamic> data) =>
      GruposMembrosRow(data);
}

class GruposMembrosRow extends SupabaseDataRow {
  GruposMembrosRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => GruposMembrosTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  int? get grupoId => getField<int>('grupo_id');
  set grupoId(int? value) => setField<int>('grupo_id', value);

  int? get membroId => getField<int>('membro_id');
  set membroId(int? value) => setField<int>('membro_id', value);
}
