import 'dart:convert';
import 'dart:typed_data';
import '../schema/structs/index.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class DeletarUserAuthNoSUPABASECall {
  static Future<ApiCallResponse> call({
    String? email = '',
    String? uid = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Deletar User Auth no SUPABASE',
      apiUrl: 'https://buzlazhtcndpegsnijcw.supabase.co',
      callType: ApiCallType.DELETE,
      headers: {
        'Content-Type': 'application/json',
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

class BuscarEmAuthUsersNoSUPABASECall {
  static Future<ApiCallResponse> call({
    String? email = '',
    String? password = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Buscar em Auth Users no SUPABASE ',
      apiUrl: 'https://https://buzlazhtcndpegsnijcw.supabase.co/auth/v1/user',
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
      apiUrl:
          'https://https://buzlazhtcndpegsnijcw.supabase.co/rest/v1/usuarios',
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
  "membro_id": "${membroId}",
  "procedimento_no": "${procedimentoNo}",
  "unidade": "${unidade}",
  "procedimento_tipo": "${procedimentoTipo}",
  "crime": "${crime}",
  "data": "${data}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ProcedimentosAdd',
      apiUrl:
          'https://https://buzlazhtcndpegsnijcw.supabase.co/rest/v1/procedimentos',
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
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'ProcedimentosGet',
      apiUrl:
          'https://buzlazhtcndpegsnijcw.supabase.co/rest/v1/procedimentos?select=*',
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
  "membro_id": "${membroId}",
  "acao_penal_no": "${acaoPenalNo}",
  "vara": "${vara}",
  "situaco_juridica": "${situacaoJuridica}",
  "regime": "${regime}",
  "situacao_reu": "${situacaoReu}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ProcessosAdd',
      apiUrl: 'https://buzlazhtcndpegsnijcw.supabase.co/rest/v1/processos',
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
  static Future<ApiCallResponse> call() async {
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

class ProcessosGetCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'ProcessosGet',
      apiUrl:
          'https://buzlazhtcndpegsnijcw.supabase.co/rest/v1/processos?select=*',
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

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
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
