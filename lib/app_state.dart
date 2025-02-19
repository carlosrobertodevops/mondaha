import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import "package:community_testing_ryusdv/backend/schema/structs/index.dart"
    as community_testing_ryusdv_data_schema;
import "package:community_testing_ryusdv/backend/schema/enums/enums.dart"
    as community_testing_ryusdv_enums;
import 'package:ff_commons/api_requests/api_manager.dart';
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
      _webbarminimal =
          await secureStorage.getBool('ff_webbarminimal') ?? _webbarminimal;
    });
    await _safeInitAsync(() async {
      _UsuariosImagePathLight =
          await secureStorage.getString('ff_UsuariosImagePathLight') ??
              _UsuariosImagePathLight;
    });
    await _safeInitAsync(() async {
      _UsuariosImagePathDark =
          await secureStorage.getString('ff_UsuariosImagePathDark') ??
              _UsuariosImagePathDark;
    });
    await _safeInitAsync(() async {
      _MembrosImagePathLight =
          await secureStorage.getString('ff_MembrosImagePathLight') ??
              _MembrosImagePathLight;
    });
    await _safeInitAsync(() async {
      _MembrosImagePathDark =
          await secureStorage.getString('ff_MembrosImagePathDark') ??
              _MembrosImagePathDark;
    });
    await _safeInitAsync(() async {
      _FaccoesImagePathLight =
          await secureStorage.getString('ff_FaccoesImagePathLight') ??
              _FaccoesImagePathLight;
    });
    await _safeInitAsync(() async {
      _FaccoesImagePathDark =
          await secureStorage.getString('ff_FaccoesImagePathDark') ??
              _FaccoesImagePathDark;
    });
    await _safeInitAsync(() async {
      _NordesteLngLat = latLngFromString(
              await secureStorage.getString('ff_NordesteLngLat')) ??
          _NordesteLngLat;
    });
    await _safeInitAsync(() async {
      _pesquisarMembrosMain =
          await secureStorage.getStringList('ff_pesquisarMembrosMain') ??
              _pesquisarMembrosMain;
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
  }

  int _UsuarioAtualTipoUsuarioId = 0;
  int get UsuarioAtualTipoUsuarioId => _UsuarioAtualTipoUsuarioId;
  set UsuarioAtualTipoUsuarioId(int value) {
    _UsuarioAtualTipoUsuarioId = value;
  }

  String _UsuarioAtualNomeCompleto = '';
  String get UsuarioAtualNomeCompleto => _UsuarioAtualNomeCompleto;
  set UsuarioAtualNomeCompleto(String value) {
    _UsuarioAtualNomeCompleto = value;
  }

  String _UsuarioAtualFoto = '';
  String get UsuarioAtualFoto => _UsuarioAtualFoto;
  set UsuarioAtualFoto(String value) {
    _UsuarioAtualFoto = value;
  }

  int _UsuarioAtualAgencia = 0;
  int get UsuarioAtualAgencia => _UsuarioAtualAgencia;
  set UsuarioAtualAgencia(int value) {
    _UsuarioAtualAgencia = value;
  }

  String _UsuarioAtualTipoUsuarioNome = '';
  String get UsuarioAtualTipoUsuarioNome => _UsuarioAtualTipoUsuarioNome;
  set UsuarioAtualTipoUsuarioNome(String value) {
    _UsuarioAtualTipoUsuarioNome = value;
  }

  String _UsuarioAtualAgenciaNome = '';
  String get UsuarioAtualAgenciaNome => _UsuarioAtualAgenciaNome;
  set UsuarioAtualAgenciaNome(String value) {
    _UsuarioAtualAgenciaNome = value;
  }

  String _UsuarioAtualEmail = '';
  String get UsuarioAtualEmail => _UsuarioAtualEmail;
  set UsuarioAtualEmail(String value) {
    _UsuarioAtualEmail = value;
  }

  int _CountFaccoes = 0;
  int get CountFaccoes => _CountFaccoes;
  set CountFaccoes(int value) {
    _CountFaccoes = value;
  }

  int _CountMembros = 0;
  int get CountMembros => _CountMembros;
  set CountMembros(int value) {
    _CountMembros = value;
  }

  int _CountUsuarios = 0;
  int get CountUsuarios => _CountUsuarios;
  set CountUsuarios(int value) {
    _CountUsuarios = value;
  }

  int _CountUsuariosAtivos = 0;
  int get CountUsuariosAtivos => _CountUsuariosAtivos;
  set CountUsuariosAtivos(int value) {
    _CountUsuariosAtivos = value;
  }

  int _CountMaps = 0;
  int get CountMaps => _CountMaps;
  set CountMaps(int value) {
    _CountMaps = value;
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
    secureStorage.setString('ff_UsuariosImagePathLight', value);
  }

  void deleteUsuariosImagePathLight() {
    secureStorage.delete(key: 'ff_UsuariosImagePathLight');
  }

  String _UsuariosImagePathDark =
      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/mondaha-be2293/assets/z72pv79eas1j/account_circle_96dp_E8EAED_FILL0_wght400_GRAD0_opsz48.png';
  String get UsuariosImagePathDark => _UsuariosImagePathDark;
  set UsuariosImagePathDark(String value) {
    _UsuariosImagePathDark = value;
    secureStorage.setString('ff_UsuariosImagePathDark', value);
  }

  void deleteUsuariosImagePathDark() {
    secureStorage.delete(key: 'ff_UsuariosImagePathDark');
  }

  String _MembrosImagePathLight =
      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/mondaha-be2293/assets/rgxzhoyu6nbx/groups_96dp_99999_FILL0_wght400_GRAD0_opsz48.png';
  String get MembrosImagePathLight => _MembrosImagePathLight;
  set MembrosImagePathLight(String value) {
    _MembrosImagePathLight = value;
    secureStorage.setString('ff_MembrosImagePathLight', value);
  }

  void deleteMembrosImagePathLight() {
    secureStorage.delete(key: 'ff_MembrosImagePathLight');
  }

  String _MembrosImagePathDark =
      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/mondaha-be2293/assets/3b2gr4avkyl7/groups_96dp_E8EAED_FILL0_wght400_GRAD0_opsz48.png';
  String get MembrosImagePathDark => _MembrosImagePathDark;
  set MembrosImagePathDark(String value) {
    _MembrosImagePathDark = value;
    secureStorage.setString('ff_MembrosImagePathDark', value);
  }

  void deleteMembrosImagePathDark() {
    secureStorage.delete(key: 'ff_MembrosImagePathDark');
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
    secureStorage.setString('ff_FaccoesImagePathDark', value);
  }

  void deleteFaccoesImagePathDark() {
    secureStorage.delete(key: 'ff_FaccoesImagePathDark');
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

  List<String> _pesquisarMembrosMain = ['[A-z]'];
  List<String> get pesquisarMembrosMain => _pesquisarMembrosMain;
  set pesquisarMembrosMain(List<String> value) {
    _pesquisarMembrosMain = value;
    secureStorage.setStringList('ff_pesquisarMembrosMain', value);
  }

  void deletePesquisarMembrosMain() {
    secureStorage.delete(key: 'ff_pesquisarMembrosMain');
  }

  void addToPesquisarMembrosMain(String value) {
    pesquisarMembrosMain.add(value);
    secureStorage.setStringList(
        'ff_pesquisarMembrosMain', _pesquisarMembrosMain);
  }

  void removeFromPesquisarMembrosMain(String value) {
    pesquisarMembrosMain.remove(value);
    secureStorage.setStringList(
        'ff_pesquisarMembrosMain', _pesquisarMembrosMain);
  }

  void removeAtIndexFromPesquisarMembrosMain(int index) {
    pesquisarMembrosMain.removeAt(index);
    secureStorage.setStringList(
        'ff_pesquisarMembrosMain', _pesquisarMembrosMain);
  }

  void updatePesquisarMembrosMainAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    pesquisarMembrosMain[index] = updateFn(_pesquisarMembrosMain[index]);
    secureStorage.setStringList(
        'ff_pesquisarMembrosMain', _pesquisarMembrosMain);
  }

  void insertAtIndexInPesquisarMembrosMain(int index, String value) {
    pesquisarMembrosMain.insert(index, value);
    secureStorage.setStringList(
        'ff_pesquisarMembrosMain', _pesquisarMembrosMain);
  }

  bool _buscarMembros = true;
  bool get buscarMembros => _buscarMembros;
  set buscarMembros(bool value) {
    _buscarMembros = value;
  }

  bool _buscarFaccao = true;
  bool get buscarFaccao => _buscarFaccao;
  set buscarFaccao(bool value) {
    _buscarFaccao = value;
  }

  bool _buscarUsuarios = true;
  bool get buscarUsuarios => _buscarUsuarios;
  set buscarUsuarios(bool value) {
    _buscarUsuarios = value;
  }

  int _AgenciaAtualld = 0;
  int get AgenciaAtualld => _AgenciaAtualld;
  set AgenciaAtualld(int value) {
    _AgenciaAtualld = value;
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
