import '../database.dart';

class VaraTable extends SupabaseTable<VaraRow> {
  @override
  String get tableName => 'vara';

  @override
  VaraRow createRow(Map<String, dynamic> data) => VaraRow(data);
}

class VaraRow extends SupabaseDataRow {
  VaraRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => VaraTable();

  int get varaId => getField<int>('vara_id')!;
  set varaId(int value) => setField<int>('vara_id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get nome => getField<String>('nome');
  set nome(String? value) => setField<String>('nome', value);

  String? get descricao => getField<String>('descricao');
  set descricao(String? value) => setField<String>('descricao', value);

  int? get estadoId => getField<int>('estado_id');
  set estadoId(int? value) => setField<int>('estado_id', value);

  int? get municipioId => getField<int>('municipio_id');
  set municipioId(int? value) => setField<int>('municipio_id', value);
}
