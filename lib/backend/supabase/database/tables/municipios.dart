import '../database.dart';

class MunicipiosTable extends SupabaseTable<MunicipiosRow> {
  @override
  String get tableName => 'municipios';

  @override
  MunicipiosRow createRow(Map<String, dynamic> data) => MunicipiosRow(data);
}

class MunicipiosRow extends SupabaseDataRow {
  MunicipiosRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => MunicipiosTable();

  int? get estadoId => getField<int>('estado_id');
  set estadoId(int? value) => setField<int>('estado_id', value);

  int? get municipioId => getField<int>('municipio_id');
  set municipioId(int? value) => setField<int>('municipio_id', value);

  String? get nome => getField<String>('nome');
  set nome(String? value) => setField<String>('nome', value);

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);
}
