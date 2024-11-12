// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DataTypesProcedimentosStruct extends BaseStruct {
  DataTypesProcedimentosStruct({
    String? procedimentoNo,
    String? procedimentoTipo,
    String? unidade,
    String? crime,
    DateTime? data,
  })  : _procedimentoNo = procedimentoNo,
        _procedimentoTipo = procedimentoTipo,
        _unidade = unidade,
        _crime = crime,
        _data = data;

  // "procedimento_no" field.
  String? _procedimentoNo;
  String get procedimentoNo => _procedimentoNo ?? '';
  set procedimentoNo(String? val) => _procedimentoNo = val;

  bool hasProcedimentoNo() => _procedimentoNo != null;

  // "procedimento_tipo" field.
  String? _procedimentoTipo;
  String get procedimentoTipo => _procedimentoTipo ?? '';
  set procedimentoTipo(String? val) => _procedimentoTipo = val;

  bool hasProcedimentoTipo() => _procedimentoTipo != null;

  // "unidade" field.
  String? _unidade;
  String get unidade => _unidade ?? '';
  set unidade(String? val) => _unidade = val;

  bool hasUnidade() => _unidade != null;

  // "crime" field.
  String? _crime;
  String get crime => _crime ?? '';
  set crime(String? val) => _crime = val;

  bool hasCrime() => _crime != null;

  // "data" field.
  DateTime? _data;
  DateTime? get data => _data;
  set data(DateTime? val) => _data = val;

  bool hasData() => _data != null;

  static DataTypesProcedimentosStruct fromMap(Map<String, dynamic> data) =>
      DataTypesProcedimentosStruct(
        procedimentoNo: data['procedimento_no'] as String?,
        procedimentoTipo: data['procedimento_tipo'] as String?,
        unidade: data['unidade'] as String?,
        crime: data['crime'] as String?,
        data: data['data'] as DateTime?,
      );

  static DataTypesProcedimentosStruct? maybeFromMap(dynamic data) => data is Map
      ? DataTypesProcedimentosStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'procedimento_no': _procedimentoNo,
        'procedimento_tipo': _procedimentoTipo,
        'unidade': _unidade,
        'crime': _crime,
        'data': _data,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'procedimento_no': serializeParam(
          _procedimentoNo,
          ParamType.String,
        ),
        'procedimento_tipo': serializeParam(
          _procedimentoTipo,
          ParamType.String,
        ),
        'unidade': serializeParam(
          _unidade,
          ParamType.String,
        ),
        'crime': serializeParam(
          _crime,
          ParamType.String,
        ),
        'data': serializeParam(
          _data,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static DataTypesProcedimentosStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      DataTypesProcedimentosStruct(
        procedimentoNo: deserializeParam(
          data['procedimento_no'],
          ParamType.String,
          false,
        ),
        procedimentoTipo: deserializeParam(
          data['procedimento_tipo'],
          ParamType.String,
          false,
        ),
        unidade: deserializeParam(
          data['unidade'],
          ParamType.String,
          false,
        ),
        crime: deserializeParam(
          data['crime'],
          ParamType.String,
          false,
        ),
        data: deserializeParam(
          data['data'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'DataTypesProcedimentosStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DataTypesProcedimentosStruct &&
        procedimentoNo == other.procedimentoNo &&
        procedimentoTipo == other.procedimentoTipo &&
        unidade == other.unidade &&
        crime == other.crime &&
        data == other.data;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([procedimentoNo, procedimentoTipo, unidade, crime, data]);
}

DataTypesProcedimentosStruct createDataTypesProcedimentosStruct({
  String? procedimentoNo,
  String? procedimentoTipo,
  String? unidade,
  String? crime,
  DateTime? data,
}) =>
    DataTypesProcedimentosStruct(
      procedimentoNo: procedimentoNo,
      procedimentoTipo: procedimentoTipo,
      unidade: unidade,
      crime: crime,
      data: data,
    );
