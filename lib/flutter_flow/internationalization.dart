import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'pt'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? ptText = '',
  }) =>
      [enText, ptText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // auth_forgot_password
  {
    '3hcuc8v6': {
      'en': 'Forgot Password',
      'pt': 'Esqueceu sua senha',
    },
    'sjjd1jb9': {
      'en':
          'Don\'t remember your password? Enter the email associated with your account below and we will send you a new link.',
      'pt':
          'Não lembra da sua senha? Insira o e-mail associado à sua conta abaixo e nós lhe enviaremos um novo link.',
    },
    'tzm5opaa': {
      'en': 'Email Address',
      'pt': 'Endereço de email',
    },
    'uvsotzng': {
      'en': 'Please enter a valid email...',
      'pt': 'Insira um e-mail válido...',
    },
    '3sdzjivm': {
      'en': 'Send Reset Link',
      'pt': 'Enviar link de redefinição',
    },
    '8p6xd6cl': {
      'en': 'Home',
      'pt': 'Lar',
    },
  },
  // main_home
  {
    '3bi54x5g': {
      'en': 'Dashboard',
      'pt': 'Painel',
    },
    'nnv46x35': {
      'en': 'Below is a summary of your App activity.',
      'pt': 'Abaixo está um resumo das atividades no App.',
    },
    'jqevo63s': {
      'en': 'New Members',
      'pt': 'Novos Membros',
    },
    '8vot9bzj': {
      'en': 'New Factions',
      'pt': 'Novas Facções',
    },
    'saxskj92': {
      'en': 'Add in the Map',
      'pt': 'Adicionados no mapa',
    },
    'n9k8nozn': {
      'en': 'Active users',
      'pt': 'Usuários ativos',
    },
    'kphqz3hi': {
      'en': 'Projects',
      'pt': 'Projetos',
    },
    'xlzf8qqx': {
      'en': 'Users in  adding registers',
      'pt': 'Atualizações de registros por usuários',
    },
    'm5s42ngb': {
      'en': 'Members',
      'pt': 'Membros',
    },
    'puy8obok': {
      'en': 'Activity de Factions',
      'pt': 'Atividade de Facções',
    },
    'zlovh0zt': {
      'en': 'Below is an a summary of activity.',
      'pt': 'Abaixo está um resumo da atividade.',
    },
    'g1uaaovn': {
      'en': 'Update Activity in the all',
      'pt': 'Atividade de atualização em todos os dados',
    },
    'e5q3ows1': {
      'en': 'Below is an a summary of activity.',
      'pt': 'Abaixo está um resumo da atividade.',
    },
    'uj7jsxmo': {
      'en': 'Contract Activity',
      'pt': 'Atividade de contrato',
    },
    'hkk2zmjw': {
      'en': 'Below is an a summary of activity.',
      'pt': 'Abaixo está um resumo da atividade.',
    },
    'jkgae0vc': {
      'en': 'Customer Activity',
      'pt': 'Atividade do cliente',
    },
    'g4os7kcp': {
      'en': 'Below is an a summary of activity.',
      'pt': 'Abaixo está um resumo da atividade.',
    },
    'y24lcr13': {
      'en': 'Dashboard',
      'pt': 'Painel',
    },
    'xdxbdj20': {
      'en': '__',
      'pt': '__',
    },
  },
  // main_membros
  {
    'n99lg1qh': {
      'en': 'Members',
      'pt': 'Membros',
    },
    'qf1tn1nr': {
      'en': 'Add Member',
      'pt': 'Adicionar membro',
    },
    'lvnskphp': {
      'en': 'All',
      'pt': 'Todos',
    },
    'haes0r2l': {
      'en': 'Full Name',
      'pt': 'Nome completo',
    },
    '5rmzx51f': {
      'en': 'Funcioton',
      'pt': 'Função',
    },
    'z0huz1sz': {
      'en': 'Faction',
      'pt': 'Facção',
    },
    '04vrv62j': {
      'en': 'Alcunha',
      'pt': 'Alcunha',
    },
    '4zc3d2m8': {
      'en': 'CPF',
      'pt': 'CPF',
    },
    '3g7tqfgx': {
      'en': 'For Faction',
      'pt': 'Para Facção',
    },
    '2gdeafbk': {
      'en': 'For Functions',
      'pt': 'Para funções',
    },
    'fcyoodds': {
      'en': 'Customers',
      'pt': 'Clientes',
    },
    '3ourv2w9': {
      'en': '__',
      'pt': '__',
    },
  },
  // main_faccao_old
  {
    '4h88trkp': {
      'en': 'Contracts',
      'pt': 'Contratos',
    },
    'smh1o93d': {
      'en': 'Factions',
      'pt': 'Facções',
    },
    '0qpozsrf': {
      'en': 'Add Faction',
      'pt': 'Adicionar Facção',
    },
    't967eizl': {
      'en': 'Factions',
      'pt': 'Facções',
    },
    'dlt46loo': {
      'en': 'Factions List',
      'pt': 'Lista de Facções',
    },
    '0xsigbyq': {
      'en': 'Faction Name',
      'pt': 'Nome da Facção',
    },
    'cltnbu58': {
      'en': 'Description',
      'pt': 'Descrição',
    },
    'ffcoxk91': {
      'en': 'Founders',
      'pt': 'Fundadores',
    },
    '06kkqenf': {
      'en': 'Create date',
      'pt': 'Data de criação',
    },
    '3gykazkx': {
      'en': 'Number of members',
      'pt': 'Número de membros',
    },
    'j08eiorc': {
      'en': '__',
      'pt': '__',
    },
  },
  // main_messages
  {
    '8jlklje5': {
      'en': 'Messages',
      'pt': 'Mensagens',
    },
    '13b6p0ri': {
      'en': 'Search messages here...',
      'pt': 'Pesquisar mensagens aqui...',
    },
    'm6h1ci8o': {
      'en': 'Randy Mcdonald',
      'pt': 'Randy McDonald - O que é isso?',
    },
    '375pqg6v': {
      'en':
          'This was really great, i\'m so glad that we could  catchup this weekend.',
      'pt':
          'Isso foi realmente ótimo, estou muito feliz que pudemos nos encontrar neste fim de semana.',
    },
    'cbtg39kg': {
      'en': 'Mon. July 3rd - 4:12pm',
      'pt': 'Seg. 3 de julho - 16h12',
    },
    'yjl2z0ye': {
      'en': 'Randy Mcdonald',
      'pt': 'Randy McDonald - O que é isso?',
    },
    'uyqeyj1w': {
      'en':
          'This was really great, i\'m so glad that we could  catchup this weekend.',
      'pt':
          'Isso foi realmente ótimo, estou muito feliz que pudemos nos encontrar neste fim de semana.',
    },
    'qdtk1psh': {
      'en': 'Mon. July 3rd - 4:12pm',
      'pt': 'Seg. 3 de julho - 16h12',
    },
    'udrcsj9r': {
      'en': 'Randy Mcdonald',
      'pt': 'Randy McDonald - O que é isso?',
    },
    'ugrrfw8l': {
      'en':
          'This was really great, i\'m so glad that we could  catchup this weekend.',
      'pt':
          'Isso foi realmente ótimo, estou muito feliz que pudemos nos encontrar neste fim de semana.',
    },
    'ib4p9em6': {
      'en': 'Mon. July 3rd - 4:12pm',
      'pt': 'Seg. 3 de julho - 16h12',
    },
    'r0cqh4ec': {
      'en':
          'I am a freelancer and I need help writing content for a proposal for a project. Can I give you some context for the projecct I need to write a proposal for?',
      'pt':
          'Sou freelancer e preciso de ajuda para escrever conteúdo para uma proposta de projeto. Posso dar algum contexto para o projeto para o qual preciso escrever uma proposta?',
    },
    'cu0iov54': {
      'en': 'Just Now',
      'pt': 'Agora mesmo',
    },
    'it69akbs': {
      'en': 'Hey really love what you are doing!',
      'pt': 'Olá, eu realmente adoro o que você faz!',
    },
    'pu94epux': {
      'en': 'a few moments ago',
      'pt': 'alguns momentos atrás',
    },
    'yny0f2zl': {
      'en': 'This is my intro video',
      'pt': 'Este é meu vídeo de introdução',
    },
    'q2bmh3xq': {
      'en': 'Just Now',
      'pt': 'Agora mesmo',
    },
    '4lc34hro': {
      'en': 'Hey really love what you are doing!',
      'pt': 'Olá, eu realmente adoro o que você faz!',
    },
    'rv9g1zmc': {
      'en': 'Just Now',
      'pt': 'Agora mesmo',
    },
    'bbpyr9q4': {
      'en': 'Hey really love what you are doing!',
      'pt': 'Olá, eu realmente adoro o que você faz!',
    },
    'jkyrunx9': {
      'en': 'Just Now',
      'pt': 'Agora mesmo',
    },
    'p20c60zu': {
      'en': 'Start typing here...',
      'pt': 'Comece a digitar aqui...',
    },
    'ym579y79': {
      'en': 'Dashboard',
      'pt': 'Painel',
    },
    'smtxdnbn': {
      'en': '__',
      'pt': '__',
    },
  },
  // main_profile
  {
    'qrxn5crt': {
      'en': 'My Profile',
      'pt': 'Meu Perfil',
    },
    'fyxsf6vn': {
      'en': 'Account Settings',
      'pt': 'Configurações de Conta',
    },
    'h43llaan': {
      'en': 'Change Password',
      'pt': 'Alterar a senha',
    },
    'b1lw0hfu': {
      'en': 'Edit Profile',
      'pt': 'Editar Perfil',
    },
    'clf3bzn3': {
      'en': 'Update Theme',
      'pt': 'Atualizar tema',
    },
    'dujofvd2': {
      'en':
          'Update the theme of your application from seleccting one of the options below.',
      'pt':
          'Atualize o tema do seu aplicativo selecionando uma das opções abaixo.',
    },
    'zohqypc2': {
      'en': 'Dark Mode',
      'pt': 'Modo escuro',
    },
    't3a5lo8r': {
      'en': 'Light Mode',
      'pt': 'Modo de luz',
    },
    'o3dp9tss': {
      'en': '__',
      'pt': '__',
    },
  },
  // project_details_health_ai
  {
    'mxf4vrjw': {
      'en': 'HealthAi',
      'pt': 'SaúdeAi',
    },
    'wsgonkz2': {
      'en': 'Client Acquisition for Q3',
      'pt': 'Aquisição de clientes para o terceiro trimestre',
    },
    'ynyuwhqo': {
      'en': 'Next Action',
      'pt': 'Próxima ação',
    },
    'zk7z07v0': {
      'en': 'Tuesday, 10:00am',
      'pt': 'Terça-feira, 10:00 da manhã',
    },
    'xmahzs1v': {
      'en': 'In Progress',
      'pt': 'Em andamento',
    },
    'ry6jvd0g': {
      'en': 'Contract Details',
      'pt': 'Detalhes do contrato',
    },
    'hu32scl5': {
      'en': '\$125,000',
      'pt': '\$ 125.000',
    },
    'sfu6o269': {
      'en':
          'Additional Details around this contract and who is working on it in this card!',
      'pt':
          'Detalhes adicionais sobre este contrato e quem está trabalhando nele neste card!',
    },
    '5sv9a4ka': {
      'en': 'Mark as Complete',
      'pt': 'Marcar como concluído',
    },
    'rrgcwkj1': {
      'en': 'Contract Details',
      'pt': 'Detalhes do contrato',
    },
    '8bwk4oui': {
      'en': '\$67,000',
      'pt': '\$ 67.000',
    },
    'p2hoxaq9': {
      'en':
          'Additional Details around this contract and who is working on it in this card!',
      'pt':
          'Detalhes adicionais sobre este contrato e quem está trabalhando nele neste card!',
    },
    'ww95wm3k': {
      'en': 'Mark as Complete',
      'pt': 'Marcar como concluído',
    },
    '54l7ivhw': {
      'en': 'Home',
      'pt': 'Lar',
    },
  },
  // project_details
  {
    'c0s3jdsy': {
      'en': 'Home',
      'pt': 'Lar',
    },
  },
  // search_page
  {
    'ao46xsuv': {
      'en': 'Add Members',
      'pt': 'Adicionar membros',
    },
    'g8rv8zhr': {
      'en': 'Search members...',
      'pt': 'Pesquisar membros...',
    },
    'm4ytuko9': {
      'en': '',
      'pt': '',
    },
    'op7ngmsb': {
      'en': 'Option 1',
      'pt': 'Opção 1',
    },
    '5x8u4g0u': {
      'en': 'All Members',
      'pt': 'Todos os membros',
    },
    'aw6pd4xm': {
      'en': 'user@domainname.com',
      'pt': 'usuário@nomedodomínio.com',
    },
    '4cek35uo': {
      'en': 'View',
      'pt': 'Visualizar',
    },
    'mvx2sb5k': {
      'en': 'Home',
      'pt': 'Lar',
    },
  },
  // messages_details
  {
    '67tv84ak': {
      'en':
          'I am a freelancer and I need help writing content for a proposal for a project. Can I give you some context for the projecct I need to write a proposal for?',
      'pt':
          'Sou freelancer e preciso de ajuda para escrever conteúdo para uma proposta de projeto. Posso dar algum contexto para o projeto para o qual preciso escrever uma proposta?',
    },
    'ldze800m': {
      'en': 'Just Now',
      'pt': 'Agora mesmo',
    },
    '3yldlfk9': {
      'en': 'Hey really love what you are doing!',
      'pt': 'Olá, eu realmente adoro o que você faz!',
    },
    'ozghv9ta': {
      'en': 'a few moments ago',
      'pt': 'alguns momentos atrás',
    },
    '4b943uzi': {
      'en': 'This is my intro video',
      'pt': 'Este é meu vídeo de introdução',
    },
    'j5burt0n': {
      'en': 'Just Now',
      'pt': 'Agora mesmo',
    },
    'nve1gr7c': {
      'en': 'Hey really love what you are doing!',
      'pt': 'Olá, eu realmente adoro o que você faz!',
    },
    'ttxn3h0c': {
      'en': 'Just Now',
      'pt': 'Agora mesmo',
    },
    'sj32bx47': {
      'en': 'Hey really love what you are doing!',
      'pt': 'Olá, eu realmente adoro o que você faz!',
    },
    'mwdx1wqh': {
      'en': 'Just Now',
      'pt': 'Agora mesmo',
    },
    'buzhmfr6': {
      'en': 'Start typing here...',
      'pt': 'Comece a digitar aqui...',
    },
    '34fjbl14': {
      'en': 'Chat Details',
      'pt': 'Detalhes do bate-papo',
    },
    'pjym5jdv': {
      'en': 'Home',
      'pt': 'Lar',
    },
  },
  // auth_login
  {
    'tzm2gn5e': {
      'en': 'Sign In',
      'pt': 'Entrar',
    },
    'ssmdesvy': {
      'en': 'Let\'s get started by filling out the form below.',
      'pt': 'Vamos começar preenchendo o formulário abaixo.',
    },
    'bqvjzpge': {
      'en': 'Email',
      'pt': 'E-mail',
    },
    'sltzyh98': {
      'en': 'Password',
      'pt': 'Senha',
    },
    'ufqw0h0a': {
      'en': 'Sign In',
      'pt': 'Entrar',
    },
    '8l7e2xqq': {
      'en': 'Forgot Password',
      'pt': 'Esqueceu sua senha',
    },
    'fi11huhh': {
      'en': 'Field is required',
      'pt': 'Campo é obrigatório!',
    },
    'pkzu3ybt': {
      'en': 'Please choose an option from the dropdown',
      'pt': 'Selecione uma opção no menu suspenso',
    },
    '7epcfb3x': {
      'en': 'Field is required',
      'pt': 'Campo é obrigatório!',
    },
    'sa8xye49': {
      'en': 'Please choose an option from the dropdown',
      'pt': 'Selecione uma opção no menu suspenso',
    },
    'eitkx3bc': {
      'en': 'Sign Up',
      'pt': 'Cadastra-se',
    },
    '7w1voiyg': {
      'en': 'Let\'s get started by filling out the form below.',
      'pt': 'Vamos começar preenchendo o formulário abaixo.',
    },
    'rxvn7x0x': {
      'en': 'User name',
      'pt': 'Nome de usuário',
    },
    'nyrv8tm0': {
      'en': 'Email',
      'pt': 'email',
    },
    'xi8bszk0': {
      'en': 'Password',
      'pt': 'Senha',
    },
    'ffom99vq': {
      'en': 'Confirm Password',
      'pt': 'Confirme sua senha',
    },
    '22cyhqvr': {
      'en': 'Create Account',
      'pt': 'Criar uma conta',
    },
    '5b01gu2v': {
      'en': 'Field is required',
      'pt': 'Campo é obrigatório',
    },
    'jhqn2e6f': {
      'en': 'Invalid username !',
      'pt': 'Nome de usuário inválido!',
    },
    'yug079gv': {
      'en': 'Please choose an option from the dropdown',
      'pt': 'Selecione uma opção no menu suspenso',
    },
    '9lz7n6fv': {
      'en': 'Field is required!',
      'pt': '',
    },
    'dw2vhjan': {
      'en': 'Invalid email!',
      'pt': 'email inválido!',
    },
    '2lyoeqrf': {
      'en': 'Please choose an option from the dropdown',
      'pt': '',
    },
    'fyc3auc8': {
      'en': 'Field is required',
      'pt': 'Campo é obrigatório!',
    },
    'jrjtliei': {
      'en': 'Please choose an option from the dropdown',
      'pt': 'Selecione uma opção no menu suspenso',
    },
    'obaog0sx': {
      'en': 'Field is required',
      'pt': 'Campo é obrigatório!',
    },
    '3ob34e6b': {
      'en': 'Please choose an option from the dropdown',
      'pt': 'Selecione uma opção no menu suspenso',
    },
    'rnyra7iu': {
      'en': 'Home',
      'pt': 'Home',
    },
  },
  // main_admin
  {
    'xdubtp8a': {
      'en': 'Customers',
      'pt': 'Clientes',
    },
    'qkmq9xej': {
      'en': 'Adminitration',
      'pt': 'Administração',
    },
    'r8vl0ce9': {
      'en': 'Add Profile',
      'pt': 'Adicionar perfil',
    },
    'i6puusi7': {
      'en': 'All',
      'pt': 'Todos',
    },
    '5ei4gaxd': {
      'en': 'Full Name',
      'pt': 'Nome completo',
    },
    'knvrskhd': {
      'en': 'Agency',
      'pt': 'Agência',
    },
    'q5s6eda3': {
      'en': 'Description',
      'pt': 'Descrição',
    },
    'rd2ba3as': {
      'en': 'email',
      'pt': 'e-mail',
    },
    '5cijyycp': {
      'en': 'User Type',
      'pt': 'Tipo de usuário',
    },
    'ppz66xjm': {
      'en': 'Agency',
      'pt': 'Agência',
    },
    'a2hd8qke': {
      'en': 'Full Name',
      'pt': 'Nome completo',
    },
    '9gvqhwb3': {
      'en': 'Agency',
      'pt': 'Agência',
    },
    'xhp03ue9': {
      'en': 'Description',
      'pt': 'Descrição',
    },
    '3tt06cel': {
      'en': 'email',
      'pt': 'e-mail',
    },
    'tvxnxzoj': {
      'en': 'User Type',
      'pt': 'Tipo de usuário',
    },
    'obxycff3': {
      'en': 'User type',
      'pt': 'Tipo de Usuário',
    },
    'epj34rnd': {
      'en': 'Full Name',
      'pt': 'Nome completo',
    },
    'v2jg4l8f': {
      'en': 'Agency',
      'pt': 'Agência',
    },
    'ntr0pfu6': {
      'en': 'Description',
      'pt': 'Descrição',
    },
    'isqor6dk': {
      'en': 'email',
      'pt': 'email',
    },
    'sfc75uj7': {
      'en': 'User Type',
      'pt': 'Tipo de usuário',
    },
    'cl0g3enm': {
      'en': '__',
      'pt': '__',
    },
  },
  // main_faccoes
  {
    'r8ltzsy4': {
      'en': 'Customers',
      'pt': 'Clientes',
    },
    '4j8vce4m': {
      'en': 'Factions',
      'pt': 'Facções',
    },
    'zt1zsn3q': {
      'en': 'Add Faction',
      'pt': 'Adicionar Facção',
    },
    'a5ixac3k': {
      'en': 'All',
      'pt': 'Todos',
    },
    '222dkjfs': {
      'en': 'Name',
      'pt': 'Nome',
    },
    'qyq0ek8t': {
      'en': 'Description',
      'pt': 'Descrição',
    },
    'mtyn0hp2': {
      'en': 'Faction Creation Date',
      'pt': 'Data de criação da facção',
    },
    'h9ronhq6': {
      'en': 'Last modified',
      'pt': 'Última modificação',
    },
    '8xlnl6av': {
      'en': '__',
      'pt': '__',
    },
  },
  // BuscarCEP
  {
    '3mirzv3t': {
      'en': 'Consultar CEP',
      'pt': 'Consultar CEP',
    },
    '1taqs12t': {
      'en': '',
      'pt': 'Endereço de email',
    },
    'k02pm4o5': {
      'en': 'CEP',
      'pt': 'CEP',
    },
    '6exfy16y': {
      'en': 'Buscar CEP',
      'pt': 'Buscar CEP',
    },
    'l6amd7pf': {
      'en': 'Rua/Av',
      'pt': 'Rua/Av',
    },
    '2q32u6g1': {
      'en': '',
      'pt': '',
    },
    'lavqtfem': {
      'en': 'Número',
      'pt': 'Número',
    },
    'yg9xg60p': {
      'en': '',
      'pt': '',
    },
    'fnhklntj': {
      'en': 'Complemento',
      'pt': 'Complemento',
    },
    'aui7h421': {
      'en': '',
      'pt': '',
    },
    '408h1ras': {
      'en': 'Bairro',
      'pt': 'Bairro',
    },
    'a08w4pf9': {
      'en': '',
      'pt': '',
    },
    '9xnmcp3s': {
      'en': 'Cidade',
      'pt': 'Cidade',
    },
    '51bcqbj4': {
      'en': '',
      'pt': '',
    },
    'a6e4eubm': {
      'en': 'Estado',
      'pt': 'Estado',
    },
    's7syj8n3': {
      'en': '',
      'pt': '',
    },
    'y02h64py': {
      'en': 'Campo obrigatório',
      'pt': '',
    },
    'v50nrh94': {
      'en': 'Please choose an option from the dropdown',
      'pt': '',
    },
    'o2saz5hd': {
      'en': 'Field is required',
      'pt': 'Campo é obrigatório!',
    },
    'jbr74cl8': {
      'en': 'Please choose an option from the dropdown',
      'pt': 'Selecione uma opção no menu suspenso',
    },
    'g9phgimm': {
      'en': 'Field is required',
      'pt': 'Campo obrigatório!',
    },
    '3mdgoxwf': {
      'en': 'Please choose an option from the dropdown',
      'pt': 'Selecione uma opção no menu suspenso',
    },
    'zdm5barf': {
      'en': 'Field is required',
      'pt': 'Campo é obrigatório!',
    },
    'vkre1ltk': {
      'en': 'Please choose an option from the dropdown',
      'pt': 'Selecione uma opção no menu suspenso',
    },
    'cmb3bj3a': {
      'en': 'Field is required',
      'pt': 'Campo é obrigatório!',
    },
    'fisiyofp': {
      'en': 'Please choose an option from the dropdown',
      'pt': 'Selecione uma opção no menu suspenso',
    },
    'yla4vwvu': {
      'en': 'Field is required',
      'pt': 'Campo é obrigatório',
    },
    'z5yjq8i8': {
      'en': 'Please choose an option from the dropdown',
      'pt': 'Selecione uma opção no menu suspenso',
    },
    'mt85wjgb': {
      'en': 'Field is required',
      'pt': '',
    },
    '91qggjq8': {
      'en': 'Please choose an option from the dropdown',
      'pt': '',
    },
    'z7p3pi6i': {
      'en': '__',
      'pt': '',
    },
  },
  // modal_success
  {
    'kred63vb': {
      'en': 'Send Contract Confirmation',
      'pt': 'Enviar confirmação do contrato',
    },
    'hywgg8eu': {
      'en': 'A new contract has been generated for:',
      'pt': 'Um novo contrato foi gerado para:',
    },
    'kmp2gbpy': {
      'en': 'Randy Alcorn',
      'pt': 'Randy Alcorn',
    },
    'a7nc1dt4': {
      'en': 'Head of Procurement',
      'pt': 'Chefe de Compras',
    },
    '2f2nxucv': {
      'en': 'ACME Co.',
      'pt': 'Empresa ACME',
    },
    'vcm4fijj': {
      'en': 'Next Steps',
      'pt': 'Próximos passos',
    },
    '60n0fqw5': {
      'en':
          'Send the information below. And we will send an email with details to the customer and allow you to manage it in your dashboard.',
      'pt':
          'Envie as informações abaixo. E nós enviaremos um e-mail com detalhes para o cliente e permitiremos que você gerencie isso no seu painel.',
    },
    'e408bhw6': {
      'en': 'Send Information',
      'pt': 'Enviar informações',
    },
    'wo1onxhi': {
      'en': 'Never Mind',
      'pt': 'Deixa para lá',
    },
  },
  // modal_message
  {
    'wa4vkne2': {
      'en': 'Congratulations!',
      'pt': 'Parabéns!',
    },
    '3hf2ocig': {
      'en':
          'Now that a contract has been generated for this customer please contact them with the date you will send the signed agreement.',
      'pt':
          'Agora que um contrato foi gerado para este cliente, entre em contato com ele para informar a data em que você enviará o acordo assinado.',
    },
    'q0jvi1lp': {
      'en': 'Okay',
      'pt': 'OK',
    },
    'oo4y13nf': {
      'en': 'Continue',
      'pt': 'Continuar',
    },
  },
  // modal_welcome
  {
    '00flvi93': {
      'en': 'Congratulations!',
      'pt': 'Parabéns!',
    },
    'fmzceh74': {
      'en': 'A new contract has been generated for:',
      'pt': 'Um novo contrato foi gerado para:',
    },
    'g8q2u55w': {
      'en': 'Continue',
      'pt': 'Continuar',
    },
  },
  // modal_add_comment
  {
    'l2jlnhye': {
      'en': 'Create Note',
      'pt': 'Criar nota',
    },
    'd6yfe8tj': {
      'en': 'Find members by searching below',
      'pt': 'Encontre membros pesquisando abaixo',
    },
    'p3rj5ra0': {
      'en': 'Ricky Rodriguez',
      'pt': 'Ricky Rodríguez',
    },
    '9gf6o5ss': {
      'en': 'Enter your note here...',
      'pt': 'Insira sua nota aqui...',
    },
    'farrki57': {
      'en': 'Create Note',
      'pt': 'Criar nota',
    },
  },
  // mobile_nav
  {
    'sy0pxvma': {
      'en': 'Dashboard',
      'pt': 'Painel',
    },
    't5c3aiuy': {
      'en': 'My Team',
      'pt': 'Minha equipe',
    },
    'nkz3c58a': {
      'en': 'Customers',
      'pt': 'Clientes',
    },
    '1mkyyjwj': {
      'en': 'Contracts',
      'pt': 'Contratos',
    },
    'eg79coc6': {
      'en': 'Profile',
      'pt': 'Perfil',
    },
  },
  // web_nav
  {
    'xai8ocja': {
      'en': 'Search',
      'pt': 'Procurar',
    },
    'yg07zi4c': {
      'en': 'Dashboard',
      'pt': 'Painel',
    },
    'lbojdpxg': {
      'en': 'Factions',
      'pt': 'Facções',
    },
    '9pjba90p': {
      'en': 'Members',
      'pt': 'Membros',
    },
    '5s0d776i': {
      'en': 'Messages',
      'pt': 'Mensagens',
    },
    'kfrv5rp5': {
      'en': 'Administration',
      'pt': 'Administração',
    },
    '01nu9cy0': {
      'en': 'Profile',
      'pt': 'Perfil',
    },
    'uiv9sien': {
      'en': 'Logout',
      'pt': 'Sair',
    },
    'kmbyse66': {
      'en': 'Light Mode',
      'pt': '',
    },
    'jcne973r': {
      'en': 'Dark Mode',
      'pt': '',
    },
  },
  // modal_command_palette
  {
    '8m0o3yfd': {
      'en': 'Search platform...',
      'pt': 'Plataforma de busca...',
    },
    'r2yl8d9a': {
      'en': 'Search',
      'pt': 'Procurar',
    },
    'cb7yd65n': {
      'en': 'Quick Links',
      'pt': 'Links rápidos',
    },
    'aehlyped': {
      'en': 'Find Member',
      'pt': 'Encontrar Membro',
    },
    'danyvope': {
      'en': 'Find Faction',
      'pt': 'Encontrar Facção',
    },
    'bngj5l7i': {
      'en': 'User Habilit',
      'pt': 'Habilidade do usuário',
    },
    'aong5an6': {
      'en': 'New member',
      'pt': 'Novo membro',
    },
  },
  // modal_profile_edit_photo
  {
    '6bnefz1c': {
      'en': 'Change Photo',
      'pt': 'Alterar foto',
    },
    'yaxe7q8v': {
      'en':
          'Upload a new photo below in order to change your avatar seen by others.',
      'pt':
          'Carregue uma nova foto abaixo para alterar seu avatar visto por outros.',
    },
    're4x0sz7': {
      'en': 'Upload Image',
      'pt': 'Carregar imagem',
    },
    'sr54fsk6': {
      'en': 'Save Changes',
      'pt': 'Salvar alterações',
    },
  },
  // user_details_main
  {
    '918p9oc4': {
      'en': 'Customer Name',
      'pt': 'Nome do cliente',
    },
    'gs85nrf2': {
      'en': 'Randy Alcorn',
      'pt': 'Randy Alcorn',
    },
    '534e9fmv': {
      'en': 'High Profile',
      'pt': 'Alto Perfil',
    },
    'jindju5a': {
      'en': 'Title',
      'pt': 'Título',
    },
    'ouyjuyvf': {
      'en': 'Head of Procurement',
      'pt': 'Chefe de Compras',
    },
    '8viyn84n': {
      'en': 'Company',
      'pt': 'Empresa',
    },
    '7enxw4hk': {
      'en': 'ACME Co.',
      'pt': 'Empresa ACME',
    },
    'f6o8asym': {
      'en': 'Notes',
      'pt': 'Notas',
    },
    'p41433bd': {
      'en': 'Alexandria Smith',
      'pt': 'Alexandria Smith',
    },
    'a3j3ejvp': {
      'en': '1m ago',
      'pt': '1m atrás',
    },
    'yqm004xu': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
      'pt':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incidente ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea comodo consequat.',
    },
    'v33uqxl2': {
      'en': '8',
      'pt': '8',
    },
    'cn1mi2rc': {
      'en': 'Notes',
      'pt': 'Notas',
    },
    '01hso9ea': {
      'en': 'Randy Alcorn',
      'pt': 'Randy Alcorn',
    },
    'st5cr4ca': {
      'en':
          'I\'m not really sure about this section here aI think you should do soemthing cool!',
      'pt':
          'Não tenho muita certeza sobre esta seção aqui, mas acho que você deveria fazer algo legal!',
    },
    '5h4d8i39': {
      'en': 'a min ago',
      'pt': 'um minuto atrás',
    },
    '8rmeqctf': {
      'en': 'Generate Quote',
      'pt': 'Gerar Cotação',
    },
    'ougpd8b8': {
      'en': 'View Company',
      'pt': 'Ver empresa',
    },
  },
  // dropdown_usuario_admin_edit
  {
    'vqk7im3j': {
      'en': 'Options',
      'pt': 'Opções',
    },
    'ufasy4ju': {
      'en': 'Edit',
      'pt': 'Editar',
    },
    'w1jtn19u': {
      'en': 'View',
      'pt': 'Visualizar',
    },
    '9qkfsg85': {
      'en': 'Delete',
      'pt': 'Excluir',
    },
    'pnpighuj': {
      'en': 'Atribuir acessos',
      'pt': 'Atribuir acessos',
    },
    '6kc0o458': {
      'en': ' Básico',
      'pt': 'Básico',
    },
    '9v90iv59': {
      'en': 'Análise',
      'pt': 'Análise',
    },
    'kwwbdpwg': {
      'en': 'Gestor',
      'pt': 'Gestor',
    },
    'nkugovnf': {
      'en': 'Administrador',
      'pt': 'Administrador',
    },
    '08tfqij4': {
      'en': 'Desenvolvedor',
      'pt': 'Desenvolvedor',
    },
  },
  // modal_faccao_add
  {
    '5tdm3cpv': {
      'en': 'Add Faction',
      'pt': 'Adicionar Facção',
    },
    'vlg015ed': {
      'en': 'Please enter the information below to add a Faction.',
      'pt': 'Insira as informações abaixo para adicionar uma facção.',
    },
    'dqo5yhdb': {
      'en': 'Add Photo',
      'pt': 'Adicionar foto',
    },
    'eihow1ck': {
      'en': 'Nome da facção',
      'pt': 'Nome da facção',
    },
    '426hn69e': {
      'en': 'Faction Name',
      'pt': 'Nome da Facção',
    },
    'cxlzs5tl': {
      'en': 'Nome da facção',
      'pt': ' Nome da facção',
    },
    'gvgwcy4p': {
      'en': 'Descrição ou Biografia',
      'pt': 'Descrição ou Biografia',
    },
    'uqziqhmg': {
      'en': 'Description ',
      'pt': 'Descrição',
    },
    '2g54ptaj': {
      'en': 'Save',
      'pt': 'Salvar',
    },
    '4spmowtt': {
      'en': 'Please enter a project name...',
      'pt': 'Por favor, insira um nome de projeto...',
    },
    '32kj9709': {
      'en': 'Please choose an option from the dropdown',
      'pt': 'Selecione uma opção no menu suspenso',
    },
    'wfu6up0n': {
      'en': 'Please enter a short description...',
      'pt': 'Insira uma breve descrição...',
    },
    'qt5dp4ez': {
      'en': 'Please choose an option from the dropdown',
      'pt': 'Selecione uma opção no menu suspenso',
    },
  },
  // project_details_alt
  {
    'zgyw4s95': {
      'en': 'ACME Co.',
      'pt': 'Empresa ACME',
    },
    'izuvtgws': {
      'en': 'Contracts for New Opportunities',
      'pt': 'Contratos para Novas Oportunidades',
    },
    'gamp8n19': {
      'en': 'Assigned To',
      'pt': 'Atribuído a',
    },
    'obbewkqp': {
      'en': 'Randy Rudolph',
      'pt': 'Randy Rudolfo',
    },
    'ae8di6vv': {
      'en': 'name@domain.com',
      'pt': 'nome@domínio.com',
    },
    'x6aorxwd': {
      'en': 'Next Action',
      'pt': 'Próxima ação',
    },
    '8sktau69': {
      'en': 'Tuesday, 10:00am',
      'pt': 'Terça-feira, 10:00 da manhã',
    },
    'ck1j2u5s': {
      'en': 'In Progress',
      'pt': 'Em andamento',
    },
    '3z7p2nt3': {
      'en': 'Activity',
      'pt': 'Atividade',
    },
    '4fs4d1ar': {
      'en': 'FlutterFlow CRM App:',
      'pt': 'Aplicativo FlutterFlow CRM:',
    },
    'n5ub587t': {
      'en': ' Begin Work',
      'pt': 'Começar a trabalhar',
    },
    'y2yi7ro1': {
      'en': 'SOW Change Order',
      'pt': 'Ordem de alteração do SOW',
    },
    'tyo3th3g': {
      'en': 'FlutterFlow CRM App',
      'pt': 'Aplicativo FlutterFlow CRM',
    },
    't1shbmsx': {
      'en': 'Jul 8, at 4:31pm',
      'pt': '8 de julho, às 16h31',
    },
    'fjdirac9': {
      'en': 'Jeremiah Goldsten ',
      'pt': 'Jeremias Goldsten',
    },
    'g9h5nanl': {
      'en': 'accepted a request',
      'pt': 'aceitou um pedido',
    },
    'ndvrf4a3': {
      'en': 'SOW Change Order',
      'pt': 'Ordem de alteração do SOW',
    },
    'ruswj67g': {
      'en': 'FlutterFlow CRM App',
      'pt': 'Aplicativo FlutterFlow CRM',
    },
    'cgdoty6v': {
      'en':
          '\"Notifications and reminders informing users about upcoming classes and training schedules will be sent to them via email, SMS or notifications within the application.\"',
      'pt':
          '\"Notificações e lembretes informando os usuários sobre as próximas aulas e cronogramas de treinamento serão enviados a eles por e-mail, SMS ou notificações no aplicativo.\"',
    },
    'z3xab243': {
      'en': 'Jul 8, at 4:30pm',
      'pt': '8 de julho, às 16h30',
    },
    'a19jraal': {
      'en': 'Randy Rudolph ',
      'pt': 'Randy Rudolfo',
    },
    'b3k94yjl': {
      'en': 'sent a SOW Change Order for ',
      'pt': 'enviou uma Ordem de Alteração SOW para',
    },
    '9vhvqp6g': {
      'en': 'FlutterFlow CRM APP',
      'pt': 'Aplicativo FlutterFlow CRM',
    },
    '7djk72um': {
      'en': 'SOW Change Order',
      'pt': 'Ordem de alteração do SOW',
    },
    'qysyag2v': {
      'en': 'FlutterFlow CRM App',
      'pt': 'Aplicativo FlutterFlow CRM',
    },
    'ur5udrbc': {
      'en':
          '\"Please review the updates to this document and get back with me.\"',
      'pt':
          '\"Por favor, revise as atualizações deste documento e entre em contato comigo.\"',
    },
    'm8scfp1r': {
      'en': 'Jul 8, at 2:20pm',
      'pt': '8 de julho, às 14h20',
    },
    'n251rti5': {
      'en': 'Contracts',
      'pt': 'Contratos',
    },
    'i8p8t5uw': {
      'en': 'Updates to Existing App',
      'pt': 'Atualizações para o aplicativo existente',
    },
    'ks3nu6ra': {
      'en':
          'Additional Details around this contract and who is working on it in this card!',
      'pt':
          'Detalhes adicionais sobre este contrato e quem está trabalhando nele neste card!',
    },
    'f3u7xqx4': {
      'en': 'Contract Details',
      'pt': 'Detalhes do contrato',
    },
    'r2ns8igs': {
      'en': '\$210,000',
      'pt': '\$ 210.000',
    },
    'y5zgyf1b': {
      'en': 'Mark as Complete',
      'pt': 'Marcar como concluído',
    },
    'va0zdk6p': {
      'en': 'New FlutterFlow App',
      'pt': 'Novo aplicativo FlutterFlow',
    },
    't24sfvud': {
      'en':
          'The user can browse through our extensive catalog of fitness classes by filtering based on class type, location, time, and instructor. Each class will have detailed descriptions of the program, instructors, timings, availability, and rates.',
      'pt':
          'O usuário pode navegar pelo nosso extenso catálogo de aulas de fitness filtrando com base no tipo de aula, local, horário e instrutor. Cada aula terá descrições detalhadas do programa, instrutores, horários, disponibilidade e taxas.',
    },
    'nzh0mhza': {
      'en': 'Contract Details',
      'pt': 'Detalhes do contrato',
    },
    'dmcqhebq': {
      'en': '\$67,000',
      'pt': '\$ 67.000',
    },
    'it7y6ia8': {
      'en': 'Mark as Complete',
      'pt': 'Marcar como concluído',
    },
    'x8yfre0t': {
      'en': 'Project Details',
      'pt': 'Detalhes do Projeto',
    },
  },
  // modal_membros_add
  {
    'ioxmm05s': {
      'en': 'Add Member',
      'pt': 'Adicionar membro',
    },
    'ap8ub3ro': {
      'en': 'Profile',
      'pt': 'Perfil',
    },
    'fuw255xv': {
      'en':
          'Upload images about the  member and fill out the information below.',
      'pt': 'Carregue imagens sobre o membro e preencha as informações abaixo.',
    },
    'n7bo970y': {
      'en': 'Add Photos',
      'pt': 'Adicionar fotos',
    },
    '26cfzci7': {
      'en':
          'Add one or more images about the Member.\nMaximum of 6 (six) images.',
      'pt':
          'Adicione uma ou mais imagens sobre o Membro. \nNo máximo de 6 (seis) imagens.',
    },
    'szzdveit': {
      'en': 'Apagar Fotos',
      'pt': 'Apagar Fotos',
    },
    'eivogkvw': {
      'en':
          'ATTENTION: (1) Front Photo, (2) Left Side Photo, (3) Right Side Photo and (4) Tattoos. Maximum of 6 images (200px by 200px each).',
      'pt':
          'ATENÇÃO : (1) Foto Frente, (2) Foto Lateral Esquerda, (3) Foto Lateral Direira e (4) Tatuagens . No máximo de 6 imagens (200px por 200px cada).',
    },
    'npcbcpl9': {
      'en': 'Nome completo',
      'pt': 'Nome completo',
    },
    'eyhgaf81': {
      'en': 'Nome completo',
      'pt': 'Nome completo',
    },
    'ikt0h50o': {
      'en': 'Alcunha',
      'pt': 'Alcunha',
    },
    'jna6z2zu': {
      'en': 'Alcunha',
      'pt': 'Alcunha',
    },
    't455vcot': {
      'en':
          'To add nickname(s) you need to fill in the Nickname Field and click on the (+) Button',
      'pt':
          'Para adicionar à(s) alcunha(s) precisa preencher o Campo Alcunha e clicar no Botão (+) ',
    },
    'deg0fdow': {
      'en': 'Naturalidade',
      'pt': 'Naturalidade',
    },
    'o99a5cgx': {
      'en': 'Naturalidade',
      'pt': 'Naturalidade',
    },
    't9eza7j1': {
      'en': 'Solteiro',
      'pt': 'Solteiro',
    },
    'l63dv3dx': {
      'en': 'Casado',
      'pt': 'Casado',
    },
    'e2udnh0l': {
      'en': 'DIvorciado',
      'pt': 'Divorciado',
    },
    'ggvr9869': {
      'en': 'Viúvo(a)',
      'pt': 'Viúvo(a)',
    },
    'dq3xw3uc': {
      'en': 'Separados legalmente',
      'pt': 'Separados legalmente',
    },
    'bm6cnl7l': {
      'en': 'União estável',
      'pt': 'União estável',
    },
    '75eegesr': {
      'en': 'Nenhuma das opções',
      'pt': 'Nenhuma das opções',
    },
    'ievjy8qu': {
      'en': 'Estado civil',
      'pt': 'Estado civil',
    },
    'tfn53ft8': {
      'en': 'Estado civil',
      'pt': 'Estado civil',
    },
    '2opj9i3o': {
      'en': 'Identidade',
      'pt': 'Identidade',
    },
    'v4bdomyi': {
      'en': 'Identidade',
      'pt': 'Identidade',
    },
    'kuvmd4lw': {
      'en': 'SSP-AL',
      'pt': 'SSP-AL',
    },
    'i0p55l2k': {
      'en': 'SSP-SE',
      'pt': 'SSP-SE',
    },
    'q0egmn1z': {
      'en': 'SSP-CE',
      'pt': 'SSP-CE',
    },
    'yoj8hn6v': {
      'en': 'SSP-PE',
      'pt': 'SSP-PE',
    },
    'vuc1hntf': {
      'en': 'SSP-BA',
      'pt': 'SSP-BA',
    },
    'lhjvkfqm': {
      'en': 'SSP-RN',
      'pt': 'SSP-RN',
    },
    'ryqcnfe0': {
      'en': 'None of the options',
      'pt': 'Nenhuma das opções',
    },
    'ia9zkanc': {
      'en': 'Issuing body',
      'pt': 'Órgão expedidor',
    },
    'h3ykxfak': {
      'en': 'Issuing body',
      'pt': 'Órgão expedidor',
    },
    'k3o15zmt': {
      'en': 'CPF',
      'pt': 'CPF',
    },
    '1rai7wkj': {
      'en': 'CPF',
      'pt': 'CPF',
    },
    'f434de4i': {
      'en': 'Infopen Registration',
      'pt': 'Cadastro Infopen',
    },
    '1yyjhbj8': {
      'en': 'Infopen Registration',
      'pt': 'Cadastro Infopen',
    },
    'cjy846zr': {
      'en': 'Mother\'s name',
      'pt': 'Nome da mãe',
    },
    '7g88w199': {
      'en': 'Mother\'s name',
      'pt': 'Nome da mãe',
    },
    '4ebn7u9d': {
      'en': 'Alive',
      'pt': 'Viva',
    },
    'vte6onee': {
      'en': 'Deceased',
      'pt': 'Falecida',
    },
    '188nb78m': {
      'en': 'Wheelchair user',
      'pt': 'Cadeirante',
    },
    'aw1z7gel': {
      'en': 'No information',
      'pt': 'Sem informação',
    },
    'gc3vbmj4': {
      'en': 'Mother\'s situation',
      'pt': 'Situação da Mãe',
    },
    'bj72hiw8': {
      'en': 'Mother\'s situation',
      'pt': 'Situação da Mãe',
    },
    'lbcdz337': {
      'en': 'Father\'s name',
      'pt': 'Nome do pai',
    },
    '35jyk488': {
      'en': 'Father\'s name',
      'pt': 'Nome do pai',
    },
    'l5vrftgu': {
      'en': '',
      'pt': '',
    },
    'qyc8q0st': {
      'en': 'Alive',
      'pt': 'Vivo',
    },
    '7ygxf6rh': {
      'en': 'Deceased',
      'pt': 'Falecido',
    },
    'wmbvp74d': {
      'en': 'Wheelchair user',
      'pt': 'Cadeirante',
    },
    'r9rah6gc': {
      'en': 'No information',
      'pt': 'Sem informação',
    },
    'cnn9tddw': {
      'en': 'Father\'s situation',
      'pt': 'Situação do Pai',
    },
    'bsvzf3cx': {
      'en': 'Father\'s situation',
      'pt': 'Situação do Pai',
    },
    'r2g2yo2p': {
      'en': 'Alfabetizado',
      'pt': 'Alfabetizado',
    },
    'y7i4eicy': {
      'en': 'illiterate',
      'pt': 'Não alfabetizado',
    },
    'xmduvdwh': {
      'en': 'Completed elementary education',
      'pt': 'Ensino fundamental completo',
    },
    'lvynt86i': {
      'en': 'Completed high school',
      'pt': 'Ensino médio completo',
    },
    'eur8h0kh': {
      'en': 'Completed higher education',
      'pt': 'Ensino superior completo',
    },
    'm10ha0nj': {
      'en': 'Incomplete elementary education',
      'pt': 'Ensino fundamental incompleto',
    },
    'csrvq6pn': {
      'en': 'Incomplete high school',
      'pt': 'Ensino médio incompleto',
    },
    'tb0j8o1f': {
      'en': 'Incomplete higher education',
      'pt': 'Ensino superior incompleto',
    },
    'm23r6x4v': {
      'en': 'No information',
      'pt': 'Sem informação',
    },
    '0wrilaus': {
      'en': 'Degree or Level of Education',
      'pt': 'Grau ou Nível de instrução',
    },
    '4thgagtf': {
      'en': 'Degree or Level of Education',
      'pt': 'Grau ou nível de educação',
    },
    'qjj69k8u': {
      'en': 'Field is required',
      'pt': 'Campo é obrigatório',
    },
    'o5on3ke1': {
      'en': 'Please choose an option from the dropdown',
      'pt': 'Selecione uma opção no menu suspenso',
    },
    'ym3akpkn': {
      'en': 'Field is required',
      'pt': 'Campo é obrigatório',
    },
    'n2o48na0': {
      'en': 'Please choose an option from the dropdown',
      'pt': 'Selecione uma opção no menu suspenso',
    },
    'v395se51': {
      'en': 'Field is required',
      'pt': 'Campo é obrigatório',
    },
    'ig5z8pao': {
      'en': 'Please choose an option from the dropdown',
      'pt': '',
    },
    'wb25vyk9': {
      'en': 'Field is required',
      'pt': 'Campo é obrigatório',
    },
    'swo0b7np': {
      'en': 'Please choose an option from the dropdown',
      'pt': '',
    },
    'nfcv23yd': {
      'en': 'Field is required',
      'pt': 'Campo é obrigatório',
    },
    'm3wl1tny': {
      'en': 'Please choose an option from the dropdown',
      'pt': '',
    },
    'hmz6g9kq': {
      'en': 'Field is required',
      'pt': 'Campo é obrigatório',
    },
    'dl0iqn1k': {
      'en': 'Please choose an option from the dropdown',
      'pt': '',
    },
    'aajuf6zo': {
      'en': 'Field is required',
      'pt': 'Campo é obrigatório',
    },
    'kb47qv7h': {
      'en': 'Please choose an option from the dropdown',
      'pt': '',
    },
    '2wgvagjr': {
      'en': 'Field is required',
      'pt': 'Campo é obrigatório',
    },
    'f7drazjt': {
      'en': 'Please choose an option from the dropdown',
      'pt': '',
    },
    'nvxntirq': {
      'en': 'Localization',
      'pt': 'Localização',
    },
    'cwp7l7r2': {
      'en': 'Nascido no Brasil',
      'pt': 'Nascido no Brasil',
    },
    'tcv32o0m': {
      'en': 'Nascido no Brasil',
      'pt': 'Nascido no Brasil',
    },
    'p05w4mzf': {
      'en': 'Naturalizado Brasileiro',
      'pt': 'Naturalizado Brasileiro',
    },
    '78heuj7d': {
      'en': 'Estrangeiro',
      'pt': 'Estrangeiro',
    },
    'yc6rcmtz': {
      'en': 'Estado',
      'pt': 'Estado',
    },
    'f7rl31yp': {
      'en': 'Search...',
      'pt': 'Procurar...',
    },
    'fkmdz2kr': {
      'en': 'Municipio',
      'pt': 'Município',
    },
    's9xkiwbl': {
      'en': 'Search...',
      'pt': 'Procurar...',
    },
    'sc0bhfzq': {
      'en': '',
      'pt': '',
    },
    'uw8i01r5': {
      'en': 'Endereço Completo',
      'pt': 'Endereço Completo',
    },
    '97izofel': {
      'en': 'Endereço Completo',
      'pt': 'Endereço Completo',
    },
    'd56blqb1': {
      'en':
          'To add the address(es) you need to fill in\nthe Address field and click on the (+) button.',
      'pt':
          'Para adicionar o(s) endereço(s) precisa preencher \no campo Endereço e clicar no Botão (+) ',
    },
    'zo5mhuuq': {
      'en': 'Facção',
      'pt': 'Facção',
    },
    '4z7rsy3e': {
      'en':
          'Informe os dados sobre o membro e a facção na qual o mesmo pertecem.',
      'pt':
          'Informe os dados sobre o membro e a facção sobre qual o mesmo pertecem.',
    },
    'wym31ngo': {
      'en': 'Option 1',
      'pt': 'Opção 1',
    },
    'dn03i4b5': {
      'en': 'Option 2',
      'pt': 'Opção 2',
    },
    'kuqoapto': {
      'en': 'Option 3',
      'pt': 'Opção 3',
    },
    'qrs0yx4b': {
      'en': 'Facções',
      'pt': 'Facções',
    },
    'xcc9fckm': {
      'en': 'Search...',
      'pt': 'Procurar...',
    },
    'wkak4lxs': {
      'en': 'Batismo',
      'pt': 'Batismo',
    },
    'pm0rvser': {
      'en': 'Batismo',
      'pt': 'Batismo',
    },
    'buogb0wh': {
      'en': 'Option 1',
      'pt': 'Opção 1',
    },
    'v5ktssho': {
      'en': 'Local do Batismo',
      'pt': 'Local do Batismo',
    },
    '344g39wc': {
      'en': 'Local do Batismo',
      'pt': 'Local do Batismo',
    },
    'cteddjhn': {
      'en': 'Padrinho',
      'pt': 'Padrinho',
    },
    'zntstdx4': {
      'en': 'Padrinho',
      'pt': 'Padrinho',
    },
    'uylgtxfb': {
      'en': 'Senha',
      'pt': 'Senha',
    },
    'h7acv992': {
      'en': 'Senha',
      'pt': 'Senha',
    },
    '5xrtyank': {
      'en': 'Cargo atual',
      'pt': 'Carga atual',
    },
    'u231jvsq': {
      'en': 'Marital status',
      'pt': 'Estado civil',
    },
    'uhi29t9v': {
      'en': 'Cargo anterior',
      'pt': 'Carga anterior',
    },
    'bfv93uyj': {
      'en': 'Marital status',
      'pt': 'Estado civil',
    },
    '0c8h6wz9': {
      'en': 'Função atual',
      'pt': 'Função atual',
    },
    'qc1gohjk': {
      'en': 'Mother\'s Situation',
      'pt': 'Situação da Mãe',
    },
    '8c2yoabs': {
      'en': 'Função anterior',
      'pt': 'Função anterior',
    },
    'xtghmnhj': {
      'en': 'Função anterior',
      'pt': 'Função anterior',
    },
    'm25toomj': {
      'en': 'Três últimos locais onde esteve preso',
      'pt': 'Três últimos locais onde esteve preso',
    },
    'xroteapo': {
      'en': 'Três últimos locais onde esteve preso',
      'pt': 'Três últimos locais onde esteve preso',
    },
    '6mn9o1ts': {
      'en':
          'To add the name of the Prison(s) you need to fill in the \nlast three locations and click on the (+) button.',
      'pt':
          'Para adicionar o(s) nome de Presídio (s) precisa preencher \nos Três últimos locais e clicar no Botão (+) ',
    },
    '8uf1jitv': {
      'en': 'Facção que integrou',
      'pt': 'Facção que integrou',
    },
    'fzkhhi3x': {
      'en': 'Facção que integrou',
      'pt': 'Facção que integrou',
    },
    '4i6g2oa6': {
      'en': 'Facção aliada',
      'pt': 'Facção aliada',
    },
    'rnawpmov': {
      'en': 'Father\'s Situation',
      'pt': 'Situação do Pai',
    },
    '2rfuge4k': {
      'en': 'Facção Inimiga',
      'pt': 'Facção Inimiga',
    },
    '03pc9yaz': {
      'en': 'Facção Inimiga',
      'pt': 'Facção Inimiga',
    },
    'i2sj5hwa': {
      'en': 'Field is required',
      'pt': 'Campo é obrigatório!',
    },
    'lerrd27b': {
      'en': 'Please choose an option from the dropdown',
      'pt': 'Selecione uma opção no menu suspenso',
    },
    'jgdeykjo': {
      'en': 'Field is required',
      'pt': 'Campo obrigatório!',
    },
    'wkwcrq40': {
      'en': 'Please choose an option from the dropdown',
      'pt': 'Selecione uma opção no menu suspenso',
    },
    '6ms24pjq': {
      'en': 'Field is required',
      'pt': 'Campo é obrigatório!',
    },
    'e7y2gi52': {
      'en': 'Please choose an option from the dropdown',
      'pt': 'Selecione uma opção no menu suspenso',
    },
    'u9b5zrd8': {
      'en': 'Field is required',
      'pt': 'Campo é obrigatório!',
    },
    '51dgcn8o': {
      'en': 'Please choose an option from the dropdown',
      'pt': 'Selecione uma opção no menu suspenso',
    },
    'bauzjvgj': {
      'en': 'Field is required',
      'pt': 'Campo é obrigatório',
    },
    'z10jh0v9': {
      'en': 'Please choose an option from the dropdown',
      'pt': 'Selecione uma opção no menu suspenso',
    },
    'xeeiaebp': {
      'en': 'Procedimentos',
      'pt': 'Procedimentos',
    },
    '4trmbq2b': {
      'en':
          'Informe os dados sobre os Procedimentos que foram realizados contra esse membro.',
      'pt':
          'Informe os dados sobre os procedimentos que foram realizados contra esse membro.',
    },
    'ehpi1bdt': {
      'en': 'Procedure',
      'pt': 'Procedimento',
    },
    'cqb8a5yu': {
      'en': 'Procedure',
      'pt': 'Procedimento',
    },
    'a1mq04vz': {
      'en': 'None of the options',
      'pt': 'Nenhuma das opções',
    },
    'ptm9fsnl': {
      'en': 'Local Police Station',
      'pt': 'Delegacia Local',
    },
    'ewv0wp4u': {
      'en': 'Specialized Police Station',
      'pt': 'Delegacia Especializada',
    },
    'tfba3ok1': {
      'en': 'Regional Police Station',
      'pt': 'Delegacia Regional',
    },
    'p4l0yjdk': {
      'en': 'Unit',
      'pt': 'Unidade',
    },
    'ugrmtsta': {
      'en': 'Search...',
      'pt': 'Procurar...',
    },
    '2oi2gd2o': {
      'en': 'None of the options',
      'pt': 'Nenhuma das opções',
    },
    'fqtt5evw': {
      'en': 'IPL. Ordinance',
      'pt': 'IPL. Portaria',
    },
    'nlsyfr82': {
      'en': 'IPL. Flagrant',
      'pt': 'IPL. Flagrante',
    },
    '1sk13k9j': {
      'en': 'T.C.O',
      'pt': 'T.C.O',
    },
    'z4wg64u9': {
      'en': 'Type of procedure',
      'pt': 'Tipo de procedimento',
    },
    'cd6xrkst': {
      'en': 'Search...',
      'pt': 'Procurar...',
    },
    'sgflhc8f': {
      'en': 'None of the options',
      'pt': 'Nenhuma das opções',
    },
    '6pi3pms7': {
      'en': 'Drug trafficking',
      'pt': 'Tráfico de drogas',
    },
    '5zqnvie0': {
      'en': 'Qualified Robbery',
      'pt': 'Roubo Qualificado',
    },
    'ohxl9bc7': {
      'en': 'Bodily Injury',
      'pt': 'Lesão Corporal',
    },
    '1zj80s5y': {
      'en': 'Murder',
      'pt': 'Homicídio',
    },
    '86bdc01p': {
      'en': 'Crime',
      'pt': 'Crime',
    },
    'bqng7ebw': {
      'en': 'Search...',
      'pt': 'Procurar...',
    },
    'kkjjfns6': {
      'en': 'Procedure Date',
      'pt': 'Dados do Procedimento',
    },
    'y539pnv4': {
      'en': 'Procedure Date',
      'pt': 'Dados do Procedimento',
    },
    '5mm0nr5l': {
      'en': 'Clear procedures below',
      'pt': 'Limpar procedimentos abaixo',
    },
    '8pxnhql5': {
      'en': 'To add',
      'pt': 'Adicionar',
    },
    'b2y5qt8s': {
      'en': 'Field is required',
      'pt': 'Campo é obrigatório!',
    },
    '7qwcyv6f': {
      'en': 'Please choose an option from the dropdown',
      'pt': 'Selecione uma opção no menu suspenso',
    },
    'jc4by7hx': {
      'en': 'Field is required',
      'pt': 'Campo obrigatório!',
    },
    'qahg5njj': {
      'en': 'Please choose an option from the dropdown',
      'pt': 'Selecione uma opção no menu suspenso',
    },
    'g3vpoxn0': {
      'en': 'Procedure',
      'pt': 'Procedimento',
    },
    '6vsm4hcv': {
      'en': 'Unit',
      'pt': 'Unidade',
    },
    '1rnrt2ya': {
      'en': 'Type of procedure:',
      'pt': 'Tipo de procedimento:',
    },
    '7esylq1a': {
      'en': 'Crime',
      'pt': 'Crime',
    },
    '8m6o6goq': {
      'en': 'Data',
      'pt': 'Dados',
    },
    '0v0s6s8e': {
      'en': 'Procedures',
      'pt': 'Processos',
    },
    '50bd7mi1': {
      'en':
          'Provide information about the Processes that were carried out against this member.',
      'pt':
          'Informe os dados sobre o Processo que foram realizados contra esse membro.',
    },
    'ig1tpcu8': {
      'en': 'Criminal action number',
      'pt': 'Nº da ação Penal',
    },
    'on8d1j5b': {
      'en': 'None of the options',
      'pt': 'Nenhuma das opções',
    },
    '3y3arw03': {
      'en': '1st CRIMINAL COURT',
      'pt': '1ª VARA PENAL',
    },
    '2ad97h60': {
      'en': '2nd CRIMINAL COURT',
      'pt': '2ª VARA PENAL',
    },
    '62uy1ula': {
      'en': '3rd CRIMINAL COURT',
      'pt': '3ª VARA PENAL',
    },
    '52tqxh7t': {
      'en': 'Stick',
      'pt': 'Vara',
    },
    'f81efpi5': {
      'en': 'Search ...',
      'pt': 'Procurar ...',
    },
    '9ntgj4nz': {
      'en': 'None of the options',
      'pt': 'Nenhuma das opções',
    },
    '9krzgpyy': {
      'en': 'Convicted',
      'pt': 'Condenado',
    },
    'veeirmiy': {
      'en': 'Provisional',
      'pt': 'Provisório',
    },
    '85dco8ds': {
      'en': 'Awaiting sentence',
      'pt': 'Aguardando Sentença',
    },
    'njzw806d': {
      'en': 'Legal status',
      'pt': 'Situação jurídica',
    },
    'p7i3qgzk': {
      'en': 'Search...',
      'pt': 'Procurar...',
    },
    'eskukxtn': {
      'en': 'None of the options',
      'pt': 'Nenhuma das opções',
    },
    '3ucnkzsn': {
      'en': 'Closed',
      'pt': 'Fechado',
    },
    '9ogzdq4x': {
      'en': 'Semi-open',
      'pt': 'Semi-aberto',
    },
    'gjnab6i2': {
      'en': 'Regime',
      'pt': 'Regime',
    },
    'zgtd0ndz': {
      'en': 'Search...',
      'pt': 'Procurar...',
    },
    'qoe55ylu': {
      'en': '',
      'pt': '',
    },
    'tn9os876': {
      'en': 'Nenhuma das opções',
      'pt': 'Nenhuma das opções',
    },
    '6f4ajcmk': {
      'en': 'Arrested',
      'pt': 'Preso',
    },
    'wjr32pf6': {
      'en': 'Loose',
      'pt': 'Solto',
    },
    'whrvcs43': {
      'en': 'Defendant situation',
      'pt': 'Situação real',
    },
    'dquf2f18': {
      'en': 'Search...',
      'pt': 'Procurar...',
    },
    'tveo07et': {
      'en': 'To clean',
      'pt': 'Limpar',
    },
    'vm7t0n6u': {
      'en': 'To add',
      'pt': 'Adicionar',
    },
    'noufgwqe': {
      'en': 'Criminal action number',
      'pt': 'Nº da ação Penal',
    },
    'xeuwwqlt': {
      'en': 'Stick',
      'pt': 'Vara',
    },
    '9t25cx0m': {
      'en': 'Legal status',
      'pt': 'Situação jurídica',
    },
    'ptv8ms3l': {
      'en': 'Regime',
      'pt': 'Regime',
    },
    '670xv14p': {
      'en': 'Defendant situation',
      'pt': 'Situação real',
    },
    'xaeljp2r': {
      'en': 'Performance',
      'pt': 'Atuação',
    },
    '7v3qtjj2': {
      'en': 'Make a summary of the main criminal actions of this member.',
      'pt': 'Faça um resumo das principais atuações criminais deste membro.',
    },
    'q663z63w': {
      'en': 'Historic',
      'pt': 'Histórico',
    },
    'dpwi4x3z': {
      'en': 'Historic',
      'pt': 'Histórico',
    },
    'n1o81u1k': {
      'en': 'Crime Action',
      'pt': 'Atuação no Crime',
    },
    'bc31iq3e': {
      'en': 'Crime Action',
      'pt': 'Atuação no Crime',
    },
    '8slh1eth': {
      'en': 'Alert',
      'pt': 'Alerta',
    },
    '3etmnyzt': {
      'en': 'Enable alert',
      'pt': 'Ativar alerta',
    },
    '29530mgy': {
      'en': 'Alert',
      'pt': 'Alerta',
    },
    'kx61gjir': {
      'en': 'Alert',
      'pt': 'Alerta',
    },
    '2rc41m6r': {
      'en': 'Validation',
      'pt': 'Validação',
    },
    'hg8tsf0e': {
      'en': 'Percentage of data validations',
      'pt': 'Percentual de validações dos dados',
    },
    'z911x2kd': {
      'en': 'How were the data and information validated?',
      'pt': 'Como foram validados os dados e informações ?',
    },
    'udriebg5': {
      'en': 'Local validation or area of ​​operation',
      'pt': 'Validação Local ou área de atuação',
    },
    'ekk2ybut': {
      'en': 'Only through open sources',
      'pt': 'Apenas através de fontes abertas',
    },
    'jq3rovfo': {
      'en': 'Only through restricted sources',
      'pt': 'Apenas através de fontes restristas',
    },
    'si112iv5': {
      'en': 'Through other intelligence agency(ies)',
      'pt': 'Através de outra(s) agência de inteligência',
    },
    'ucqyj1ot': {
      'en': 'Through other bodies such as: PP, MP, etc.',
      'pt': 'Atráves de outro(s) órgãos como: PP, MP e etc.',
    },
    'qd88nb62': {
      'en': 'Only through report(s)',
      'pt': 'Apenas através de informe(s)',
    },
    'gq42kahm': {
      'en': 'Inside a State Prison Facility',
      'pt': 'Dentro de um Estabelecimento Prisional Estadual',
    },
    'ma9rbpmx': {
      'en': 'Dentro de um Estabelecimento Prisional Federal',
      'pt': 'Dentro de um Estabelecimento Prisional Federal',
    },
    '1i2vccnc': {
      'en': 'Apenas através de informante(s)',
      'pt': 'Apenas através de informante(s)',
    },
    'zcj6hpny': {
      'en': 'Apenas através de Coolaborador(es)',
      'pt': 'Apenas através de Colaborador(es)',
    },
    'v0fvpqeq': {
      'en': '',
      'pt': '',
    },
    '6ih49zhb': {
      'en': '0.1',
      'pt': '0,1',
    },
    'hu7rwf8m': {
      'en': 'Observação(ões)',
      'pt': 'Observação(ões)',
    },
    '0a8jmcbn': {
      'en': 'Observação(ões)',
      'pt': 'Observação(ões)',
    },
    'ld0rt7j2': {
      'en': 'Relations',
      'pt': 'Relações',
    },
    'hikp6nbx': {
      'en': 'Groups',
      'pt': 'Grupos',
    },
    'qziqype9': {
      'en': 'Cancel',
      'pt': 'Cancelar',
    },
    'xkcg34s5': {
      'en': 'Save Member',
      'pt': 'Salvar Membro',
    },
  },
  // modal_invite_user
  {
    '2c6w1mkp': {
      'en': 'Edit User Details',
      'pt': 'Editar detalhes do usuário',
    },
    'nez3q1xc': {
      'en': 'Edit the details of the user below.',
      'pt': 'Edite os detalhes do usuário abaixo.',
    },
    'ea9pniln': {
      'en': 'Randy Peterson',
      'pt': 'Randy Peterson',
    },
    'b99om96j': {
      'en': 'name@domainname.com',
      'pt': 'nome@nomedodomínio.com',
    },
    'ctfs7f6t': {
      'en': 'User Name',
      'pt': 'Nome de usuário',
    },
    'lz0vcvft': {
      'en': 'Bio',
      'pt': 'Biografia',
    },
    '7f4dqnt8': {
      'en': 'Admin',
      'pt': 'Administrador',
    },
    'tzetnwcj': {
      'en': 'Manager',
      'pt': 'Gerente',
    },
    'r8pq5puc': {
      'en': 'Editor',
      'pt': 'Editor',
    },
    'by2vigrp': {
      'en': 'Viewer',
      'pt': 'Visualizador',
    },
    '7g5fvtiv': {
      'en': 'Please select...',
      'pt': 'Por favor selecione...',
    },
    'yszzomxi': {
      'en': 'Search for an item...',
      'pt': 'Pesquisar um item...',
    },
    'wl5lect6': {
      'en': 'Cancel',
      'pt': 'Cancelar',
    },
    'j7urjwc8': {
      'en': 'Send Invites',
      'pt': 'Enviar convites',
    },
  },
  // modal_enter_pin
  {
    'w63lhi44': {
      'en': 'Enter your PIN below',
      'pt': 'Insira seu PIN abaixo',
    },
    'cesy0qbp': {
      'en': 'Your project has been created, now invite your team to continue.',
      'pt': 'Seu projeto foi criado, agora convide sua equipe para continuar.',
    },
    'yan3zik2': {
      'en': 'Cancel',
      'pt': 'Cancelar',
    },
    'ia89k4mg': {
      'en': 'Verify Code',
      'pt': 'Verificar código',
    },
  },
  // modal_share_project
  {
    '4tx2ru39': {
      'en': 'Share your project',
      'pt': 'Compartilhe seu projeto',
    },
    'u6t74zsp': {
      'en': 'Your project has been created, now invite your team to continue.',
      'pt': 'Seu projeto foi criado, agora convide sua equipe para continuar.',
    },
    'a5x5r8z2': {
      'en': 'Randy Peterson',
      'pt': 'Randy Peterson',
    },
    '0hlgten0': {
      'en': 'name@domainname.com',
      'pt': 'nome@nomedodomínio.com',
    },
    'wfv5m0m2': {
      'en': 'Randy Peterson',
      'pt': 'Randy Peterson',
    },
    'z4rocyop': {
      'en': 'name@domainname.com',
      'pt': 'nome@nomedodomínio.com',
    },
    'f9bgnoni': {
      'en': 'Randy Peterson',
      'pt': 'Randy Peterson',
    },
    'bthcky9u': {
      'en': 'name@domainname.com',
      'pt': 'nome@nomedodomínio.com',
    },
    'pgq1r8ah': {
      'en': 'Add User',
      'pt': 'Adicionar usuário',
    },
    'x8i2mu80': {
      'en': 'Project Link',
      'pt': 'Link do Projeto',
    },
    'jzdr6k9x': {
      'en': 'https://project.flutterflow.io/?quizRef=T7c8mXvkYFFCWjqyhxKe',
      'pt': 'https://project.flutterflow.io/?quizRef=T7c8mXvkYFFCWjqyhxKe',
    },
    'jz45d8an': {
      'en': 'Cancel',
      'pt': 'Cancelar',
    },
    'ubopypxm': {
      'en': 'Send Invites',
      'pt': 'Enviar convites',
    },
  },
  // modal_add_users_list
  {
    'u8eoldhj': {
      'en': 'Invite your Team',
      'pt': 'Convide sua equipe',
    },
    'z2uzep65': {
      'en': 'Your project has been created, now invite your team to continue.',
      'pt': 'Seu projeto foi criado, agora convide sua equipe para continuar.',
    },
    'dlpajrga': {
      'en': 'Email address...',
      'pt': 'Endereço de email...',
    },
    'timt0a9e': {
      'en': 'email@domainname.com',
      'pt': 'email@nomedodomínio.com',
    },
    'haz2ntfz': {
      'en': 'email@domainname.com',
      'pt': 'email@nomedodomínio.com',
    },
    'd9dnbwow': {
      'en': 'Cancel',
      'pt': 'Cancelar',
    },
    'wezgwiac': {
      'en': 'Send Invites',
      'pt': 'Enviar convites',
    },
  },
  // modal_profile_details
  {
    'xt43uwzp': {
      'en': 'Profile Details',
      'pt': 'Detalhes do perfil',
    },
    '9ren6rbd': {
      'en': 'Below are your profile details',
      'pt': 'Abaixo estão os detalhes do seu perfil',
    },
    'izapnzh1': {
      'en': 'Randy Peterson',
      'pt': 'Randy Peterson',
    },
    '17qiejhp': {
      'en': 'name@domainname.com',
      'pt': 'nome@nomedodomínio.com',
    },
    '5bzj3jf4': {
      'en': 'Manage your account',
      'pt': 'Gerencie sua conta',
    },
    'x1e6b7y8': {
      'en': 'Edit Profile',
      'pt': 'Editar Perfil',
    },
    'nj27bwmg': {
      'en': 'Reset Password',
      'pt': 'Redefinir senha',
    },
    'wbiu740t': {
      'en': 'Light Mode',
      'pt': 'Modo de luz',
    },
    's5971e7s': {
      'en': 'Dark Mode',
      'pt': 'Modo escuro',
    },
    'n3qmt0u6': {
      'en': 'Get in Touch',
      'pt': 'Entre em contato',
    },
    'xp11z0da': {
      'en': 'Help & Support',
      'pt': 'Ajuda e Suporte',
    },
    'ufr3yhgk': {
      'en': 'Share [App Name]',
      'pt': 'Compartilhar [Nome do aplicativo]',
    },
    'riwckyhb': {
      'en': 'Close',
      'pt': 'Fechar',
    },
  },
  // modal_profile_edit_profile
  {
    '7zctnlpm': {
      'en': 'Edit Profile  (Now)',
      'pt': 'Editar Perfil (Atual)',
    },
    'r1bwui0z': {
      'en': 'Please enter the information below to edit the Profile.',
      'pt': 'Insira as informações abaixo para editar o Perfil.',
    },
    '99oumm34': {
      'en': 'Your Name',
      'pt': 'Seu nome',
    },
    '8gkrs3rw': {
      'en': 'Short Description',
      'pt': 'Descrição curta',
    },
    'nus7z38o': {
      'en': 'Alfabetizado',
      'pt': 'Alfabetizado',
    },
    'o7m2i6p2': {
      'en': 'illiterate',
      'pt': 'Não alfabetizado',
    },
    'l7wk3lrd': {
      'en': 'Completed elementary education',
      'pt': 'Ensino fundamental completo',
    },
    'qos44j9c': {
      'en': 'Completed high school',
      'pt': 'Ensino médio completo',
    },
    'heufihw9': {
      'en': 'Completed higher education',
      'pt': 'Ensino superior completo',
    },
    '49xtgad1': {
      'en': 'Incomplete elementary education',
      'pt': 'Ensino fundamental incompleto',
    },
    'y0ndai12': {
      'en': 'Incomplete high school',
      'pt': 'Ensino médio incompleto',
    },
    'vmuw50q5': {
      'en': 'Incomplete higher education',
      'pt': 'Ensino superior incompleto',
    },
    'jo2xcd1b': {
      'en': 'No information',
      'pt': 'Sem informação',
    },
    '3krya23z': {
      'en': 'Agency',
      'pt': 'Agência',
    },
    '65au9781': {
      'en': 'Agency',
      'pt': 'Agência',
    },
    'p1lquhce': {
      'en': 'The email associated with this account is:',
      'pt': 'O e-mail associado a esta conta é:',
    },
    'fyuvtufe': {
      'en': 'Created On:',
      'pt': 'Criado em:',
    },
    'h4jwedag': {
      'en': 'Last Active:',
      'pt': 'Última atividade:',
    },
    '27w5o6gn': {
      'en': 'Cancel',
      'pt': 'Cancelar',
    },
    'gz2xhplu': {
      'en': 'Save Changes',
      'pt': 'Salvar alterações',
    },
  },
  // modal_faccao_edit
  {
    'ze3l1q4r': {
      'en': 'Edit Faction',
      'pt': 'Editar Facção',
    },
    '7tuc4kk2': {
      'en': 'Please enter the information below to edit a Faction.',
      'pt': 'Insira as informações abaixo para editar uma Facção.',
    },
    'xscprapi': {
      'en': 'Update foto',
      'pt': 'Atararr foto',
    },
    'rq3zqf7i': {
      'en': 'Nome da facção',
      'pt': 'Nome da facção',
    },
    '2huj2jzx': {
      'en': 'Faction Name',
      'pt': 'Nome da Facção',
    },
    '0lr3g0go': {
      'en': 'Descrição ou Biografia',
      'pt': 'Descrição ou Biografia',
    },
    'krgsdp6s': {
      'en': 'Description here...',
      'pt': 'Descrição aqui...',
    },
    'ntyay3mi': {
      'en': 'Save',
      'pt': 'Salvar',
    },
    'yg28k56i': {
      'en': 'Please enter a project name...',
      'pt': 'Por favor, insira um nome de projeto...',
    },
    '59ol7bwt': {
      'en': 'Please choose an option from the dropdown',
      'pt': 'Selecione uma opção no menu suspenso',
    },
    'fwvtuuff': {
      'en': 'Please enter a short description...',
      'pt': 'Insira uma breve descrição...',
    },
    '9bj3lmc0': {
      'en': 'Please choose an option from the dropdown',
      'pt': 'Selecione uma opção no menu suspenso',
    },
  },
  // dropdown_member_edit
  {
    'u54lnftd': {
      'en': 'Options',
      'pt': 'Opções',
    },
    '3mts0ojl': {
      'en': 'Edit',
      'pt': 'Editar',
    },
    'bxwf45ar': {
      'en': 'View',
      'pt': 'Visualizar',
    },
    '9sla7wvn': {
      'en': 'Share',
      'pt': 'Compartilhar',
    },
    '4nzsvalr': {
      'en': 'Delete',
      'pt': 'Excluir',
    },
  },
  // dropdown_faccao_edit
  {
    '0rwad3cv': {
      'en': 'Options',
      'pt': 'Opções',
    },
    'vh5aos42': {
      'en': 'Edit',
      'pt': 'Editar',
    },
    '27xaiak4': {
      'en': 'Viewe',
      'pt': 'Ver',
    },
    'kp1omh4j': {
      'en': 'Share',
      'pt': 'Compartilhar',
    },
    'vu30hinr': {
      'en': 'Delete',
      'pt': 'Excluir',
    },
  },
  // modal_app_bar
  {
    'qxwj6eeq': {
      'en': 'Add Member',
      'pt': 'Adicionar membro',
    },
  },
  // modal_profile_edit_admin
  {
    'zy7fzru7': {
      'en': 'Edit Profile (Administration)',
      'pt': 'Editar Perfil (Administração)',
    },
    'hpa704ph': {
      'en': 'Please enter the information below to edit the Profile.',
      'pt': 'Insira as informações abaixo para editar o Perfil.',
    },
    'vc3a6nos': {
      'en': 'Your Name',
      'pt': 'Seu nome',
    },
    'pfhfmd7v': {
      'en': 'Short Description',
      'pt': 'Descrição curta',
    },
    '0hv6f27h': {
      'en': 'Alfabetizado',
      'pt': 'Alfabetizado',
    },
    'jaq1pg5i': {
      'en': 'illiterate',
      'pt': 'Não alfabetizado',
    },
    'xkozcld7': {
      'en': 'Completed elementary education',
      'pt': 'Ensino fundamental completo',
    },
    '0amisaxj': {
      'en': 'Completed high school',
      'pt': 'Ensino médio completo',
    },
    '3x5xz1gl': {
      'en': 'Completed higher education',
      'pt': 'Ensino superior completo',
    },
    'p688eovk': {
      'en': 'Incomplete elementary education',
      'pt': 'Ensino fundamental incompleto',
    },
    '9lucsqoc': {
      'en': 'Incomplete high school',
      'pt': 'Ensino médio incompleto',
    },
    'tirtb0ds': {
      'en': 'Incomplete higher education',
      'pt': 'Ensino superior incompleto',
    },
    'ru0e2ck4': {
      'en': 'No information',
      'pt': 'Sem informação',
    },
    '81ibx6co': {
      'en': 'Agency',
      'pt': 'Agência',
    },
    'o5rqoote': {
      'en': 'Agency',
      'pt': 'Agência',
    },
    'orq2ygjx': {
      'en': 'The email associated with this account is:',
      'pt': 'O e-mail associado a esta conta é:',
    },
    '9klcab1x': {
      'en': 'Created On:',
      'pt': 'Criado em:',
    },
    'iz396jj1': {
      'en': 'Last Active:',
      'pt': 'Última atividade:',
    },
    '75bhewl8': {
      'en': 'Cancel',
      'pt': 'Cancelar',
    },
    'djvkekt3': {
      'en': 'Save Changes',
      'pt': 'Salvar alterações',
    },
  },
  // modal_agencia_pesquisa
  {
    'kgdwkq27': {
      'en': 'Select your agency',
      'pt': 'Selecione sua agência',
    },
    'gcsoddpb': {
      'en': 'Search for your intelligence agency below',
      'pt': 'Procure abaixo sua agência de inteligência',
    },
    'ibal8767': {
      'en': 'Search members...',
      'pt': 'Pesquisar membros...',
    },
    'yqk8o466': {
      'en': '',
      'pt': '',
    },
    '8j1rka5p': {
      'en': '',
      'pt': '',
    },
    'p38jip18': {
      'en': 'Save',
      'pt': 'Salvar',
    },
  },
  // modal_message_ok
  {
    'rjc9v8pq': {
      'en': 'Congratulations!',
      'pt': 'Parabéns!',
    },
    'o51mvnhm': {
      'en':
          'Registration completed SUCCESSFULLY!!! \nWait for approval from your agency\'s Manager.',
      'pt':
          'Cadastro realizado com SUCESSO !!! \n\nAguarde liberação do Gestor de sua agência.',
    },
    'khrk3bz2': {
      'en': 'Ok',
      'pt': 'Ok',
    },
  },
  // TagsLabels
  {
    'e6lp9ftz': {
      'en': '#website',
      'pt': '#site',
    },
    '4yftwnmx': {
      'en': '#ux',
      'pt': '#ux',
    },
    'kcyxvmvp': {
      'en': '#flutterflow',
      'pt': '#flutterflow',
    },
  },
  // Toast01
  {
    'i5mt0ma9': {
      'en': 'Notification Title',
      'pt': 'Título da notificação',
    },
    'o0kn8k8l': {
      'en': 'Some body copy that is present in this small notification.',
      'pt':
          'Alguma cópia do corpo que está presente nesta pequena notificação.',
    },
  },
  // Toast04
  {
    'ozz9h0eu': {
      'en': 'Notification Title',
      'pt': 'Título da notificação',
    },
    'a87zklx8': {
      'en': 'Some body copy that is present in this small notification.',
      'pt':
          'Alguma cópia do corpo que está presente nesta pequena notificação.',
    },
  },
  // Toast02
  {
    'rve5awza': {
      'en': 'Notification Title',
      'pt': 'Título da notificação',
    },
    'u3tbuddm': {
      'en': 'Some body copy that is present in this small notification.',
      'pt':
          'Alguma cópia do corpo que está presente nesta pequena notificação.',
    },
  },
  // Toast03
  {
    'm0rvoply': {
      'en': 'Notification Title',
      'pt': 'Título da notificação',
    },
    'bxe9e2xt': {
      'en': 'Some body copy that is present in this small notification.',
      'pt':
          'Alguma cópia do corpo que está presente nesta pequena notificação.',
    },
  },
  // Miscellaneous
  {
    '0nwoj0kc': {
      'en': 'Email address',
      'pt': 'Endereço de email',
    },
    'upni203i': {
      'en': 'Password',
      'pt': 'Senha',
    },
    'x5hsigqw': {
      'en': 'Button',
      'pt': 'Botão',
    },
    '9wy77t9v': {
      'en': 'Button',
      'pt': 'Botão',
    },
    'woezzutp': {
      'en': 'Button',
      'pt': 'Botão',
    },
    '2bj20mi4': {
      'en': 'Button',
      'pt': 'Botão',
    },
    'oztjr3ws': {
      'en': 'Button',
      'pt': 'Botão',
    },
    'hc87g50d': {
      'en': 'Button',
      'pt': 'Botão',
    },
    '8ct6cr3a': {
      'en': 'Button',
      'pt': 'Botão',
    },
    'e368pegn': {
      'en': 'Button',
      'pt': 'Botão',
    },
    'yv65a6i5': {
      'en': 'Button',
      'pt': 'Botão',
    },
    '4r7kaahz': {
      'en': 'Calling',
      'pt': 'Chamando',
    },
    '9zk4wopm': {
      'en': 'Not Called',
      'pt': 'Não chamado',
    },
    'xn2fkope': {
      'en': 'Pending Review',
      'pt': 'Revisão pendente',
    },
    'jv85czds': {
      'en': 'Closed',
      'pt': 'Fechado',
    },
    'swt4x372': {
      'en': 'Completed',
      'pt': 'Concluído',
    },
    '5w6ne1dl': {
      'en': 'Please select...',
      'pt': 'Por favor selecione...',
    },
    'uhfmgei0': {
      'en': 'Search for an item...',
      'pt': 'Pesquisar um item...',
    },
    'lted0txl': {
      'en': 'All',
      'pt': 'Todos',
    },
    'm6iqz668': {
      'en': 'Pending',
      'pt': 'Pendente',
    },
    'x2pvxk5r': {
      'en': 'Completed',
      'pt': 'Concluído',
    },
    'txjoh349': {
      'en': 'Calling',
      'pt': 'Chamando',
    },
    'qube3xir': {
      'en': 'All',
      'pt': 'Todos',
    },
    'mxalfkji': {
      'en': '50%',
      'pt': '50%',
    },
    'z6o24u9q': {
      'en': 'Notifications',
      'pt': 'Notificações',
    },
    'poegde7v': {
      'en': 'Notifications',
      'pt': 'Notificações',
    },
    'v3vjad01': {
      'en': 'Turn on notifications',
      'pt': 'Ativar notificações',
    },
    'bqjgqich': {
      'en': 'Male',
      'pt': 'Macho',
    },
    'rzl2h9ar': {
      'en': 'Female',
      'pt': 'Fêmea',
    },
    'qtchqf19': {
      'en': 'Other',
      'pt': 'Outro',
    },
    '82a75t5n': {
      'en': 'Design',
      'pt': 'Projeto',
    },
    'w82xuklg': {
      'en': 'Marketing',
      'pt': 'Marketing',
    },
    '5uiyxwtk': {
      'en': 'Development',
      'pt': 'Desenvolvimento',
    },
    '3wjkerx7': {
      'en': 'Management',
      'pt': 'Gerenciamento',
    },
    'p6rgfj1v': {
      'en': 'Operations',
      'pt': 'Operações',
    },
    'c8uww550': {
      'en': 'Customer Service',
      'pt': 'Atendimento ao Cliente',
    },
    '2rhm2suy': {
      'en': 'Design',
      'pt': 'Projeto',
    },
    'r7nbw4y6': {
      'en': 'Button',
      'pt': 'Botão',
    },
    'pog1sboe': {
      'en': 'Button',
      'pt': 'Botão',
    },
    'lrdd3chp': {
      'en': 'Button',
      'pt': 'Botão',
    },
    'hxsxj681': {
      'en': '',
      'pt':
          'Para tirar uma foto ou gravar um vídeo, este aplicativo requer permissão para acessar a câmera.',
    },
    'e7agr7ys': {
      'en': '',
      'pt':
          'Para carregar dados, este aplicativo requer permissão para acessar a biblioteca de fotos.',
    },
    '65e2tfs2': {
      'en': '',
      'pt': 'Aconteceu um Erro: [error]',
    },
    'ddazihx4': {
      'en': '',
      'pt': 'Seu email de redefinição de senha foi enviado!',
    },
    'db03cpjj': {
      'en': '',
      'pt': 'Requer o email.',
    },
    'fdb9078p': {
      'en': '',
      'pt': 'Número do telefone requerido.',
    },
    '80ouzj9q': {
      'en': '',
      'pt': 'Senha incorreta.',
    },
    '6rzhptp9': {
      'en': '',
      'pt': 'Digite o código de verificação no SMS.',
    },
    'ce8c4ty0': {
      'en': '',
      'pt':
          'Já foi muito tempo desde o último login. Entre novamente antes de excluir sua conta.',
    },
    'ehb9j2eu': {
      'en': '',
      'pt':
          'Já foi muito tempo desde o último login. Entre novamente antes de atualizar seu e-mail.',
    },
    '91bvb462': {
      'en': '',
      'pt': 'E-mail de confirmação de alteração de e-mail enviado!',
    },
    'hirpbigs': {
      'en': '',
      'pt': 'Este email já esta em uso por outra conta.',
    },
    'wj8451yf': {
      'en': '',
      'pt':
          'Sua credencal de acesso fornecida está incorreta, mal informada ou expirou.',
    },
    'kcvqa08x': {
      'en': '',
      'pt': 'Formato de arquivo inválido',
    },
    'dqrzd6sq': {
      'en': '',
      'pt': 'Baixando arquivo ...',
    },
    'dpqtohyf': {
      'en': '',
      'pt': 'Sucesso !',
    },
    'v01vf71s': {
      'en': '',
      'pt': 'Failha ao fazer o Upload do dado',
    },
    'gcv6def1': {
      'en': '',
      'pt': '',
    },
    'um9es99m': {
      'en': '',
      'pt': 'Escolha a fonte',
    },
    'o4enbz4j': {
      'en': '',
      'pt': 'Galéria ',
    },
    '8z4tvfh7': {
      'en': '',
      'pt': 'Galéria (Foto)',
    },
    '2ybzla8x': {
      'en': '',
      'pt': 'Galéria (Vídeo)',
    },
    'd1wdf5i1': {
      'en': '',
      'pt': 'Câmera',
    },
    'f4rdu9en': {
      'en': '',
      'pt': '',
    },
    '2py80kgi': {
      'en': '',
      'pt': '',
    },
    'p6lsrh2a': {
      'en': '',
      'pt': '',
    },
    'ne8cclp9': {
      'en': '',
      'pt': '',
    },
  },
].reduce((a, b) => a..addAll(b));
