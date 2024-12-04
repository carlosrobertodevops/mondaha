import '../database.dart';

class MembrosTable extends SupabaseTable<MembrosRow> {
  @override
  String get tableName => 'membros';

  @override
  MembrosRow createRow(Map<String, dynamic> data) => MembrosRow(data);
}

class MembrosRow extends SupabaseDataRow {
  MembrosRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => MembrosTable();

  int get membroId => getField<int>('membro_id')!;
  set membroId(int value) => setField<int>('membro_id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get nomeCompleto => getField<String>('nome_completo');
  set nomeCompleto(String? value) => setField<String>('nome_completo', value);

  List<String> get alcunha => getListField<String>('alcunha');
  set alcunha(List<String>? value) => setListField<String>('alcunha', value);

  int? get faccaoId => getField<int>('faccao_id');
  set faccaoId(int? value) => setField<int>('faccao_id', value);

  List<String> get fotosPath => getListField<String>('fotos_path');
  set fotosPath(List<String>? value) =>
      setListField<String>('fotos_path', value);

  int? get funcaoId => getField<int>('funcao_id');
  set funcaoId(int? value) => setField<int>('funcao_id', value);

  String? get nacionalidade => getField<String>('nacionalidade');
  set nacionalidade(String? value) => setField<String>('nacionalidade', value);

  String? get naturalidade => getField<String>('naturalidade');
  set naturalidade(String? value) => setField<String>('naturalidade', value);

  String? get cpf => getField<String>('cpf');
  set cpf(String? value) => setField<String>('cpf', value);

  String? get identidade => getField<String>('identidade');
  set identidade(String? value) => setField<String>('identidade', value);

  String? get nivelInstrucao => getField<String>('nivel_instrucao');
  set nivelInstrucao(String? value) =>
      setField<String>('nivel_instrucao', value);

  String? get filiacaoMae => getField<String>('filiacao_mae');
  set filiacaoMae(String? value) => setField<String>('filiacao_mae', value);

  String? get filiacaoPai => getField<String>('filiacao_pai');
  set filiacaoPai(String? value) => setField<String>('filiacao_pai', value);

  String? get situacaoMae => getField<String>('situacao_mae');
  set situacaoMae(String? value) => setField<String>('situacao_mae', value);

  String? get situacaoPai => getField<String>('situacao_pai');
  set situacaoPai(String? value) => setField<String>('situacao_pai', value);

  String? get historico => getField<String>('historico');
  set historico(String? value) => setField<String>('historico', value);

  int? get cargoId => getField<int>('cargo_id');
  set cargoId(int? value) => setField<int>('cargo_id', value);

  int? get cargoAntId => getField<int>('cargo_ant_id');
  set cargoAntId(int? value) => setField<int>('cargo_ant_id', value);

  int? get funcaoAntId => getField<int>('funcao_ant_id');
  set funcaoAntId(int? value) => setField<int>('funcao_ant_id', value);

  String? get batismo => getField<String>('batismo');
  set batismo(String? value) => setField<String>('batismo', value);

  String? get padrinho => getField<String>('padrinho');
  set padrinho(String? value) => setField<String>('padrinho', value);

  int? get faccaoIntegrou => getField<int>('faccao_integrou');
  set faccaoIntegrou(int? value) => setField<int>('faccao_integrou', value);

  int? get faccaoAliada => getField<int>('faccao_aliada');
  set faccaoAliada(int? value) => setField<int>('faccao_aliada', value);

  int? get faccaoInimiga => getField<int>('faccao_inimiga');
  set faccaoInimiga(int? value) => setField<int>('faccao_inimiga', value);

  String? get faccaoSenha => getField<String>('faccao_senha');
  set faccaoSenha(String? value) => setField<String>('faccao_senha', value);

  List<String> get membroEndereco => getListField<String>('membro_endereco');
  set membroEndereco(List<String>? value) =>
      setListField<String>('membro_endereco', value);

  int? get estadoId => getField<int>('estado_id');
  set estadoId(int? value) => setField<int>('estado_id', value);

  int? get municipioId => getField<int>('municipio_id');
  set municipioId(int? value) => setField<int>('municipio_id', value);

  String? get infopen => getField<String>('infopen');
  set infopen(String? value) => setField<String>('infopen', value);

  String? get estadoCivil => getField<String>('estado_civil');
  set estadoCivil(String? value) => setField<String>('estado_civil', value);

  String? get batismoLocal => getField<String>('batismo_local');
  set batismoLocal(String? value) => setField<String>('batismo_local', value);

  List<String> get tresUltimoLocaisPreso =>
      getListField<String>('tres_ultimo_locais_preso');
  set tresUltimoLocaisPreso(List<String>? value) =>
      setListField<String>('tres_ultimo_locais_preso', value);

  bool? get alerta => getField<bool>('alerta');
  set alerta(bool? value) => setField<bool>('alerta', value);

  String? get atuacaoCrime => getField<String>('atuacao_crime');
  set atuacaoCrime(String? value) => setField<String>('atuacao_crime', value);

  double? get validacaoPrecentual => getField<double>('validacao_precentual');
  set validacaoPrecentual(double? value) =>
      setField<double>('validacao_precentual', value);

  List<String> get validacoes => getListField<String>('validacoes');
  set validacoes(List<String>? value) =>
      setListField<String>('validacoes', value);

  List<String> get coordenadas => getListField<String>('coordenadas');
  set coordenadas(List<String>? value) =>
      setListField<String>('coordenadas', value);

  String? get validacaoObservacao => getField<String>('validacao_observacao');
  set validacaoObservacao(String? value) =>
      setField<String>('validacao_observacao', value);

  int? get identidadeOrgao => getField<int>('identidade_orgao');
  set identidadeOrgao(int? value) => setField<int>('identidade_orgao', value);

  List<double> get membroLngLat => getListField<double>('membroLngLat');
  set membroLngLat(List<double>? value) =>
      setListField<double>('membroLngLat', value);

  String? get alertaObservacao => getField<String>('alerta_observacao');
  set alertaObservacao(String? value) =>
      setField<String>('alerta_observacao', value);
}
