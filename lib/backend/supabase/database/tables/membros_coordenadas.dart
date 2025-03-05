import '../database.dart';

class MembrosCoordenadasTable extends SupabaseTable<MembrosCoordenadasRow> {
  @override
  String get tableName => 'membros_coordenadas';

  @override
  MembrosCoordenadasRow createRow(Map<String, dynamic> data) =>
      MembrosCoordenadasRow(data);
}

class MembrosCoordenadasRow extends SupabaseDataRow {
  MembrosCoordenadasRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => MembrosCoordenadasTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get membroId => getField<int>('membro_id');
  set membroId(int? value) => setField<int>('membro_id', value);

  String? get coordenada => getField<String>('coordenada');
  set coordenada(String? value) => setField<String>('coordenada', value);

  String? get lnglat => getField<String>('lnglat');
  set lnglat(String? value) => setField<String>('lnglat', value);
}
