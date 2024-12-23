import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import '/backend/api_requests/api_manager.dart';
import 'backend/supabase/supabase.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      _AGENCIA = await secureStorage.getString('ff_AGENCIA') ?? _AGENCIA;
    });
    await _safeInitAsync(() async {
      _webbarminimal =
          await secureStorage.getBool('ff_webbarminimal') ?? _webbarminimal;
    });
    await _safeInitAsync(() async {
      _UsuarioAtualId =
          await secureStorage.getInt('ff_UsuarioAtualId') ?? _UsuarioAtualId;
    });
    await _safeInitAsync(() async {
      _UsuarioAtualTipoUsuarioId =
          await secureStorage.getInt('ff_UsuarioAtualTipoUsuarioId') ??
              _UsuarioAtualTipoUsuarioId;
    });
    await _safeInitAsync(() async {
      _UsuarioAtualNomeCompleto =
          await secureStorage.getString('ff_UsuarioAtualNomeCompleto') ??
              _UsuarioAtualNomeCompleto;
    });
    await _safeInitAsync(() async {
      _UsuarioAtualFoto =
          await secureStorage.getString('ff_UsuarioAtualFoto') ??
              _UsuarioAtualFoto;
    });
    await _safeInitAsync(() async {
      _UsuarioAtualAgencia =
          await secureStorage.getInt('ff_UsuarioAtualAgencia') ??
              _UsuarioAtualAgencia;
    });
    await _safeInitAsync(() async {
      _UsuarioAtualTipoUsuarioNome =
          await secureStorage.getString('ff_UsuarioAtualTipoUsuarioNome') ??
              _UsuarioAtualTipoUsuarioNome;
    });
    await _safeInitAsync(() async {
      _UsuarioAtualAgenciaNome =
          await secureStorage.getString('ff_UsuarioAtualAgenciaNome') ??
              _UsuarioAtualAgenciaNome;
    });
    await _safeInitAsync(() async {
      _UsuarioAtualEmail =
          await secureStorage.getString('ff_UsuarioAtualEmail') ??
              _UsuarioAtualEmail;
    });
    await _safeInitAsync(() async {
      _CountFaccoes =
          await secureStorage.getInt('ff_CountFaccoes') ?? _CountFaccoes;
    });
    await _safeInitAsync(() async {
      _CountMembros =
          await secureStorage.getInt('ff_CountMembros') ?? _CountMembros;
    });
    await _safeInitAsync(() async {
      _CountUsuarios =
          await secureStorage.getInt('ff_CountUsuarios') ?? _CountUsuarios;
    });
    await _safeInitAsync(() async {
      _CountUsuariosAtivos =
          await secureStorage.getInt('ff_CountUsuariosAtivos') ??
              _CountUsuariosAtivos;
    });
    await _safeInitAsync(() async {
      _CountMaps = await secureStorage.getInt('ff_CountMaps') ?? _CountMaps;
    });
    await _safeInitAsync(() async {
      _FaccoesImagePathLight =
          await secureStorage.getString('ff_FaccoesImagePathLight') ??
              _FaccoesImagePathLight;
    });
    await _safeInitAsync(() async {
      _NordesteLngLat = latLngFromString(
              await secureStorage.getString('ff_NordesteLngLat')) ??
          _NordesteLngLat;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  String _AGENCIA = 'CHEGII';
  String get AGENCIA => _AGENCIA;
  set AGENCIA(String value) {
    _AGENCIA = value;
    secureStorage.setString('ff_AGENCIA', value);
  }

  void deleteAGENCIA() {
    secureStorage.delete(key: 'ff_AGENCIA');
  }

  int _EDITFACCAOID = 0;
  int get EDITFACCAOID => _EDITFACCAOID;
  set EDITFACCAOID(int value) {
    _EDITFACCAOID = value;
  }

  bool _webbarminimal = false;
  bool get webbarminimal => _webbarminimal;
  set webbarminimal(bool value) {
    _webbarminimal = value;
    secureStorage.setBool('ff_webbarminimal', value);
  }

  void deleteWebbarminimal() {
    secureStorage.delete(key: 'ff_webbarminimal');
  }

  int _UsuarioAtualId = 0;
  int get UsuarioAtualId => _UsuarioAtualId;
  set UsuarioAtualId(int value) {
    _UsuarioAtualId = value;
    secureStorage.setInt('ff_UsuarioAtualId', value);
  }

  void deleteUsuarioAtualId() {
    secureStorage.delete(key: 'ff_UsuarioAtualId');
  }

  int _UsuarioAtualTipoUsuarioId = 0;
  int get UsuarioAtualTipoUsuarioId => _UsuarioAtualTipoUsuarioId;
  set UsuarioAtualTipoUsuarioId(int value) {
    _UsuarioAtualTipoUsuarioId = value;
    secureStorage.setInt('ff_UsuarioAtualTipoUsuarioId', value);
  }

  void deleteUsuarioAtualTipoUsuarioId() {
    secureStorage.delete(key: 'ff_UsuarioAtualTipoUsuarioId');
  }

  String _UsuarioAtualNomeCompleto = '';
  String get UsuarioAtualNomeCompleto => _UsuarioAtualNomeCompleto;
  set UsuarioAtualNomeCompleto(String value) {
    _UsuarioAtualNomeCompleto = value;
    secureStorage.setString('ff_UsuarioAtualNomeCompleto', value);
  }

  void deleteUsuarioAtualNomeCompleto() {
    secureStorage.delete(key: 'ff_UsuarioAtualNomeCompleto');
  }

  String _UsuarioAtualFoto = '';
  String get UsuarioAtualFoto => _UsuarioAtualFoto;
  set UsuarioAtualFoto(String value) {
    _UsuarioAtualFoto = value;
    secureStorage.setString('ff_UsuarioAtualFoto', value);
  }

  void deleteUsuarioAtualFoto() {
    secureStorage.delete(key: 'ff_UsuarioAtualFoto');
  }

  int _UsuarioAtualAgencia = 0;
  int get UsuarioAtualAgencia => _UsuarioAtualAgencia;
  set UsuarioAtualAgencia(int value) {
    _UsuarioAtualAgencia = value;
    secureStorage.setInt('ff_UsuarioAtualAgencia', value);
  }

  void deleteUsuarioAtualAgencia() {
    secureStorage.delete(key: 'ff_UsuarioAtualAgencia');
  }

  String _UsuarioAtualTipoUsuarioNome = '';
  String get UsuarioAtualTipoUsuarioNome => _UsuarioAtualTipoUsuarioNome;
  set UsuarioAtualTipoUsuarioNome(String value) {
    _UsuarioAtualTipoUsuarioNome = value;
    secureStorage.setString('ff_UsuarioAtualTipoUsuarioNome', value);
  }

  void deleteUsuarioAtualTipoUsuarioNome() {
    secureStorage.delete(key: 'ff_UsuarioAtualTipoUsuarioNome');
  }

  String _UsuarioAtualAgenciaNome = '';
  String get UsuarioAtualAgenciaNome => _UsuarioAtualAgenciaNome;
  set UsuarioAtualAgenciaNome(String value) {
    _UsuarioAtualAgenciaNome = value;
    secureStorage.setString('ff_UsuarioAtualAgenciaNome', value);
  }

  void deleteUsuarioAtualAgenciaNome() {
    secureStorage.delete(key: 'ff_UsuarioAtualAgenciaNome');
  }

  String _UsuarioAtualEmail = '';
  String get UsuarioAtualEmail => _UsuarioAtualEmail;
  set UsuarioAtualEmail(String value) {
    _UsuarioAtualEmail = value;
    secureStorage.setString('ff_UsuarioAtualEmail', value);
  }

  void deleteUsuarioAtualEmail() {
    secureStorage.delete(key: 'ff_UsuarioAtualEmail');
  }

  int _CountFaccoes = 0;
  int get CountFaccoes => _CountFaccoes;
  set CountFaccoes(int value) {
    _CountFaccoes = value;
    secureStorage.setInt('ff_CountFaccoes', value);
  }

  void deleteCountFaccoes() {
    secureStorage.delete(key: 'ff_CountFaccoes');
  }

  int _CountMembros = 0;
  int get CountMembros => _CountMembros;
  set CountMembros(int value) {
    _CountMembros = value;
    secureStorage.setInt('ff_CountMembros', value);
  }

  void deleteCountMembros() {
    secureStorage.delete(key: 'ff_CountMembros');
  }

  int _CountUsuarios = 0;
  int get CountUsuarios => _CountUsuarios;
  set CountUsuarios(int value) {
    _CountUsuarios = value;
    secureStorage.setInt('ff_CountUsuarios', value);
  }

  void deleteCountUsuarios() {
    secureStorage.delete(key: 'ff_CountUsuarios');
  }

  int _CountUsuariosAtivos = 0;
  int get CountUsuariosAtivos => _CountUsuariosAtivos;
  set CountUsuariosAtivos(int value) {
    _CountUsuariosAtivos = value;
    secureStorage.setInt('ff_CountUsuariosAtivos', value);
  }

  void deleteCountUsuariosAtivos() {
    secureStorage.delete(key: 'ff_CountUsuariosAtivos');
  }

  int _CountMaps = 0;
  int get CountMaps => _CountMaps;
  set CountMaps(int value) {
    _CountMaps = value;
    secureStorage.setInt('ff_CountMaps', value);
  }

  void deleteCountMaps() {
    secureStorage.delete(key: 'ff_CountMaps');
  }

  bool _UsuarioLiberado = false;
  bool get UsuarioLiberado => _UsuarioLiberado;
  set UsuarioLiberado(bool value) {
    _UsuarioLiberado = value;
  }

  int _ParAgenciaId = 0;
  int get ParAgenciaId => _ParAgenciaId;
  set ParAgenciaId(int value) {
    _ParAgenciaId = value;
  }

  String _UsuariosImagePathLight =
      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/mondaha-be2293/assets/79wfovohiaq7/account_circle_96dp_99999_FILL0_wght400_GRAD0_opsz48.png';
  String get UsuariosImagePathLight => _UsuariosImagePathLight;
  set UsuariosImagePathLight(String value) {
    _UsuariosImagePathLight = value;
  }

  String _UsuariosImagePathDark =
      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/mondaha-be2293/assets/z72pv79eas1j/account_circle_96dp_E8EAED_FILL0_wght400_GRAD0_opsz48.png';
  String get UsuariosImagePathDark => _UsuariosImagePathDark;
  set UsuariosImagePathDark(String value) {
    _UsuariosImagePathDark = value;
  }

  String _MembrosImagePathLight =
      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/mondaha-be2293/assets/rgxzhoyu6nbx/groups_96dp_99999_FILL0_wght400_GRAD0_opsz48.png';
  String get MembrosImagePathLight => _MembrosImagePathLight;
  set MembrosImagePathLight(String value) {
    _MembrosImagePathLight = value;
  }

  String _MembrosImagePathDark =
      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/mondaha-be2293/assets/3b2gr4avkyl7/groups_96dp_E8EAED_FILL0_wght400_GRAD0_opsz48.png';
  String get MembrosImagePathDark => _MembrosImagePathDark;
  set MembrosImagePathDark(String value) {
    _MembrosImagePathDark = value;
  }

  String _FaccoesImagePathLight =
      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/mondaha-be2293/assets/gqts8womzdbd/account_tree_96dp_99999_FILL0_wght400_GRAD0_opsz48.png';
  String get FaccoesImagePathLight => _FaccoesImagePathLight;
  set FaccoesImagePathLight(String value) {
    _FaccoesImagePathLight = value;
    secureStorage.setString('ff_FaccoesImagePathLight', value);
  }

  void deleteFaccoesImagePathLight() {
    secureStorage.delete(key: 'ff_FaccoesImagePathLight');
  }

  String _FaccoesImagePathDark =
      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/mondaha-be2293/assets/tbkdcsazoiiq/account_tree_96dp_E8EAED_FILL0_wght400_GRAD0_opsz48.png';
  String get FaccoesImagePathDark => _FaccoesImagePathDark;
  set FaccoesImagePathDark(String value) {
    _FaccoesImagePathDark = value;
  }

  LatLng? _NordesteLngLat = LatLng(-10.08, -40.577);
  LatLng? get NordesteLngLat => _NordesteLngLat;
  set NordesteLngLat(LatLng? value) {
    _NordesteLngLat = value;
    value != null
        ? secureStorage.setString('ff_NordesteLngLat', value.serialize())
        : secureStorage.remove('ff_NordesteLngLat');
  }

  void deleteNordesteLngLat() {
    secureStorage.delete(key: 'ff_NordesteLngLat');
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
