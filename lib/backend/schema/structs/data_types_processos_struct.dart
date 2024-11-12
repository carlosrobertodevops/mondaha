// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DataTypesProcessosStruct extends BaseStruct {
  DataTypesProcessosStruct({
    String? noAcaoPenal,
    String? vara,
    String? situacaoJuridica,
    String? regime,
    String? situacaoReu,
  })  : _noAcaoPenal = noAcaoPenal,
        _vara = vara,
        _situacaoJuridica = situacaoJuridica,
        _regime = regime,
        _situacaoReu = situacaoReu;

  // "no_acao_penal" field.
  String? _noAcaoPenal;
  String get noAcaoPenal => _noAcaoPenal ?? '';
  set noAcaoPenal(String? val) => _noAcaoPenal = val;

  bool hasNoAcaoPenal() => _noAcaoPenal != null;

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
        noAcaoPenal: data['no_acao_penal'] as String?,
        vara: data['vara'] as String?,
        situacaoJuridica: data['situacao_juridica'] as String?,
        regime: data['regime'] as String?,
        situacaoReu: data['situacao_reu'] as String?,
      );

  static DataTypesProcessosStruct? maybeFromMap(dynamic data) => data is Map
      ? DataTypesProcessosStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'no_acao_penal': _noAcaoPenal,
        'vara': _vara,
        'situacao_juridica': _situacaoJuridica,
        'regime': _regime,
        'situacao_reu': _situacaoReu,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'no_acao_penal': serializeParam(
          _noAcaoPenal,
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
        noAcaoPenal: deserializeParam(
          data['no_acao_penal'],
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
        noAcaoPenal == other.noAcaoPenal &&
        vara == other.vara &&
        situacaoJuridica == other.situacaoJuridica &&
        regime == other.regime &&
        situacaoReu == other.situacaoReu;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([noAcaoPenal, vara, situacaoJuridica, regime, situacaoReu]);
}

DataTypesProcessosStruct createDataTypesProcessosStruct({
  String? noAcaoPenal,
  String? vara,
  String? situacaoJuridica,
  String? regime,
  String? situacaoReu,
}) =>
    DataTypesProcessosStruct(
      noAcaoPenal: noAcaoPenal,
      vara: vara,
      situacaoJuridica: situacaoJuridica,
      regime: regime,
      situacaoReu: situacaoReu,
    );
