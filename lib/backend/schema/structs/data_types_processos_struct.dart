// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DataTypesProcessosStruct extends BaseStruct {
  DataTypesProcessosStruct({
    int? processoId,
    int? membroId,
    String? acaoPenalNo,
    String? vara,
    String? situacaoJuridica,
    String? regime,
    String? situacaoReu,
  })  : _processoId = processoId,
        _membroId = membroId,
        _acaoPenalNo = acaoPenalNo,
        _vara = vara,
        _situacaoJuridica = situacaoJuridica,
        _regime = regime,
        _situacaoReu = situacaoReu;

  // "processo_id" field.
  int? _processoId;
  int get processoId => _processoId ?? 0;
  set processoId(int? val) => _processoId = val;

  void incrementProcessoId(int amount) => processoId = processoId + amount;

  bool hasProcessoId() => _processoId != null;

  // "membro_id" field.
  int? _membroId;
  int get membroId => _membroId ?? 0;
  set membroId(int? val) => _membroId = val;

  void incrementMembroId(int amount) => membroId = membroId + amount;

  bool hasMembroId() => _membroId != null;

  // "acao_penal_no" field.
  String? _acaoPenalNo;
  String get acaoPenalNo => _acaoPenalNo ?? '';
  set acaoPenalNo(String? val) => _acaoPenalNo = val;

  bool hasAcaoPenalNo() => _acaoPenalNo != null;

  // "vara" field.
  String? _vara;
  String get vara => _vara ?? '';
  set vara(String? val) => _vara = val;

  bool hasVara() => _vara != null;

  // "situacao_juridica" field.
  String? _situacaoJuridica;
  String get situacaoJuridica => _situacaoJuridica ?? '';
  set situacaoJuridica(String? val) => _situacaoJuridica = val;

  bool hasSituacaoJuridica() => _situacaoJuridica != null;

  // "regime" field.
  String? _regime;
  String get regime => _regime ?? '';
  set regime(String? val) => _regime = val;

  bool hasRegime() => _regime != null;

  // "situacao_reu" field.
  String? _situacaoReu;
  String get situacaoReu => _situacaoReu ?? '';
  set situacaoReu(String? val) => _situacaoReu = val;

  bool hasSituacaoReu() => _situacaoReu != null;

  static DataTypesProcessosStruct fromMap(Map<String, dynamic> data) =>
      DataTypesProcessosStruct(
        processoId: castToType<int>(data['processo_id']),
        membroId: castToType<int>(data['membro_id']),
        acaoPenalNo: data['acao_penal_no'] as String?,
        vara: data['vara'] as String?,
        situacaoJuridica: data['situacao_juridica'] as String?,
        regime: data['regime'] as String?,
        situacaoReu: data['situacao_reu'] as String?,
      );

  static DataTypesProcessosStruct? maybeFromMap(dynamic data) => data is Map
      ? DataTypesProcessosStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'processo_id': _processoId,
        'membro_id': _membroId,
        'acao_penal_no': _acaoPenalNo,
        'vara': _vara,
        'situacao_juridica': _situacaoJuridica,
        'regime': _regime,
        'situacao_reu': _situacaoReu,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'processo_id': serializeParam(
          _processoId,
          ParamType.int,
        ),
        'membro_id': serializeParam(
          _membroId,
          ParamType.int,
        ),
        'acao_penal_no': serializeParam(
          _acaoPenalNo,
          ParamType.String,
        ),
        'vara': serializeParam(
          _vara,
          ParamType.String,
        ),
        'situacao_juridica': serializeParam(
          _situacaoJuridica,
          ParamType.String,
        ),
        'regime': serializeParam(
          _regime,
          ParamType.String,
        ),
        'situacao_reu': serializeParam(
          _situacaoReu,
          ParamType.String,
        ),
      }.withoutNulls;

  static DataTypesProcessosStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      DataTypesProcessosStruct(
        processoId: deserializeParam(
          data['processo_id'],
          ParamType.int,
          false,
        ),
        membroId: deserializeParam(
          data['membro_id'],
          ParamType.int,
          false,
        ),
        acaoPenalNo: deserializeParam(
          data['acao_penal_no'],
          ParamType.String,
          false,
        ),
        vara: deserializeParam(
          data['vara'],
          ParamType.String,
          false,
        ),
        situacaoJuridica: deserializeParam(
          data['situacao_juridica'],
          ParamType.String,
          false,
        ),
        regime: deserializeParam(
          data['regime'],
          ParamType.String,
          false,
        ),
        situacaoReu: deserializeParam(
          data['situacao_reu'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'DataTypesProcessosStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DataTypesProcessosStruct &&
        processoId == other.processoId &&
        membroId == other.membroId &&
        acaoPenalNo == other.acaoPenalNo &&
        vara == other.vara &&
        situacaoJuridica == other.situacaoJuridica &&
        regime == other.regime &&
        situacaoReu == other.situacaoReu;
  }

  @override
  int get hashCode => const ListEquality().hash([
        processoId,
        membroId,
        acaoPenalNo,
        vara,
        situacaoJuridica,
        regime,
        situacaoReu
      ]);
}

DataTypesProcessosStruct createDataTypesProcessosStruct({
  int? processoId,
  int? membroId,
  String? acaoPenalNo,
  String? vara,
  String? situacaoJuridica,
  String? regime,
  String? situacaoReu,
}) =>
    DataTypesProcessosStruct(
      processoId: processoId,
      membroId: membroId,
      acaoPenalNo: acaoPenalNo,
      vara: vara,
      situacaoJuridica: situacaoJuridica,
      regime: regime,
      situacaoReu: situacaoReu,
    );
