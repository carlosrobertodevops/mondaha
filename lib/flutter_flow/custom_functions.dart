import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:ff_commons/flutter_flow/lat_lng.dart';
import 'package:ff_commons/flutter_flow/place.dart';
import 'package:ff_commons/flutter_flow/uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/auth/supabase_auth/auth_util.dart';
import "package:community_testing_ryusdv/backend/schema/structs/index.dart"
    as community_testing_ryusdv_data_schema;
import "package:community_testing_ryusdv/backend/schema/enums/enums.dart"
    as community_testing_ryusdv_enums;

List<dynamic> convertStringtJsonToLatLng(
  String jsonString,
  List<String> camposCoordenadas,
) {
  List<dynamic> jsonList = jsonDecode(jsonString);

  for (var jsonMap in jsonList) {
    if (jsonMap is Map<String, dynamic>) {
      for (var campo in camposCoordenadas) {
        if (jsonMap.containsKey(campo) && jsonMap[campo] is String) {
          String coordenadaString = jsonMap[campo];
          final match = RegExp(r'LatLng\(lat: (.*), Ing: (.*)\)')
              .firstMatch(coordenadaString);
          if (match != null) {
            double lat = double.parse(match.group(1)!);
            double lng = double.parse(match.group(2)!);
            jsonMap[campo] = LatLng(lat, lng);
          }
        }
      }
    }
  }

  return List<Map<String, dynamic>>.from(jsonList);
}

String convertLatlngToString(LatLng location) {
  return '${location.latitude.toStringAsFixed(6)}, ${location.longitude.toStringAsFixed(6)}';
}

LatLng convertStringToLatLng(String coordinates) {
  try {
    final parts = coordinates.split(',');
    final latitude = double.parse(parts[0].trim());
    final longitude = double.parse(parts[1].trim());
    return LatLng(latitude, longitude);
  } catch (e) {
    throw FormatException('A string fornecida não está no formato correto.');
  }
}

List<String> convertLatLngListToStringList(List<LatLng> locations) {
  return locations
      .map((location) =>
          '${location.latitude.toStringAsFixed(6)}, ${location.longitude.toStringAsFixed(6)}')
      .toList();
}

List<String> getCountryFlag() {
  final countries = [
    "Afghanistan",
    "Aland Islands",
    "Albania",
    "Algeria",
    "AmericanSamoa",
    "Andorra",
    "Angola",
    "Anguilla",
    "Antarctica",
    "Antigua and Barbuda",
    "Argentina",
    "Armenia",
    "Aruba",
    "Australia",
    "Austria",
    "Azerbaijan",
    "Bahamas",
    "Bahrain",
    "Bangladesh",
    "Barbados",
    "Belarus",
    "Belgium",
    "Belize",
    "Benin",
    "Bermuda",
    "Bhutan",
    "Bolivia",
    "Bosnia and Herzegovina",
    "Botswana",
    "Brazil",
    "British Indian Ocean Territory",
    "Brunei Darussalam",
    "Bulgaria",
    "Burkina Faso",
    "Burundi",
    "Cambodia",
    "Cameroon",
    "Canada",
    "Cape Verde",
    "Cayman Islands",
    "Central African Republic",
    "Chad",
    "Chile",
    "China",
    "Christmas Island",
    "Cocos (Keeling) Islands",
    "Colombia",
    "Comoros",
    "Congo",
    "Congo, The Democratic Republic of the Congo",
    "Cook Islands",
    "Costa Rica",
    "Cote d'Ivoire",
    "Croatia",
    "Cuba",
    "Cyprus",
    "Czech Republic",
    "Denmark",
    "Djibouti",
    "Dominica",
    "Dominican Republic",
    "Ecuador",
    "Egypt",
    "El Salvador",
    "Equatorial Guinea",
    "Eritrea",
    "Estonia",
    "Ethiopia",
    "Falkland Islands (Malvinas",
    "Faroe Islands",
    "Fiji",
    "Finland",
    "France",
    "French Guiana",
    "French Polynesia",
    "Gabon",
    "Gambia",
    "Georgia",
    "Germany",
    "Ghana",
    "Gibraltar",
    "Greece",
    "Greenland",
    "Grenada",
    "Guadeloupe",
    "Guam",
    "Guatemala",
    "Guernsey",
    "Guinea",
    "Guinea-Bissau",
    "Guyana",
    "Haiti",
    "Holy See (Vatican City State",
    "Honduras",
    "Hong Kong",
    "Hungary",
    "Iceland",
    "India",
    "Indonesia",
    "Iran, Islamic Republic of Persian Gulf",
    "Iraq",
    "Ireland",
    "Isle of Man",
    "Israel",
    "Italy",
    "Jamaica",
    "Japan",
    "Jersey",
    "Jordan",
    "Kazakhstan",
    "Kenya",
    "Kiribati",
    "Korea, Democratic People's Republic of Korea",
    "Korea, Republic of South Korea",
    "Kuwait",
    "Kyrgyzstan",
    "Laos",
    "Latvia",
    "Lebanon",
    "Lesotho",
    "Liberia",
    "Libyan Arab Jamahiriya",
    "Liechtenstein",
    "Lithuania",
    "Luxembourg",
    "Macao",
    "Macedonia",
    "Madagascar",
    "Malawi",
    "Malaysia",
    "Maldives",
    "Mali",
    "Malta",
    "Marshall Islands",
    "Martinique",
    "Mauritania",
    "Mauritius",
    "Mayotte",
    "Mexico",
    "Micronesia, Federated States of Micronesia",
    "Moldova",
    "Monaco",
    "Mongolia",
    "Montenegro",
    "Montserrat",
    "Morocco",
    "Mozambique",
    "Myanmar",
    "Namibia",
    "Nauru",
    "Nepal",
    "Netherlands",
    "Netherlands Antilles",
    "New Caledonia",
    "New Zealand",
    "Nicaragua",
    "Niger",
    "Nigeria",
    "Niue",
    "Norfolk Island",
    "Northern Mariana Islands",
    "Norway",
    "Oman",
    "Pakistan",
    "Palau",
    "Palestinian Territory, Occupied",
    "Panama",
    "Papua New Guinea",
    "Paraguay",
    "Peru",
    "Philippines",
    "Pitcairn",
    "Poland",
    "Portugal",
    "Puerto Rico",
    "Qatar",
    "Romania",
    "Russia",
    "Rwanda",
    "Reunion",
    "Saint Barthelemy",
    "Saint Helena, Ascension and Tristan Da Cunha",
    "Saint Kitts and Nevis",
    "Saint Lucia",
    "Saint Martin",
    "Saint Pierre and Miquelon",
    "Saint Vincent and the Grenadines",
    "Samoa",
    "San Marino",
    "Sao Tome and Principe",
    "Saudi Arabia",
    "Senegal",
    "Serbia",
    "Seychelles",
    "Sierra Leone",
    "Singapore",
    "Slovakia",
    "Slovenia",
    "Solomon Islands",
    "Somalia",
    "South Africa",
    "South Sudan",
    "South Georgia and the South Sandwich Islands",
    "Spain",
    "Sri Lanka",
    "Sudan",
    "Suriname",
    "Svalbard and Jan Mayen",
    "Swaziland",
    "Sweden",
    "Switzerland",
    "Syrian Arab Republic",
    "Taiwan",
    "Tajikistan",
    "Tanzania, United Republic of Tanzania",
    "Thailand",
    "Timor-Leste",
    "Togo",
    "Tokelau",
    "Tonga",
    "Trinidad and Tobago",
    "Tunisia",
    "Turkey",
    "Turkmenistan",
    "Turks and Caicos Islands",
    "Tuvalu",
    "Uganda",
    "Ukraine",
    "United Arab Emirates",
    "United Kingdom",
    "United States",
    "Uruguay",
    "Uzbekistan",
    "Vanuatu",
    "Venezuela, Bolivarian Republic of Venezuela",
    "Vietnam",
    "Virgin Islands, British",
    "Virgin Islands, U.S",
    "Wallis and Futuna",
    "Yemen",
    "Zambia",
    "Zimbabwe",
  ];

  return countries;
}

DateTime getFirstOfMonth() {
  // returns the first of the month
  return DateTime(DateTime.now().year, DateTime.now().month, 1);
}

double? funcGetPercentualValidado(int? numValidados) {
  if (numValidados != null) {
    return (numValidados * 0.1);
  } else {
    return 0.0;
  }
}

List<LatLng> convertStringsListToLngLatList(List<String> stringList) {
  // Se a lista estiver vazia ou for nula, retorne uma lista vazia.
  if (stringList == null || stringList.isEmpty) {
    return [];
  }

  // Inicializa uma lista para armazenar os objetos LatLng.
  List<LatLng> latLngList = [];

  for (String str in stringList) {
    try {
      // Divide a string para extrair latitude e longitude.
      final parts = str.split(',');
      if (parts.length != 2) {
        throw Exception('String mal formatada: $str');
      }

      // Converte as partes em double.
      final double lat = double.parse(parts[0].trim());
      final double lng = double.parse(parts[1].trim());

      // Adiciona o objeto LatLng à lista.
      latLngList.add(LatLng(lat, lng));
    } catch (e) {
      // Log ou ignore strings inválidas, se necessário.
      print('Erro ao processar a string: $str. Detalhes: $e');
    }
  }

  // Retorna a lista de LatLng.
  return latLngList;
}

List<LatLng> convertDoubleToLatLng(List<double> doubles) {
  List<LatLng> latLngList = [];
  for (int i = 0; i < doubles.length; i += 2) {
    if (i + 1 < doubles.length) {
      latLngList.add(LatLng(doubles[i], doubles[i + 1]));
    }
  }
  return latLngList;
}

List<double> convertLatLngToDouble(List<LatLng> latLngList) {
  List<double> doubleList = [];
  for (var latLng in latLngList) {
    doubleList.add(latLng.latitude);
    doubleList.add(latLng.longitude);
  }
  return doubleList;
}

LatLng extractCoordenadasListToLatLng(List<String> coordinatesList) {
  // Verifique se a lista está vazia
  if (coordinatesList.isEmpty) {
    return LatLng(0, 0); // Retorna null se a lista estiver vazia
  }

  // Pegue a última string da lista
  String lastLine = coordinatesList.last;

  // Divida a string para separar latitude e longitude
  List<String> parts = lastLine.split(',');

  if (parts.length != 2) {
    throw Exception(
        'Formato inválido. A string deve estar no formato "latitude, longitude".');
  }

  // Converta as partes para double
  double latitude = double.parse(parts[0].trim());
  double longitude = double.parse(parts[1].trim());

  // Retorne o objeto LatLng
  return LatLng(latitude, longitude);
}

dynamic searchMembros(String? search) {
  // final supabase = SupabaseClient('https://buzlazhtcndpegsnijcw.supabase.co',
  //     'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJ1emxhemh0Y25kcGVnc25pamN3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzQ2OTI2OTksImV4cCI6MjA1MDI2ODY5OX0.myFxYtm5Q3WF1WlV0AJzPoRLKK8W0et8MnKUk4e-nPU');

  // Define the async function to search for members
  Future<dynamic> searchMembers() async {
    // await Supabase.initialize(
    //   url: 'https://buzlazhtcndpegsnijcw.supabase.co',
    //   anonKey:
    //       'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJ1emxhemh0Y25kcGVnc25pamN3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzQ2OTI2OTksImV4cCI6MjA1MDI2ODY5OX0.myFxYtm5Q3WF1WlV0AJzPoRLKK8W0et8MnKUk4e-nPU',
    // );

    final supabase = Supabase.instance.client;

    // Perform the search using Supabase client
    try {
      final response = await supabase
          .from('members')
          .select("*")
          .or('name_cliente.ilike.%$search%')
          .or('nome_faccao.ilike.%$search%');

      final data = response;

      return response;
    } catch (error) {
      print("Erro ao buscar usuários: $error");
      return [];
    }
  }

  searchMembers();
}

String pesquisaLikeCS(String pesquisa) {
  String pesquisar = pesquisa;

  return "%$pesquisar%";
}

bool checkProcedimento(String procedimentoNo) {
  if (procedimentoNo.isEmpty) {
    return false;
  }

  final response = SupaFlow.client
      .from('procedimentos')
      .select('procedimento_id')
      .eq('procedimento_no', procedimentoNo)
      .maybeSingle();

  return response != Null;
}

bool checkProcesso(String acaoPenalNo) {
  if (acaoPenalNo.isEmpty) {
    return false;
  }

  final response = SupaFlow.client
      .from('processos')
      .select('processo_id')
      .eq('acao_penal_no', acaoPenalNo)
      .maybeSingle();

  return response != Null;
}
