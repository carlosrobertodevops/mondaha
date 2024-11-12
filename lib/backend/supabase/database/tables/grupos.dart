import '../database.dart';

class GruposTable extends SupabaseTable<GruposRow> {
  @override
  String get tableName => 'grupos';

  @override
  GruposRow createRow(Map<String, dynamic> data) => GruposRow(data);
}

class GruposRow extends SupabaseDataRow {
  GruposRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => GruposTable();

  int get grupoId => getField<int>('grupo_id')!;
  set grupoId(int value) => setField<int>('grupo_id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get nome => getField<String>('nome');
  set nome(String? value) => setField<String>('nome', value);

  String? get descricao => getField<String>('descricao');
  set descricao(String? value) => setField<String>('descricao', value);
}
