import 'dart:convert';
import 'dart:typed_data';
import '../schema/structs/index.dart';
import "package:community_testing_ryusdv/backend/schema/structs/index.dart"
    as community_testing_ryusdv_data_schema;

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_commons/api_requests/api_manager.dart';

import 'package:ff_commons/api_requests/api_paging_params.dart';

export 'package:ff_commons/api_requests/api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class DeletarUserAuthNoSUPABASECall {
  static Future<ApiCallResponse> call({
    String? pNomeCompleto = '',
    String? pFaccaoNome = '',
    String? pFuncaoNome = '',
    String? pEstadoNome = '',
    String? pMunicipioNome = '',
    List<String>? pAlcunhaList,
    List<String>? pTresUltimoLocaisPresoList,
  }) async {
    final pAlcunha = _serializeList(pAlcunhaList);
    final pTresUltimoLocaisPreso = _serializeList(pTresUltimoLocaisPresoList);

    final ffApiRequestBody = '''
{
  "p_nome_completo": "${pNomeCompleto}",
  "p_faccao_nome": "${pFaccaoNome}",
  "p_funcao_nome": "${pFuncaoNome}",
  "p_estado_nome": "${pEstadoNome}",
  "p_municipio_nome": "${pMunicipioNome}",
  "p_alcunha": ${pAlcunha},
  "p_tres_ultimo_locais_preso": ${pTresUltimoLocaisPreso}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Deletar User Auth no SUPABASE',
      apiUrl: 'https://buzlazhtcndpegsnijcw.supabase.co/auth/v1/user',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJ1emxhemh0Y25kcGVnc25pamN3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzQ2OTI2OTksImV4cCI6MjA1MDI2ODY5OX0.myFxYtm5Q3WF1WlV0AJzPoRLKK8W0et8MnKUk4e-nPU',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJ1emxhemh0Y25kcGVnc25pamN3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzQ2OTI2OTksImV4cCI6MjA1MDI2ODY5OX0.myFxYtm5Q3WF1WlV0AJzPoRLKK8W0et8MnKUk4e-nPU',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class BuscarEmAuthUsersNoSUPABASECall {
  static Future<ApiCallResponse> call({
    String? email = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Buscar em Auth Users no SUPABASE ',
      apiUrl: 'https://buzlazhtcndpegsnijcw.supabase.co/auth/v1/user',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJ1emxhemh0Y25kcGVnc25pamN3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzQ2OTI2OTksImV4cCI6MjA1MDI2ODY5OX0.myFxYtm5Q3WF1WlV0AJzPoRLKK8W0et8MnKUk4e-nPU',
        'Content-Type': 'application/json',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJ1emxhemh0Y25kcGVnc25pamN3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzQ2OTI2OTksImV4cCI6MjA1MDI2ODY5OX0.myFxYtm5Q3WF1WlV0AJzPoRLKK8W0et8MnKUk4e-nPU',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class LoginNoSUPABASECall {
  static Future<ApiCallResponse> call({
    String? email = 'tenroberto2011@gmail.com',
    String? password = '@CRneto04',
  }) async {
    final ffApiRequestBody = '''
{
  "email": "${email}",
  "password": "${password}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Login no SUPABASE',
      apiUrl:
          'https://buzlazhtcndpegsnijcw.supabase.co/auth/v1/token?grant_type=password',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJ1emxhemh0Y25kcGVnc25pamN3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzQ2OTI2OTksImV4cCI6MjA1MDI2ODY5OX0.myFxYtm5Q3WF1WlV0AJzPoRLKK8W0et8MnKUk4e-nPU',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SignupNoSUPABASECall {
  static Future<ApiCallResponse> call({
    String? email = 'tenroberto2011@gmail.com',
    String? password = '@CRneto04',
  }) async {
    final ffApiRequestBody = '''
{
  "email": "${email}",
  "password": "${password}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Signup no SUPABASE',
      apiUrl: 'https://buzlazhtcndpegsnijcw.supabase.co/auth/v1/signup',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJ1emxhemh0Y25kcGVnc25pamN3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzQ2OTI2OTksImV4cCI6MjA1MDI2ODY5OX0.myFxYtm5Q3WF1WlV0AJzPoRLKK8W0et8MnKUk4e-nPU',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UsuarioAddCall {
  static Future<ApiCallResponse> call({
    String? email = '',
    String? userId = '',
    String? nomeCompleto = '',
    int? agenciaId = 26,
    int? tipoUsuarioId = 9,
  }) async {
    final ffApiRequestBody = '''
{
  "email": "${email}",
  "user_id": "${userId}",
  "nome_completo": "${nomeCompleto}",
  "agencia_id": "${agenciaId}",
  "usuario_tipo_id": "${tipoUsuarioId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'UsuarioAdd',
      apiUrl: 'https://buzlazhtcndpegsnijcw.supabase.co/rest/v1/usuarios',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJ1emxhemh0Y25kcGVnc25pamN3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzQ2OTI2OTksImV4cCI6MjA1MDI2ODY5OX0.myFxYtm5Q3WF1WlV0AJzPoRLKK8W0et8MnKUk4e-nPU',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJ1emxhemh0Y25kcGVnc25pamN3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzQ2OTI2OTksImV4cCI6MjA1MDI2ODY5OX0.myFxYtm5Q3WF1WlV0AJzPoRLKK8W0et8MnKUk4e-nPU',
        'Prefer': 'return=minimal',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class LogsAddCall {
  static Future<ApiCallResponse> call({
    int? usuarioId,
    int? agenciaId,
    int? moduloId,
    int? acaoId,
  }) async {
    final ffApiRequestBody = '''
{
  "usuario_id": ${usuarioId},
  "agencia_id": ${agenciaId},
  "modulo_id": ${moduloId},
  "acao_id": ${acaoId}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'LogsAdd',
      apiUrl: 'https://buzlazhtcndpegsnijcw.supabase.co/rest/v1/logs',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJ1emxhemh0Y25kcGVnc25pamN3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzQ2OTI2OTksImV4cCI6MjA1MDI2ODY5OX0.myFxYtm5Q3WF1WlV0AJzPoRLKK8W0et8MnKUk4e-nPU',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJ1emxhemh0Y25kcGVnc25pamN3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzQ2OTI2OTksImV4cCI6MjA1MDI2ODY5OX0.myFxYtm5Q3WF1WlV0AJzPoRLKK8W0et8MnKUk4e-nPU',
        'Prefer': 'return=minimal',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ProcedimentosDeleteNullCall {
  static Future<ApiCallResponse> call({
    int? membroId,
  }) async {
    final ffApiRequestBody = '''
{
  "membro_id": "${membroId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ProcedimentosDeleteNull',
      apiUrl:
          'https://buzlazhtcndpegsnijcw.supabase.co/rest/v1/rpc/procedimentos_delete_null',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJ1emxhemh0Y25kcGVnc25pamN3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzQ2OTI2OTksImV4cCI6MjA1MDI2ODY5OX0.myFxYtm5Q3WF1WlV0AJzPoRLKK8W0et8MnKUk4e-nPU',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJ1emxhemh0Y25kcGVnc25pamN3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzQ2OTI2OTksImV4cCI6MjA1MDI2ODY5OX0.myFxYtm5Q3WF1WlV0AJzPoRLKK8W0et8MnKUk4e-nPU',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ProcessosDeleteNullCall {
  static Future<ApiCallResponse> call({
    int? membroId,
  }) async {
    final ffApiRequestBody = '''
{
  "membro_id": "${membroId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ProcessosDeleteNull',
      apiUrl:
          'https://buzlazhtcndpegsnijcw.supabase.co/rest/v1/rpc/processos_delete_null',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJ1emxhemh0Y25kcGVnc25pamN3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzQ2OTI2OTksImV4cCI6MjA1MDI2ODY5OX0.myFxYtm5Q3WF1WlV0AJzPoRLKK8W0et8MnKUk4e-nPU',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJ1emxhemh0Y25kcGVnc25pamN3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzQ2OTI2OTksImV4cCI6MjA1MDI2ODY5OX0.myFxYtm5Q3WF1WlV0AJzPoRLKK8W0et8MnKUk4e-nPU',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ProcedimentosAddCall {
  static Future<ApiCallResponse> call({
    int? membroId,
    String? procedimentoNo = '',
    String? unidade = '',
    String? procedimentoTipo = '',
    String? crime = '',
    String? data = '',
  }) async {
    final ffApiRequestBody = '''
{
  "p_membro_id": "${membroId}",
  "p_procedimento_no": "${procedimentoNo}",
  "p_unidade": "${unidade}",
  "p_procedimento_tipo": "${procedimentoTipo}",
  "p_crime": "${crime}",
  "p_data": "${data}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ProcedimentosAdd',
      apiUrl:
          'https://buzlazhtcndpegsnijcw.supabase.co/rest/v1/rpc/procedimento_add',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJ1emxhemh0Y25kcGVnc25pamN3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzQ2OTI2OTksImV4cCI6MjA1MDI2ODY5OX0.myFxYtm5Q3WF1WlV0AJzPoRLKK8W0et8MnKUk4e-nPU',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJ1emxhemh0Y25kcGVnc25pamN3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzQ2OTI2OTksImV4cCI6MjA1MDI2ODY5OX0.myFxYtm5Q3WF1WlV0AJzPoRLKK8W0et8MnKUk4e-nPU',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ProcedimentoAddCall {
  static Future<ApiCallResponse> call({
    int? membroId,
    String? procedimentoNo = '',
    String? unidade = '',
    String? procedimentoTipo = '',
    String? crime = '',
    String? data = '',
  }) async {
    final ffApiRequestBody = '''
{
  "p_membro_id": "${membroId}",
  "p_procedimento_no": "${procedimentoNo}",
  "p_unidade": "${unidade}",
  "p_procedimento_tipo": "${procedimentoTipo}",
  "p_crime": "${crime}",
  "p_data": "${data}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ProcedimentoAdd ',
      apiUrl:
          'https://buzlazhtcndpegsnijcw.supabase.co/rest/v1/rpc/procedimento_add',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJ1emxhemh0Y25kcGVnc25pamN3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzQ2OTI2OTksImV4cCI6MjA1MDI2ODY5OX0.myFxYtm5Q3WF1WlV0AJzPoRLKK8W0et8MnKUk4e-nPU',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJ1emxhemh0Y25kcGVnc25pamN3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzQ2OTI2OTksImV4cCI6MjA1MDI2ODY5OX0.myFxYtm5Q3WF1WlV0AJzPoRLKK8W0et8MnKUk4e-nPU',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ProcedimentosGetCall {
  static Future<ApiCallResponse> call({
    int? membroId,
  }) async {
    final ffApiRequestBody = '''
{
  "p_membro_id": "${membroId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ProcedimentosGet',
      apiUrl:
          'https://buzlazhtcndpegsnijcw.supabase.co/rest/v1/rpc/procedimentos_search',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJ1emxhemh0Y25kcGVnc25pamN3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzQ2OTI2OTksImV4cCI6MjA1MDI2ODY5OX0.myFxYtm5Q3WF1WlV0AJzPoRLKK8W0et8MnKUk4e-nPU',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJ1emxhemh0Y25kcGVnc25pamN3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzQ2OTI2OTksImV4cCI6MjA1MDI2ODY5OX0.myFxYtm5Q3WF1WlV0AJzPoRLKK8W0et8MnKUk4e-nPU',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? procedimentoId(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].procedimento_id''',
      ));
  static List<int>? membroid(dynamic response) => (getJsonField(
        response,
        r'''$[:].membro_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? procedimentono(dynamic response) => (getJsonField(
        response,
        r'''$[:].procedimento_no''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? unidade(dynamic response) => (getJsonField(
        response,
        r'''$[:].unidade''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? procedimentotipo(dynamic response) => (getJsonField(
        response,
        r'''$[:].procedimento_tipo''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? crime(dynamic response) => (getJsonField(
        response,
        r'''$[:].crime''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? data(dynamic response) => (getJsonField(
        response,
        r'''$[:].data''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class ProcedimentosBuscaNoCall {
  static Future<ApiCallResponse> call({
    String? procedimentoNo = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'ProcedimentosBuscaNo',
      apiUrl:
          'https://buzlazhtcndpegsnijcw.supabase.co/rest/v1/procedimentos?procedimento_no=eq.${procedimentoNo}&select=*',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJ1emxhemh0Y25kcGVnc25pamN3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzQ2OTI2OTksImV4cCI6MjA1MDI2ODY5OX0.myFxYtm5Q3WF1WlV0AJzPoRLKK8W0et8MnKUk4e-nPU',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJ1emxhemh0Y25kcGVnc25pamN3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzQ2OTI2OTksImV4cCI6MjA1MDI2ODY5OX0.myFxYtm5Q3WF1WlV0AJzPoRLKK8W0et8MnKUk4e-nPU',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? procedimentoNo(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$[:].procedimento_no''',
      ));
}

class ProcessosAddCall {
  static Future<ApiCallResponse> call({
    int? membroId,
    String? acaoPenalNo = '',
    String? vara = '',
    String? situacaoJuridica = '',
    String? regime = '',
    String? situacaoReu = '',
  }) async {
    final ffApiRequestBody = '''
{
  "p_membro_id": "${membroId}",
  "p_acao_penal_no": "${acaoPenalNo}",
  "p_vara": "${vara}",
  "p_situacao_juridica": "${situacaoJuridica}",
  "p_regime": "${regime}",
  "p_situacao_reu": "${situacaoReu}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ProcessosAdd',
      apiUrl:
          'https://buzlazhtcndpegsnijcw.supabase.co/rest/v1/rpc/processo_add',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJ1emxhemh0Y25kcGVnc25pamN3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzQ2OTI2OTksImV4cCI6MjA1MDI2ODY5OX0.myFxYtm5Q3WF1WlV0AJzPoRLKK8W0et8MnKUk4e-nPU',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJ1emxhemh0Y25kcGVnc25pamN3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzQ2OTI2OTksImV4cCI6MjA1MDI2ODY5OX0.myFxYtm5Q3WF1WlV0AJzPoRLKK8W0et8MnKUk4e-nPU',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class MembrosGetCall {
  static Future<ApiCallResponse> call({
    int? membroId = 18,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'MembrosGet',
      apiUrl:
          'https://buzlazhtcndpegsnijcw.supabase.co/rest/v1/membros_view?select=*',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJ1emxhemh0Y25kcGVnc25pamN3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzQ2OTI2OTksImV4cCI6MjA1MDI2ODY5OX0.myFxYtm5Q3WF1WlV0AJzPoRLKK8W0et8MnKUk4e-nPU',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJ1emxhemh0Y25kcGVnc25pamN3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzQ2OTI2OTksImV4cCI6MjA1MDI2ODY5OX0.myFxYtm5Q3WF1WlV0AJzPoRLKK8W0et8MnKUk4e-nPU',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class MembrosGetUniqueCall {
  static Future<ApiCallResponse> call({
    int? id = 108,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'MembrosGetUnique',
      apiUrl:
          'https://buzlazhtcndpegsnijcw.supabase.co/rest/v1/membros_view?membro_id=eq.${id}&select=*',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJ1emxhemh0Y25kcGVnc25pamN3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzQ2OTI2OTksImV4cCI6MjA1MDI2ODY5OX0.myFxYtm5Q3WF1WlV0AJzPoRLKK8W0et8MnKUk4e-nPU',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJ1emxhemh0Y25kcGVnc25pamN3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzQ2OTI2OTksImV4cCI6MjA1MDI2ODY5OX0.myFxYtm5Q3WF1WlV0AJzPoRLKK8W0et8MnKUk4e-nPU',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class MembrosGetUniqueCopyCall {
  static Future<ApiCallResponse> call({
    int? id = 108,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'MembrosGetUnique Copy',
      apiUrl:
          'https://buzlazhtcndpegsnijcw.supabase.co/rest/v1/membros_view?membro_id=eq.${id}&select=*',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJ1emxhemh0Y25kcGVnc25pamN3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzQ2OTI2OTksImV4cCI6MjA1MDI2ODY5OX0.myFxYtm5Q3WF1WlV0AJzPoRLKK8W0et8MnKUk4e-nPU',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJ1emxhemh0Y25kcGVnc25pamN3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzQ2OTI2OTksImV4cCI6MjA1MDI2ODY5OX0.myFxYtm5Q3WF1WlV0AJzPoRLKK8W0et8MnKUk4e-nPU',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ProcessosGetCall {
  static Future<ApiCallResponse> call({
    int? membroId,
  }) async {
    final ffApiRequestBody = '''
{
  "p_membro_id": "${membroId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ProcessosGet',
      apiUrl:
          'https://buzlazhtcndpegsnijcw.supabase.co/rest/v1/rpc/processos_search',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJ1emxhemh0Y25kcGVnc25pamN3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzQ2OTI2OTksImV4cCI6MjA1MDI2ODY5OX0.myFxYtm5Q3WF1WlV0AJzPoRLKK8W0et8MnKUk4e-nPU',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJ1emxhemh0Y25kcGVnc25pamN3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzQ2OTI2OTksImV4cCI6MjA1MDI2ODY5OX0.myFxYtm5Q3WF1WlV0AJzPoRLKK8W0et8MnKUk4e-nPU',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? processoId(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].processo_id''',
      ));
  static int? membroId(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].membro_id''',
      ));
  static String? acaoPenalNo(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$[:].acao_penal_no''',
      ));
  static String? vara(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].vara''',
      ));
  static String? situacaoJuridica(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$[:].situacao_juridica''',
      ));
  static String? regime(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].regime''',
      ));
  static String? situacaoReu(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$[:].situacao_reu''',
      ));
}

class ProcessosBuscaNoCall {
  static Future<ApiCallResponse> call({
    String? acaoPenalNo = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'ProcessosBuscaNo',
      apiUrl:
          'https://buzlazhtcndpegsnijcw.supabase.co/rest/v1/processos?acao_penal_no=eq.${acaoPenalNo}&select=*',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJ1emxhemh0Y25kcGVnc25pamN3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzQ2OTI2OTksImV4cCI6MjA1MDI2ODY5OX0.myFxYtm5Q3WF1WlV0AJzPoRLKK8W0et8MnKUk4e-nPU',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJ1emxhemh0Y25kcGVnc25pamN3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzQ2OTI2OTksImV4cCI6MjA1MDI2ODY5OX0.myFxYtm5Q3WF1WlV0AJzPoRLKK8W0et8MnKUk4e-nPU',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? acaoPenalNo(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$[:].acao_penal_no''',
      ));
}

class CountUsuariosViewCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'CountUsuariosView',
      apiUrl:
          'https://buzlazhtcndpegsnijcw.supabase.co/rest/v1/count_usuarios_view?select=*',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJ1emxhemh0Y25kcGVnc25pamN3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzQ2OTI2OTksImV4cCI6MjA1MDI2ODY5OX0.myFxYtm5Q3WF1WlV0AJzPoRLKK8W0et8MnKUk4e-nPU',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? total(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].total''',
      ));
}

class CountUsuariosAtivosViewCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'CountUsuariosAtivosView ',
      apiUrl:
          'https://buzlazhtcndpegsnijcw.supabase.co/rest/v1/count_usuarios_ativos_view?select=*',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJ1emxhemh0Y25kcGVnc25pamN3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzQ2OTI2OTksImV4cCI6MjA1MDI2ODY5OX0.myFxYtm5Q3WF1WlV0AJzPoRLKK8W0et8MnKUk4e-nPU',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? total(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].total''',
      ));
}

class CountMembrosViewCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'CountMembrosView',
      apiUrl:
          'https://buzlazhtcndpegsnijcw.supabase.co/rest/v1/count_membros_view?select=*',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJ1emxhemh0Y25kcGVnc25pamN3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzQ2OTI2OTksImV4cCI6MjA1MDI2ODY5OX0.myFxYtm5Q3WF1WlV0AJzPoRLKK8W0et8MnKUk4e-nPU',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? total(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].total''',
      ));
}

class CountFaccoesViewCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'CountFaccoesView ',
      apiUrl:
          'https://buzlazhtcndpegsnijcw.supabase.co/rest/v1/count_faccoes_view?select=*',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJ1emxhemh0Y25kcGVnc25pamN3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzQ2OTI2OTksImV4cCI6MjA1MDI2ODY5OX0.myFxYtm5Q3WF1WlV0AJzPoRLKK8W0et8MnKUk4e-nPU',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? total(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].total''',
      ));
}

class ApiViaCEPCall {
  static Future<ApiCallResponse> call({
    String? cep = '57023890',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'apiViaCEP',
      apiUrl: 'viacep.com.br/ws/${cep}/json/',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Access-Control-Max-Age': 'max-age=3600',
        'Access-Control-Allow-Credentials': 'true',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? logradouro(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.logradouro''',
      ));
  static String? complemento(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.complemento''',
      ));
  static String? bairro(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.bairro''',
      ));
  static String? localidade(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.localidade''',
      ));
  static String? uf(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.uf''',
      ));
  static String? estado(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.estado''',
      ));
  static String? regiao(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.regiao''',
      ));
  static String? ibge(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.ibge''',
      ));
  static String? ddd(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.ddd''',
      ));
  static String? siafi(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.siafi''',
      ));
  static String? cep(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.cep''',
      ));
}

class SeachMembrosAvancadoCall {
  static Future<ApiCallResponse> call({
    String? pNomeCompleto,
    String? pFiliacaoMae,
    String? pFaccaoNome,
    String? pFuncaoNome,
    String? pEstadoNome,
    String? pMunicipioNome,
    List<String>? pAlcunhaList,
    List<String>? pTresUltimoLocaisPresoList,
  }) async {
    pNomeCompleto ??= null!;
    pFiliacaoMae ??= null!;
    pFaccaoNome ??= null!;
    pFuncaoNome ??= null!;
    pEstadoNome ??= null!;
    pMunicipioNome ??= null!;

    final pAlcunha = _serializeList(pAlcunhaList);
    final pTresUltimoLocaisPreso = _serializeList(pTresUltimoLocaisPresoList);

    final ffApiRequestBody = '''
{
  "p_nome_completo": "${escapeStringForJson(pNomeCompleto)}",
  "p_filiacao_mae": "${escapeStringForJson(pFiliacaoMae)}",
  "p_funcao_nome": "${escapeStringForJson(pFuncaoNome)}",
  "p_faccao_nome": "${escapeStringForJson(pFaccaoNome)}",
  "p_estado_nome": "${escapeStringForJson(pEstadoNome)}",
  "p_municipio_nome": "${escapeStringForJson(pMunicipioNome)}",
  "p_alcunha": ${pAlcunha},
  "p_tres_ultimo_locais_preso": ${pTresUltimoLocaisPreso}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'seachMembrosAvancado',
      apiUrl:
          'https://buzlazhtcndpegsnijcw.supabase.co/rest/v1/rpc/membros_search_avancado',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJ1emxhemh0Y25kcGVnc25pamN3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzQ2OTI2OTksImV4cCI6MjA1MDI2ODY5OX0.myFxYtm5Q3WF1WlV0AJzPoRLKK8W0et8MnKUk4e-nPU',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJ1emxhemh0Y25kcGVnc25pamN3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzQ2OTI2OTksImV4cCI6MjA1MDI2ODY5OX0.myFxYtm5Q3WF1WlV0AJzPoRLKK8W0et8MnKUk4e-nPU',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? id(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].membro_id''',
      ));
  static String? nome(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].nome_completo''',
      ));
  static String? faccao(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].faccao_nome''',
      ));
  static String? estado(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].estado_nome''',
      ));
  static String? municipio(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].municipio_nome''',
      ));
  static String? funcao(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].funcao_nome''',
      ));
  static List<String>? fotos(dynamic response) => (getJsonField(
        response,
        r'''$[:].fotos_path''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class SeachMembrosCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'seachMembros',
      apiUrl:
          'https://buzlazhtcndpegsnijcw.supabase.co/rest/v1/rpc/concatenar_colunas_membros',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJ1emxhemh0Y25kcGVnc25pamN3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzQ2OTI2OTksImV4cCI6MjA1MDI2ODY5OX0.myFxYtm5Q3WF1WlV0AJzPoRLKK8W0et8MnKUk4e-nPU',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJ1emxhemh0Y25kcGVnc25pamN3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzQ2OTI2OTksImV4cCI6MjA1MDI2ODY5OX0.myFxYtm5Q3WF1WlV0AJzPoRLKK8W0et8MnKUk4e-nPU',
        'Content-Type': 'application/json',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<int>? id(dynamic response) => (getJsonField(
        response,
        r'''$[:].membro_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? todos(dynamic response) => (getJsonField(
        response,
        r'''$[:].coluna_concatenada''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class MembrosGerarPdfCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'membrosGerarPdf',
      apiUrl: 'https://r0cpc3.buildship.run/membros_gerar_pdf',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
