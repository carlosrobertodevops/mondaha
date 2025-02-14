// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DataTypesProcedimentosStruct extends BaseStruct {
  DataTypesProcedimentosStruct({
    int? procedimentoId,
    int? membroId,
    String? procedimentoNo,
    String? unidade,
    String? procedimentoTipo,
    String? crime,
    String? data,
  })  : _procedimentoId = procedimentoId,
        _membroId = membroId,
        _procedimentoNo = procedimentoNo,
        _unidade = unidade,
        _procedimentoTipo = procedimentoTipo,
        _crime = crime,
        _data = data;

  // "procedimento_id" field.
  int? _procedimentoId;
  int get procedimentoId => _procedimentoId ?? 0;
  set procedimentoId(int? val) => _procedimentoId = val;

  void incrementProcedimentoId(int amount) =>
      procedimentoId = procedimentoId + amount;

  bool hasProcedimentoId() => _procedimentoId != null;

  // "membro_id" field.
  int? _membroId;
  int get membroId => _membroId ?? 0;
  set membroId(int? val) => _membroId = val;

  void incrementMembroId(int amount) => membroId = membroId + amount;

  bool hasMembroId() => _membroId != null;

  // "procedimento_no" field.
  String? _procedimentoNo;
  String get procedimentoNo => _procedimentoNo ?? '';
  set procedimentoNo(String? val) => _procedimentoNo = val;

  bool hasProcedimentoNo() => _procedimentoNo != null;

  // "unidade" field.
  String? _unidade;
  String get unidade => _unidade ?? '';
  set unidade(String? val) => _unidade = val;

  bool hasUnidade() => _unidade != null;

  // "procedimento_tipo" field.
  String? _procedimentoTipo;
  String get procedimentoTipo => _procedimentoTipo ?? '';
  set procedimentoTipo(String? val) => _procedimentoTipo = val;

  bool hasProcedimentoTipo() => _procedimentoTipo != null;

  // "crime" field.
  String? _crime;
  String get crime => _crime ?? '';
  set crime(String? val) => _crime = val;

  bool hasCrime() => _crime != null;

  // "data" field.
  String? _data;
  String get data => _data ?? '';
  set data(String? val) => _data = val;

  bool hasData() => _data != null;

  static DataTypesProcedimentosStruct fromMap(Map<String, dynamic> data) =>
      DataTypesProcedimentosStruct(
        procedimentoId: castToType<int>(data['procedimento_id']),
        membroId: castToType<int>(data['membro_id']),
        procedimentoNo: data['procedimento_no'] as String?,
        unidade: data['unidade'] as String?,
        procedimentoTipo: data['procedimento_tipo'] as String?,
        crime: data['crime'] as String?,
        data: data['data'] as String?,
      );

  static DataTypesProcedimentosStruct? maybeFromMap(dynamic data) => data is Map
      ? DataTypesProcedimentosStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'procedimento_id': _procedimentoId,
        'membro_id': _membroId,
        'procedimento_no': _procedimentoNo,
        'unidade': _unidade,
        'procedimento_tipo': _procedimentoTipo,
        'crime': _crime,
        'data': _data,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'procedimento_id': serializeParam(
          _procedimentoId,
          ParamType.int,
        ),
        'membro_id': serializeParam(
          _membroId,
          ParamType.int,
        ),
        'procedimento_no': serializeParam(
          _procedimentoNo,
          ParamType.String,
        ),
        'unidade': serializeParam(
          _unidade,
          ParamType.String,
        ),
        'procedimento_tipo': serializeParam(
          _procedimentoTipo,
          ParamType.String,
        ),
        'crime': serializeParam(
          _crime,
          ParamType.String,
        ),
        'data': serializeParam(
          _data,
          ParamType.String,
        ),
      }.withoutNulls;

  static DataTypesProcedimentosStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      DataTypesProcedimentosStruct(
        procedimentoId: deserializeParam(
          data['procedimento_id'],
          ParamType.int,
          false,
        ),
        membroId: deserializeParam(
          data['membro_id'],
          ParamType.int,
          false,
        ),
        procedimentoNo: deserializeParam(
          data['procedimento_no'],
          ParamType.String,
          false,
        ),
        unidade: deserializeParam(
          data['unidade'],
          ParamType.String,
          false,
        ),
        procedimentoTipo: deserializeParam(
          data['procedimento_tipo'],
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
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'DataTypesProcedimentosStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DataTypesProcedimentosStruct &&
        procedimentoId == other.procedimentoId &&
        membroId == other.membroId &&
        procedimentoNo == other.procedimentoNo &&
        unidade == other.unidade &&
        procedimentoTipo == other.procedimentoTipo &&
        crime == other.crime &&
        data == other.data;
  }

  @override
  int get hashCode => const ListEquality().hash([
        procedimentoId,
        membroId,
        procedimentoNo,
        unidade,
        procedimentoTipo,
        crime,
        data
      ]);
}

DataTypesProcedimentosStruct createDataTypesProcedimentosStruct({
  int? procedimentoId,
  int? membroId,
  String? procedimentoNo,
  String? unidade,
  String? procedimentoTipo,
  String? crime,
  String? data,
}) =>
    DataTypesProcedimentosStruct(
      procedimentoId: procedimentoId,
      membroId: membroId,
      procedimentoNo: procedimentoNo,
      unidade: unidade,
      procedimentoTipo: procedimentoTipo,
      crime: crime,
      data: data,
    );
