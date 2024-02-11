import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['pt', 'en', 'es'];

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
    String? ptText = '',
    String? enText = '',
    String? esText = '',
  }) =>
      [ptText, enText, esText][languageIndex] ?? '';

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

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

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

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // Home
  {
    '1k9ztrvr': {
      'pt': 'Seja Bem Vindo ao',
      'en': 'Botonista Universe',
      'es': 'Universo Botonista',
    },
    's75r45ko': {
      'pt': 'Universo Botonista',
      'en': 'Botonista Universe',
      'es': 'Universo Botonista',
    },
    'yia63owm': {
      'pt': 'Entre no Aplicativo',
      'en': 'Enter the Application',
      'es': 'Ingrese a la aplicación',
    },
    'dlr4jd01': {
      'pt': 'Home',
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // Modalidade
  {
    'tqxvlr38': {
      'pt': 'Modalidades',
      'en': 'Modalities',
      'es': 'Modalidades',
    },
    'xw0vgaaz': {
      'pt': 'Cadastro de Modalidades',
      'en': 'Registration of Modalities',
      'es': 'Registro de Modalidades',
    },
    '0yrrppn3': {
      'pt': 'Sequencia',
      'en': 'Sequence',
      'es': 'Secuencia',
    },
    'rr6w40if': {
      'pt': 'Cadastro de Sequencias',
      'en': 'Sequence Registration',
      'es': 'Registro de secuencia',
    },
    'f15tgt4y': {
      'pt': 'Gravar uma nova modalidade',
      'en': 'Record a new modality',
      'es': 'Grabar una nueva modalidad',
    },
    '6d19dvt2': {
      'pt': 'Modalidade',
      'en': 'Modality',
      'es': 'Modalidad',
    },
    'yl6454ps': {
      'pt': 'Home',
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // DrawerMenu
  {
    'fszlfdlj': {
      'pt': 'Expira:',
      'en': '',
      'es': '',
    },
    'uc7fj3xy': {
      'pt': 'Perfil',
      'en': 'Profile',
      'es': 'Perfil',
    },
    '0e5uegnl': {
      'pt': 'Novo Clube ou  Federação',
      'en': 'Clubs and Federations',
      'es': 'Clubes y Federaciones',
    },
    'zaoqes8e': {
      'pt': 'Sala de Troféus',
      'en': 'Clubs and Federations',
      'es': 'Clubes y Federaciones',
    },
    'tc9o3uh2': {
      'pt': 'Modalidades',
      'en': 'Modalities',
      'es': 'Modalidades',
    },
    'ou4sg45a': {
      'pt': 'Planos e Assinaturas',
      'en': 'Plans and Subscriptions',
      'es': 'Planes y Suscripciones',
    },
    'tuc8nf1w': {
      'pt': 'Entre em Contato',
      'en': 'Plans and Subscriptions',
      'es': 'Planes y Suscripciones',
    },
    'hldgu9z5': {
      'pt': 'Termos de Uso e Aceite',
      'en': 'Terms of Use and Acceptance',
      'es': 'Términos de uso y aceptación',
    },
    'b271qi4f': {
      'pt': 'Sair',
      'en': 'To go out',
      'es': 'Salir',
    },
    'l4ywv5k5': {
      'pt': 'Seja Bem Vindo!',
      'en': 'Welcome!',
      'es': '¡Sea bienvenido!',
    },
    '6pwhhym8': {
      'pt': 'UNIVERSO BOTONISTA',
      'en': 'BOTONIST UNIVERSE',
      'es': 'UNIVERSO BOTONISTA',
    },
    'xs33bsvo': {
      'pt': 'CAMPEONATOS',
      'en': 'CHAMPIONSHIPS',
      'es': 'CAMPEONATOS',
    },
    'ne6hbe16': {
      'pt': 'Crie, Acompanhe e Participe!',
      'en': 'Create, Track and Participate!',
      'es': '¡Crea, rastrea y participa!',
    },
    'iuv7bir5': {
      'pt': 'LIGAS & RANKING',
      'en': 'RANKING',
      'es': 'CLASIFICACIÓN',
    },
    '2j0n16k5': {
      'pt': 'Acompanhe o seu Desempenho!',
      'en': 'Track your performance!',
      'es': '¡Sigue tu rendimiento!',
    },
    'yd0tswq5': {
      'pt': 'ADMINISTRATIVO',
      'en': 'RANKING',
      'es': 'CLASIFICACIÓN',
    },
    'zjfyqqvm': {
      'pt': 'Federações, Clubes e Atletas!',
      'en': 'Track your performance!',
      'es': '¡Sigue tu rendimiento!',
    },
    'iho1dhgw': {
      'pt': 'Home',
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // Login
  {
    'wyov4i37': {
      'pt': 'Fazer Login',
      'en': 'Login',
      'es': 'Hacer login',
    },
    'vprtrguj': {
      'pt': 'E-mail',
      'en': 'Email',
      'es': 'Correo electrónico',
    },
    '1oy8qahr': {
      'pt': 'Digite seu e-mail',
      'en': 'Type your e-mail',
      'es': 'Escribe tu correo electrónico',
    },
    'cw2jpvlt': {
      'pt': 'Senha',
      'en': 'Password',
      'es': 'Contraseña',
    },
    'fnivln7g': {
      'pt': 'Digite sua senha',
      'en': 'Type your password',
      'es': 'Escribe tu contraseña',
    },
    '7r2ers7q': {
      'pt': 'Login',
      'en': 'Login',
      'es': 'Acceso',
    },
    '9avlltbj': {
      'pt': 'Esqueceu sua senha?',
      'en': 'Forgot your password?',
      'es': 'Olvidaste tu contraseña?',
    },
    'kstq5k29': {
      'pt': 'Entrar com sua conta social',
      'en': 'Log in with your social account',
      'es': 'Inicia sesión con tu cuenta social',
    },
    '8ru7vi4z': {
      'pt': 'Login com a sua conta Google',
      'en': 'Login with your Google account',
      'es': 'Inicia sesión con tu cuenta de Google',
    },
    'uzupyqm6': {
      'pt': 'Login com a sua conta Facebook',
      'en': 'Login with your Google account',
      'es': 'Inicia sesión con tu cuenta de Google',
    },
    'emohemv2': {
      'pt': 'Termos de Uso e Politica de Privacidade',
      'en': 'Terms of Use and Privacy Policy',
      'es': 'Términos de uso y política de privacidad',
    },
    '44wjcisa': {
      'pt': 'Fazer Cadastro',
      'en': 'Sign up',
      'es': 'Inscribirse',
    },
    '7frq6xp9': {
      'pt': 'E-mail',
      'en': 'Email',
      'es': 'Correo electrónico',
    },
    'q94u5e2u': {
      'pt': 'Digite e-mail valido',
      'en': 'Enter valid email',
      'es': 'Ingrese un email valido',
    },
    '743wuwb1': {
      'pt': 'Senha',
      'en': 'Password',
      'es': 'Contraseña',
    },
    'vgaj229n': {
      'pt': 'Digite sua Senha',
      'en': 'Type your password',
      'es': 'Escribe tu contraseña',
    },
    'r87r0yga': {
      'pt': 'Confirm Password',
      'en': 'Confirm Password',
      'es': 'confirmar Contraseña',
    },
    'wlno8mps': {
      'pt': 'Confirme sua senha',
      'en': 'Confirm your password',
      'es': 'Confirmar la contraseña',
    },
    '6xyfm8bm': {
      'pt':
          'Confirmo que li e aceito os termos de condições de uso do aplicativo.',
      'en':
          'I confirm that I have read and accept the application\'s terms of use.',
      'es':
          'Confirmo que he leído y acepto las condiciones de uso de la aplicación.',
    },
    'vocb0iba': {
      'pt': 'Termos de Uso e Politica de Privacidade',
      'en': 'Terms of Use and Privacy Policy',
      'es': 'Términos de uso y política de privacidad',
    },
    'v8h5ww4b': {
      'pt': 'Criar Conta',
      'en': 'Create an account',
      'es': 'Crea una cuenta',
    },
    'eh7huhzk': {
      'pt': 'Use uma conta social para criar sua conta',
      'en': 'Use a social account to create your account',
      'es': 'Utilice una cuenta social para crear su cuenta',
    },
    'sxq76m9c': {
      'pt': 'Entre com a sua conta Google',
      'en': 'Log in with your Google account',
      'es': 'Inicia sesión con tu cuenta de Google',
    },
    'jpxqg1ar': {
      'pt': 'Entre com a sua conta Facebook',
      'en': 'Log in with your Google account',
      'es': 'Inicia sesión con tu cuenta de Google',
    },
    'kijemz29': {
      'pt': 'Entrar no Aplicativo',
      'en': 'Login to the Application',
      'es': 'Inicie sesión en la aplicación',
    },
    'slbi2nmd': {
      'pt': 'Senha',
      'en': 'Password',
      'es': 'Contraseña',
    },
  },
  // ManutenoFederacoesClubes
  {
    '25ees8jy': {
      'pt': 'Federações',
      'en': 'Federations',
      'es': 'Federaciones',
    },
    '1vpxyfp1': {
      'pt': 'Atualizar Foto',
      'en': 'Update Photo',
      'es': 'Actualizar foto',
    },
    'uiqpucwr': {
      'pt': 'Federações',
      'en': 'Federations',
      'es': 'Federaciones',
    },
    'jdvskksm': {
      'pt': 'Cadastro de Federações',
      'en': 'Register of Federations',
      'es': 'Registro de Federaciones',
    },
    'q1lt4j6f': {
      'pt': 'UF',
      'en': 'UF',
      'es': 'UF',
    },
    'ko43b36r': {
      'pt': 'Unidade Federativa',
      'en': 'Federative unit',
      'es': 'Unidad federativa',
    },
    'y8bkt6w6': {
      'pt': 'É uma Federação ?',
      'en': 'Is it a Federation?',
      'es': '¿Es una Federación?',
    },
    'fa3g46gf': {
      'pt': 'Gravar uma nova Federação',
      'en': 'Save a new Federation',
      'es': 'Guardar una nueva Federación',
    },
    '1oynsmu1': {
      'pt': 'Clubes',
      'en': 'Clubs',
      'es': 'Clubs',
    },
    'trwie6we': {
      'pt': 'Atualizar Foto',
      'en': 'Update Photo',
      'es': 'Actualizar foto',
    },
    'yi7cj070': {
      'pt': 'Clubes',
      'en': 'Clubs',
      'es': 'Clubs',
    },
    'ku4u0e8p': {
      'pt': 'Cadastro de Clubes',
      'en': 'Club Registration',
      'es': 'Registro de clubes',
    },
    '25t8eybu': {
      'pt': 'Estado',
      'en': 'state',
      'es': 'estado',
    },
    '02bgspzr': {
      'pt': 'Unidade Federativa',
      'en': 'Federative unit',
      'es': 'Unidad federativa',
    },
    'aomleliy': {
      'pt': 'Gravar um novo Clube',
      'en': 'Record a new Club',
      'es': 'Graba un nuevo club',
    },
    'y6vb6soo': {
      'pt': 'Clubes e Federaçoes',
      'en': 'Clubs and Federations',
      'es': 'Clubes y Federaciones',
    },
    's2c5wiyy': {
      'pt': 'Home',
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // Participante
  {
    '0o06qk96': {
      'pt': 'Lista de Inscritos',
      'en': 'Registration List',
      'es': 'Lista de registro',
    },
    '4ert9b5k': {
      'pt': 'Cad User',
      'en': 'CadUser',
      'es': 'Usuario Cad',
    },
    'zvzfym9c': {
      'pt': 'Add User',
      'en': 'Add User',
      'es': 'Agregar usuario',
    },
    'w3ab3zgc': {
      'pt': 'Lista de Participantes',
      'en': 'List of participants',
      'es': 'Lista de participantes',
    },
    'wthqktea': {
      'pt': 'Participantes',
      'en': 'Participants',
      'es': 'Participantes',
    },
  },
  // Partidas
  {
    '3tjajvrh': {
      'pt': 'Fase:',
      'en': 'Phase:',
      'es': 'Fase:',
    },
    '4b6o7p23': {
      'pt': 'Rodada Nº: ',
      'en': 'Round No.:',
      'es': 'Ronda No.:',
    },
    '1dvhye2q': {
      'pt': 'Mesa Nº:',
      'en': 'Table No.:',
      'es': 'Tabla No.:',
    },
    'nd8ek9e9': {
      'pt': 'VS',
      'en': 'VS',
      'es': 'contra',
    },
    'iwi6hdgd': {
      'pt': 'Delete Jogos\n',
      'en': 'Delete Games',
      'es': 'Eliminar juegos',
    },
    '2dj5aff2': {
      'pt': 'Libera Sumula',
      'en': 'Start Games',
      'es': 'Iniciar juegos',
    },
    'bfruakq7': {
      'pt': 'Manutenção das Partidas',
      'en': 'Match Maintenance',
      'es': 'Mantenimiento del partido',
    },
    'l51o43fl': {
      'pt': 'Partidas',
      'en': 'Departures',
      'es': 'Salidas',
    },
  },
  // Sumula
  {
    '6hm3ani6': {
      'pt': 'Fase:',
      'en': 'Phase:',
      'es': 'Fase:',
    },
    'ljekrxyp': {
      'pt': 'Grupo:',
      'en': 'Group:',
      'es': 'Grupo:',
    },
    'fdyseolo': {
      'pt': 'Mesa Nº:',
      'en': 'Table No.:',
      'es': 'Tabla No.:',
    },
    'f46lf6ly': {
      'pt': 'Rodada Nº:',
      'en': 'Round No.:',
      'es': 'Ronda No.:',
    },
    'mkmps8c2': {
      'pt': 'Partida Realizada',
      'en': 'Match Played',
      'es': 'Partido jugado',
    },
    '9vryducp': {
      'pt': 'Placar',
      'en': 'Scoreboard',
      'es': 'Marcador',
    },
    'bvoefkfs': {
      'pt': 'calc',
      'en': 'calc',
      'es': 'cálculo',
    },
    'ou0or2cq': {
      'pt': 'VS',
      'en': 'VS',
      'es': 'contra',
    },
    'xzevq01p': {
      'pt': 'Quantidade de Jogos',
      'en': 'Number of Games',
      'es': 'Numero de juegos',
    },
    '8jmtb91m': {
      'pt': 'Pontos Ganhos',
      'en': 'Points Earned',
      'es': 'Puntos ganados',
    },
    'z2ne6v2z': {
      'pt': 'Vitórias',
      'en': 'Victories',
      'es': 'Victorias',
    },
    'k0qelo9t': {
      'pt': 'Empate',
      'en': 'A tie',
      'es': 'Un lazo',
    },
    'lgi15n2j': {
      'pt': 'Derrotas',
      'en': 'Defeats',
      'es': 'Derrotas',
    },
    '8rdo2jvt': {
      'pt': 'Gols Pró',
      'en': 'Pro Goals',
      'es': 'Objetivos profesionales',
    },
    '9tf69lbm': {
      'pt': 'Gols Contra',
      'en': 'Own Goals',
      'es': 'Metas propias',
    },
    'zdils7if': {
      'pt': 'Saldo Gols',
      'en': '',
      'es': '',
    },
    'f70fp528': {
      'pt': '% Aproveitamento',
      'en': '% Utilization',
      'es': '% Utilización',
    },
    'wnjjg4ty': {
      'pt': 'Colocação Atual no Grupo',
      'en': 'Current Group Placement',
      'es': 'Ubicación actual del grupo',
    },
    'mx9jjfkm': {
      'pt': 'Colocação Geral',
      'en': 'General Placement',
      'es': 'Colocación general',
    },
    's8j398nm': {
      'pt': 'Melhor colocado em grupos',
      'en': 'Best placed in groups',
      'es': 'Mejor ubicado en grupos',
    },
    'flajvoos': {
      'pt': 'Área exclusiva de Assinantes',
      'en': '',
      'es': '',
    },
    'flzxry5l': {
      'pt': 'Clique aqui e torne-se um Assinante',
      'en': '',
      'es': '',
    },
    'k8otir9b': {
      'pt':
          ' Torne-se um usuário Prata e tenha os beneficios de todas as funcionalidades e livre de anuncios.',
      'en': '',
      'es': '',
    },
    'wh4dkhl7': {
      'pt': 'Sumula individual',
      'en': 'Individual summary',
      'es': 'Resumen individual',
    },
    'z5z4y4q4': {
      'pt': 'Súmula',
      'en': 'Summary',
      'es': 'Resumen',
    },
  },
  // Endereco
  {
    'jfh23wzx': {
      'pt': 'Local Torneio',
      'en': 'Tournament Location',
      'es': 'Ubicación del torneo',
    },
    'kohfqq0m': {
      'pt': 'Home',
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // PlanodeAssinatura
  {
    '442q9euc': {
      'pt': 'Bronze',
      'en': 'Bronze',
      'es': 'Bronce',
    },
    'c747zlqf': {
      'pt':
          'Criação de Campeonatos\nAcompanhamento da  evolução  do  campeonato',
      'en':
          'Creation of Championships\nMonitoring the evolution of the championship',
      'es':
          'Creación de campeonatos\nSeguimiento de la evolución del campeonato',
    },
    'b4cw9c28': {
      'pt':
          'Criação de Torneios\nAcompanhamento da sua evolucao por campeonato.\nHistorico de Resultados por jogos\nPosicionamento em torneios\nAcompanhamento das evoluções em torneios\nLivre de anuncios\nCriação de Torneio Estadual e Nacional\nPosicionamento em torneios\nAcompanhamento das evoluções em torneios\n\n',
      'en':
          'Tournament Creation\nMonitoring your evolution by championship.\nHistory of results by games\nTournament placement\nMonitoring developments in tournaments\nAd-free\nCreation of State and National Tournament\nTournament placement\nMonitoring developments in tournaments',
      'es':
          'Creación de torneos\nSeguimiento de tu evolución por campeonato.\nHistorial de resultados por juegos.\nColocación del torneo\nSeguimiento de la evolución de los torneos.\nLibre de anuncios\nCreación de Torneo Estatal y Nacional\nColocación del torneo\nSeguimiento de la evolución de los torneos.',
    },
    'eiiswsbc': {
      'pt': 'Voce está no plano bronze!',
      'en': 'You are currently using the bronze plan!',
      'es': '¡Actualmente estás usando el plan bronce!',
    },
    'rbv8j0pa': {
      'pt': 'Continuar com Plano Bronze',
      'en': 'Continue with Bronze Plan',
      'es': 'Continuar con el Plan Bronce',
    },
    'xel8wdg6': {
      'pt': 'Prata',
      'en': 'Silver',
      'es': 'Plata',
    },
    'b67sxhik': {
      'pt': 'Somente para Atletas',
      'en': '',
      'es': '',
    },
    'mzvzqbyp': {
      'pt':
          'Criação de Campeonatos\nAcompanhamento da  evolução  do  campeonato\nCriação de Torneios\nAcompanhamento da sua evolucao por campeonato.\nHistorico de Resultados por jogos\nPosicionamento em torneios\nAcompanhamento das evoluções em torneios\nLivre de anuncios',
      'en':
          'Creation of Championships\nMonitoring the evolution of the championship\nTournament Creation\nMonitoring your evolution by championship.\nHistory of results by games\nTournament placement\nMonitoring developments in tournaments\nAd-free',
      'es':
          'Creación de campeonatos\nSeguimiento de la evolución del campeonato\nCreación de torneos\nSeguimiento de tu evolución por campeonato.\nHistorial de resultados por juegos.\nColocación del torneo\nSeguimiento de la evolución de los torneos.\nLibre de anuncios',
    },
    '8x5vkkbb': {
      'pt':
          'Criação de Torneio Estadual e Nacional\nPosicionamento em torneios\nAcompanhamento das evoluções em torneios\n\n',
      'en':
          'Creation of State and National Tournament\nTournament placement\nMonitoring developments in tournaments',
      'es':
          'Creación de Torneo Estatal y Nacional\nColocación del torneo\nSeguimiento de la evolución de los torneos.',
    },
    '36ncgk9e': {
      'pt': 'Mensal',
      'en': '',
      'es': '',
    },
    'uihkyxle': {
      'pt': 'Anual',
      'en': '',
      'es': '',
    },
    'bhe2kdgp': {
      'pt': 'Mensal',
      'en': '',
      'es': '',
    },
    'g0rakpw3': {
      'pt': 'Mensal ',
      'en': 'Monthly',
      'es': 'Mensual',
    },
    'wu1cr3qa': {
      'pt': 'R\$ 14,99',
      'en': 'R\$ 14.99',
      'es': '14,99 reales',
    },
    'gnuymgku': {
      'pt': 'Anual',
      'en': 'Yearly',
      'es': 'Anual',
    },
    'ytpybbtq': {
      'pt': 'R\$ 150,00',
      'en': 'R\$ 169.99',
      'es': 'R\$ 169,99',
    },
    'qh5i3j4y': {
      'pt': 'Aderir ao Plano Prata',
      'en': 'Join the Silver Plan',
      'es': 'Únete al Plan Plata',
    },
    '674csjua': {
      'pt': 'Ouro',
      'en': 'Gold',
      'es': 'Oro',
    },
    '66wfe48g': {
      'pt': 'Somente para Federações e Ligas',
      'en': '',
      'es': '',
    },
    'wyuj0u1n': {
      'pt': 'Sua Federação é a ;',
      'en': '',
      'es': '',
    },
    '5a1hqnfd': {
      'pt':
          'Criação de Campeonatos\nAcompanhamento da  evolução  do  campeonato\nCriação de Torneios\nAcompanhamento da sua evolucao por campeonato.\nHistorico de Resultados por jogos\nPosicionamento em torneios\nAcompanhamento das evoluções em torneios\nLivre de anuncios\nCriação de Torneio Estadual e Nacional\nPosicionamento em torneios\nAcompanhamento das evoluções em torneios\nAdministração Atletas',
      'en':
          'Creation of Championships\nMonitoring the evolution of the championship\nTournament Creation\nMonitoring your evolution by championship.\nHistory of results by games\nTournament placement\nMonitoring developments in tournaments\nAd-free\nCreation of State and National Tournament\nTournament placement\nMonitoring developments in tournaments',
      'es':
          'Creación de campeonatos\nSeguimiento de la evolución del campeonato\nCreación de torneos\nSeguimiento de tu evolución por campeonato.\nHistorial de resultados por juegos.\nColocación del torneo\nSeguimiento de la evolución de los torneos.\nLibre de anuncios\nCreación de Torneo Estatal y Nacional\nColocación del torneo\nSeguimiento de la evolución de los torneos.',
    },
    '8by4q6tt': {
      'pt': 'Custo Mensal  de  R\$ 24,99\nCusto Anual de  R\$ 250,00',
      'en': 'Monthly cost of R\$25.99\nAnnual cost of R\$250.00',
      'es': 'Costo mensual de R\$ 25,99\nCosto anual de R\$ 250,00',
    },
    'uy5cnowm': {
      'pt': 'Aderir ao Plano Ouro',
      'en': 'Join the Gold Plan',
      'es': 'Únete al Plan Oro',
    },
    'xscf53pd': {
      'pt': 'Voce não associado a uma federação',
      'en': '',
      'es': '',
    },
    'u3a92i2u': {
      'pt': 'Planos e Assinaturas',
      'en': 'Signature',
      'es': 'Firma',
    },
    '99qk75s5': {
      'pt': 'Home',
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // SeuUniverso
  {
    'pgyg240t': {
      'pt': 'Atualizar Foto',
      'en': 'Update Photo',
      'es': 'Actualizar foto',
    },
    'xaif4foc': {
      'pt': 'Nome',
      'en': 'Name',
      'es': 'Nombre',
    },
    '2c0xw3w5': {
      'pt': 'Digite seu Nome',
      'en': 'Type your name',
      'es': 'Escriba su nombre',
    },
    'gmwzyavx': {
      'pt': 'Apelido',
      'en': 'Surname',
      'es': 'Apellido',
    },
    '9xuq1902': {
      'pt': 'Digite seu Apelido',
      'en': 'Enter your Nickname',
      'es': 'Ingresa tu alias',
    },
    'blyzoe21': {
      'pt': 'Data Nasc:',
      'en': '',
      'es': '',
    },
    '13rspcnh': {
      'pt': 'Salvar Dados Complementar',
      'en': 'Save Supplementary Data',
      'es': 'Guardar datos complementarios',
    },
    'nqxmxj27': {
      'pt': 'Altere Seu Universo',
      'en': 'Change Your Universe',
      'es': 'Cambia tu universo',
    },
    'vm6afiq2': {
      'pt': 'Home',
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // NewChampion
  {
    'eh13oyhn': {
      'pt': '',
      'en': '',
      'es': '',
    },
    '8p1zoh8m': {
      'pt': 'Nome do Campeonato',
      'en': 'Championship Name',
      'es': 'Nombre del campeonato',
    },
    '9x0ij5m3': {
      'pt': 'Qual Data e Hora para inicio?',
      'en': '',
      'es': '',
    },
    'w4b9d7wy': {
      'pt': 'Regra',
      'en': 'Modality',
      'es': 'Modalidad',
    },
    'qtq21503': {
      'pt': 'Search for an item...',
      'en': 'Search for an item...',
      'es': 'Buscar un artículo...',
    },
    '1vd542jm': {
      'pt': 'Treino',
      'en': 'Training',
      'es': 'Capacitación',
    },
    '5jn7uloj': {
      'pt': 'Aberto',
      'en': 'Open',
      'es': 'Abierto',
    },
    'pzgnqvkh': {
      'pt': 'Torneio Aberto',
      'en': 'Open Tournament',
      'es': 'Torneo abierto',
    },
    'vxagv1sb': {
      'pt': 'Torneio Regional',
      'en': 'Regional Tournament',
      'es': 'Torneo Regional',
    },
    'p1nq914b': {
      'pt': 'Torneio Nacional',
      'en': 'National Tournament',
      'es': 'Torneo Nacional',
    },
    'e6lmteiv': {
      'pt': 'Torneio tipo',
      'en': 'Type tournament',
      'es': 'Tipo torneo',
    },
    'femj5atw': {
      'pt': 'Search for an item...',
      'en': 'Search for an item...',
      'es': 'Buscar un artículo...',
    },
    'dtcruegg': {
      'pt': 'Individual',
      'en': 'Individual',
      'es': 'Individual',
    },
    'rrye1ot7': {
      'pt': 'Equipe',
      'en': 'Team',
      'es': 'Equipo',
    },
    'cix0sm9c': {
      'pt': 'Participação',
      'en': 'Participation',
      'es': 'Participación',
    },
    'xbgpcp6a': {
      'pt': 'Search for an item...',
      'en': 'Search for an item...',
      'es': 'Buscar un artículo...',
    },
    'vhrkng38': {
      'pt': 'Número de  Convidados',
      'en': 'Number of Guests',
      'es': 'Número de invitados',
    },
    'pz3k08fi': {
      'pt': 'Convidados',
      'en': '',
      'es': '',
    },
    's9oye5ib': {
      'pt': '2',
      'en': '',
      'es': '',
    },
    '8gjb3v65': {
      'pt': 'Endereço',
      'en': 'Address',
      'es': 'DIRECCIÓN',
    },
    'y53410o8': {
      'pt': 'Observação',
      'en': 'Observation',
      'es': 'Observación',
    },
    '4ziat3z4': {
      'pt': '',
      'en': '',
      'es': '',
    },
    'mcmnj2sd': {
      'pt': 'Atualizar Foto',
      'en': 'Update Photo',
      'es': 'Actualizar foto',
    },
    'sbjya4l2': {
      'pt': 'Gravar Campeonato',
      'en': 'Record Championship',
      'es': 'Campeonato récord',
    },
    'jn5dvvo1': {
      'pt': 'Novo Campeonato',
      'en': 'New Championship',
      'es': 'Nuevo campeonato',
    },
    'svc8gf5u': {
      'pt': 'Agenda',
      'en': 'Schedule',
      'es': 'Cronograma',
    },
  },
  // ModifyCampeonato
  {
    'zyieh3w9': {
      'pt': '',
      'en': '',
      'es': '',
    },
    '1gugxuud': {
      'pt': 'Nome do Campeonato',
      'en': 'Championship Name',
      'es': 'Nombre del campeonato',
    },
    'vmr506cn': {
      'pt': 'Regra',
      'en': 'Modality',
      'es': 'Modalidad',
    },
    '5w6rdw3x': {
      'pt': 'Search for an item...',
      'en': 'Search for an item...',
      'es': 'Buscar un artículo...',
    },
    'p65wu2x9': {
      'pt': 'Treino',
      'en': 'Training',
      'es': 'Capacitación',
    },
    '27jexoa3': {
      'pt': 'Aberto',
      'en': 'Open',
      'es': 'Abierto',
    },
    '0u41kv0w': {
      'pt': 'Torneio Aberto',
      'en': 'Tournament',
      'es': 'Torneo',
    },
    'fenps578': {
      'pt': 'Torneio Regional',
      'en': 'Regional Tournament',
      'es': 'Torneo Regional',
    },
    'eeo141os': {
      'pt': 'Torneio Nacional',
      'en': 'National Tournament',
      'es': 'Torneo Nacional',
    },
    '97qpau2j': {
      'pt': 'Torneio tipo:',
      'en': 'Tournament type:',
      'es': 'Tipo de torneo:',
    },
    'goa8zhq3': {
      'pt': 'Search for an item...',
      'en': 'Search for an item...',
      'es': 'Buscar un artículo...',
    },
    'n1ysryta': {
      'pt': 'Individual',
      'en': 'Individual',
      'es': 'Individual',
    },
    'aq0zkg2k': {
      'pt': 'Equipe',
      'en': 'Team',
      'es': 'Equipo',
    },
    'wyk8trdu': {
      'pt': 'Participação',
      'en': 'Participation',
      'es': 'Participación',
    },
    'm8vi91e1': {
      'pt': 'Search for an item...',
      'en': 'Search for an item...',
      'es': 'Buscar un artículo...',
    },
    'up8ip3zh': {
      'pt': 'Nº de  Convidados',
      'en': 'Number of Guests',
      'es': 'Número de invitados',
    },
    'b3i2ntkc': {
      'pt': 'Endereço',
      'en': 'Address',
      'es': 'DIRECCIÓN',
    },
    'jqi9rsd1': {
      'pt': 'Observação',
      'en': 'Observation',
      'es': 'Observación',
    },
    'jbyjgvtz': {
      'pt': '',
      'en': '',
      'es': '',
    },
    'musybp35': {
      'pt': 'Atualizar Foto',
      'en': 'Update Photo',
      'es': 'Actualizar foto',
    },
    '2allksvy': {
      'pt': 'Salvar Alterações do Campeonato',
      'en': 'Save Championship Changes',
      'es': 'Guardar cambios de campeonato',
    },
    'juo9s01b': {
      'pt': 'Manutenção Campeonato',
      'en': 'Championship Maintenance',
      'es': 'Mantenimiento del campeonato',
    },
    'pwuoh21x': {
      'pt': 'Agenda',
      'en': 'Schedule',
      'es': 'Cronograma',
    },
  },
  // Termos
  {
    'nvadw14r': {
      'pt': 'Termos de Uso e Privacidade',
      'en': 'Terms of Use and Privacy',
      'es': 'Términos de uso y privacidad',
    },
    'i5e6to6q': {
      'pt': 'Termo de Uso',
      'en': 'Terms of use',
      'es': 'Condiciones de uso',
    },
    'f6okcvfj': {
      'pt': 'Termo de Uso',
      'en': 'Terms of use',
      'es': 'Condiciones de uso',
    },
    'asn9ys6h': {
      'pt': 'Politica de Privacidade',
      'en': 'Privacy Policy',
      'es': 'Política de privacidad',
    },
    'uz74vi7d': {
      'pt': 'Politica de Privacidade',
      'en': 'Privacy Policy',
      'es': 'Política de privacidad',
    },
    'tp8tzcbh': {
      'pt': 'Home',
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // federacoes
  {
    'o1ntog3v': {
      'pt': 'Faça sua pesquisa!',
      'en': 'Do your research!',
      'es': '¡Haz tu investigación!',
    },
    '8t02xm0k': {
      'pt': 'Option 1',
      'en': 'Option 1',
      'es': 'Opción 1',
    },
    'mrnhsi7a': {
      'pt': 'Resultado da sua pesquisa',
      'en': 'Your search result',
      'es': 'El resultado de tu búsqueda',
    },
    '8fe0y80a': {
      'pt': 'Federações',
      'en': 'Federations',
      'es': 'Federaciones',
    },
    'hu0onpt9': {
      'pt': 'Home',
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // Tabela
  {
    '9yu2b88c': {
      'pt': 'Geração Tabelas',
      'en': 'Table Generation',
      'es': 'Generación de tablas',
    },
    'x64r1vyw': {
      'pt': 'Nome da Fase',
      'en': 'Phase Name',
      'es': 'Nombre de fase',
    },
    '86x80b1n': {
      'pt': 'Fase 1',
      'en': 'Phase 1',
      'es': 'Fase 1',
    },
    'lblmiffj': {
      'pt': 'Qtd. grupos: ',
      'en': 'Number of groups:',
      'es': 'Número de grupos:',
    },
    'rsu7mje5': {
      'pt': 'Criar',
      'en': 'To create',
      'es': 'Crear',
    },
    'sfh9cz6p': {
      'pt': 'Classificação',
      'en': 'Classification',
      'es': 'Clasificación',
    },
    'ynwu4gdd': {
      'pt': 'PTS',
      'en': 'PTS',
      'es': 'PTS',
    },
    '17xafvdb': {
      'pt': 'PJ',
      'en': 'P.J.',
      'es': 'P.J.',
    },
    'f6pu05r3': {
      'pt': 'VIT',
      'en': 'VIT',
      'es': 'VIT',
    },
    'je34foz6': {
      'pt': 'EMP',
      'en': 'EMP',
      'es': 'PEM',
    },
    'ovshd8az': {
      'pt': 'DER',
      'en': 'DER',
      'es': 'DER',
    },
    'kaqlxin1': {
      'pt': 'GP',
      'en': 'GP',
      'es': 'médico de cabecera',
    },
    '6ayc7n4v': {
      'pt': 'GC',
      'en': 'GC',
      'es': 'GC',
    },
    'ocfmd0xf': {
      'pt': 'SDG',
      'en': 'SDG',
      'es': 'ODS',
    },
    '3favohd0': {
      'pt': 'CG',
      'en': 'CG',
      'es': 'CG',
    },
    'lecimz4w': {
      'pt': 'MCG',
      'en': 'MCG',
      'es': 'MCG',
    },
    'e5po9p93': {
      'pt': '%',
      'en': '%',
      'es': '%',
    },
    'w30van8c': {
      'pt': 'Fases e Grupos',
      'en': 'Phases and Groups',
      'es': 'Fases y Grupos',
    },
  },
  // ConsultaChampion
  {
    'qcy4dqzb': {
      'pt': 'Painel de Campeonatos',
      'en': 'Championships Panel',
      'es': 'Panel de campeonatos',
    },
    '4l3e8egn': {
      'pt': 'Andamento',
      'en': '',
      'es': '',
    },
    'n9hwtx4g': {
      'pt': 'Option 1',
      'en': '',
      'es': '',
    },
    'ke8jhx7y': {
      'pt': 'Consulte uma Federação?',
      'en': '',
      'es': '',
    },
    'ng9likdz': {
      'pt': 'Search for an item...',
      'en': '',
      'es': '',
    },
    'm6fs2ia0': {
      'pt': 'Todos',
      'en': '',
      'es': '',
    },
    'x70nkh6z': {
      'pt': '/',
      'en': '/',
      'es': '/',
    },
    'jl3h5w8d': {
      'pt': 'Local',
      'en': 'Local',
      'es': 'Local',
    },
    'afa0vvkp': {
      'pt': 'Modificar',
      'en': 'Modify',
      'es': 'Modificar',
    },
    'iowgnlcg': {
      'pt': 'Excluir',
      'en': 'Delete',
      'es': 'Borrar',
    },
    'pnax768q': {
      'pt': 'Abrir Ins',
      'en': 'Open Ins',
      'es': 'Abierto',
    },
    'td1w2t9q': {
      'pt': 'Confirme',
      'en': 'Confirm',
      'es': 'Confirmar',
    },
    '8ncn7b73': {
      'pt': 'Tabela',
      'en': 'Table',
      'es': 'Tabla',
    },
    'h2c6cjw9': {
      'pt': 'Jogos',
      'en': 'Games',
      'es': 'Juegos',
    },
    'ryppdphl': {
      'pt': 'Sumula',
      'en': 'Summary',
      'es': 'Resumen',
    },
    '3stim9b9': {
      'pt': 'Desemp',
      'en': 'Performance',
      'es': 'Actuación',
    },
    '5z7iazlf': {
      'pt': 'Final',
      'en': 'Final',
      'es': 'Final',
    },
    'kwcpvy51': {
      'pt': 'Informe',
      'en': 'TV',
      'es': 'TELEVISOR',
    },
    's5z361um': {
      'pt': 'TV',
      'en': 'TV',
      'es': 'TELEVISOR',
    },
    '0rl4l88f': {
      'pt': 'Share',
      'en': 'TV',
      'es': 'TELEVISOR',
    },
    'rrihm3ii': {
      'pt': 'Atualiz.:',
      'en': 'Updated',
      'es': 'Actualizado',
    },
    'heo3k9y2': {
      'pt': 'Encerrados',
      'en': '',
      'es': '',
    },
    'blk567re': {
      'pt': 'Nome: ',
      'en': '',
      'es': '',
    },
    '3numpvz1': {
      'pt': 'Data: ',
      'en': '',
      'es': '',
    },
    'a52gcfqk': {
      'pt': 'Modalidade:',
      'en': '',
      'es': '',
    },
    'ybdvanan': {
      'pt': 'Posição',
      'en': '',
      'es': '',
    },
    'ygul2pwv': {
      'pt': 'Tabela',
      'en': '',
      'es': '',
    },
    'tl4hgebp': {
      'pt': 'Jogos',
      'en': '',
      'es': '',
    },
    '6cq7as14': {
      'pt': 'Confrontos',
      'en': '',
      'es': '',
    },
    'e5gdkzyu': {
      'pt': 'Adversário',
      'en': '',
      'es': '',
    },
    'ky401b8e': {
      'pt': 'PJ',
      'en': '',
      'es': '',
    },
    'd1x0m4sf': {
      'pt': 'V+',
      'en': '',
      'es': '',
    },
    'fmxzz5jx': {
      'pt': 'E',
      'en': '',
      'es': '',
    },
    'sf26zgde': {
      'pt': 'D-',
      'en': '',
      'es': '',
    },
    'fhnvheks': {
      'pt': 'GP',
      'en': '',
      'es': '',
    },
    'acoqs8tb': {
      'pt': 'GC',
      'en': '',
      'es': '',
    },
    'vxbo8nf3': {
      'pt': 'SD',
      'en': '',
      'es': '',
    },
    'xga1q3gk': {
      'pt': 'Área exclusiva de Assinantes',
      'en': '',
      'es': '',
    },
    'tmfa39em': {
      'pt': 'Clique aqui e torne-se um Assinante',
      'en': '',
      'es': '',
    },
    'npogsioh': {
      'pt':
          ' Torne-se um usuário Prata e tenha os beneficios de todas as funcionalidades e livre de anuncios.',
      'en': '',
      'es': '',
    },
    'wbpa0621': {
      'pt': 'Home',
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // ManutencaoRanking
  {
    '1q35bmk3': {
      'pt': 'Administrativo',
      'en': 'Ranking & Leagues',
      'es': 'Clasificación y ligas',
    },
    'n9bkth9p': {
      'pt': 'Ligas',
      'en': '',
      'es': '',
    },
    'n9vpwzbm': {
      'pt': 'Option 1',
      'en': '',
      'es': '',
    },
    'tbqftllu': {
      'pt': 'Consulte uma Federação?',
      'en': '',
      'es': '',
    },
    'qowuvlfv': {
      'pt': 'Search for an item...',
      'en': '',
      'es': '',
    },
    '9lmfk2bs': {
      'pt': 'Todos',
      'en': '',
      'es': '',
    },
    '8l23eqqh': {
      'pt': 'Etapas',
      'en': '',
      'es': '',
    },
    'dt4ftzcz': {
      'pt': 'Acompanhe o desempenho por;',
      'en': '',
      'es': '',
    },
    'h3vaqgjn': {
      'pt': 'Federer',
      'en': 'Games',
      'es': 'Juegos',
    },
    'ag4031sa': {
      'pt': 'Clube',
      'en': 'Games',
      'es': 'Juegos',
    },
    '0575ed6z': {
      'pt': 'Atletas',
      'en': 'Games',
      'es': 'Juegos',
    },
    'fyl8h9lk': {
      'pt': 'Estatísticas',
      'en': '',
      'es': '',
    },
    'vdzd0dd6': {
      'pt': 'Hello World',
      'en': '',
      'es': '',
    },
    '1thkvut0': {
      'pt': 'Nome:',
      'en': '',
      'es': '',
    },
    '9v8szzox': {
      'pt': 'Apelido:',
      'en': '',
      'es': '',
    },
    'yc28l4qx': {
      'pt': 'Usuário:',
      'en': '',
      'es': '',
    },
    'gsyd05hb': {
      'pt': 'Confrontos',
      'en': '',
      'es': '',
    },
    '54r6ik3l': {
      'pt': 'Encerrado',
      'en': '',
      'es': '',
    },
    'cqpmkw0d': {
      'pt': 'Área exclusiva de Assinantes',
      'en': '',
      'es': '',
    },
    'h0e36hbi': {
      'pt': 'Clique aqui e torne-se um Assinante',
      'en': '',
      'es': '',
    },
    '0q50qx2x': {
      'pt':
          ' Torne-se um usuário Prata e tenha os beneficios de todas as funcionalidades e livre de anuncios.',
      'en': '',
      'es': '',
    },
    'j8v6a36p': {
      'pt': 'Estatisticas',
      'en': 'Statistics',
      'es': 'Estadísticas',
    },
  },
  // TelaPcAcompanha
  {
    'nogr6zl4': {
      'pt': 'Esta tela só poderá ser,',
      'en': '',
      'es': '',
    },
    '7q2q2rn5': {
      'pt': 'visualizada em PC.',
      'en': '',
      'es': '',
    },
    'r90myegm': {
      'pt': 'Acompanhe seu Campeonato',
      'en': 'Follow your Championship',
      'es': 'Sigue tu campeonato',
    },
    'wsf7jryu': {
      'pt': 'Classificação',
      'en': 'Classification',
      'es': 'Clasificación',
    },
    'ey8yqivb': {
      'pt': 'PTS',
      'en': 'PTS',
      'es': 'PTS',
    },
    '3r2byppk': {
      'pt': 'PJ',
      'en': 'P.J.',
      'es': 'P.J.',
    },
    'cb3lzflw': {
      'pt': 'VIT',
      'en': 'VIT',
      'es': 'VIT',
    },
    'm2g4hd3y': {
      'pt': 'EMP',
      'en': 'EMP',
      'es': 'PEM',
    },
    'atem4wkh': {
      'pt': 'DER',
      'en': 'DER',
      'es': 'DER',
    },
    'nvwjwegn': {
      'pt': 'GP',
      'en': 'GP',
      'es': 'médico de cabecera',
    },
    '2kxh55a9': {
      'pt': 'GC',
      'en': 'GC',
      'es': 'GC',
    },
    'dogzlgn1': {
      'pt': 'SDG',
      'en': 'SDG',
      'es': 'ODS',
    },
    'eu01tqhb': {
      'pt': 'CG',
      'en': 'CG',
      'es': 'CG',
    },
    'hbkikhlx': {
      'pt': 'MCG',
      'en': 'MCG',
      'es': 'MCG',
    },
    'rhg6myew': {
      'pt': '%',
      'en': '%',
      'es': '%',
    },
    'a59kbreq': {
      'pt': 'Rodada Nº: ',
      'en': 'Round No.:',
      'es': 'Ronda No.:',
    },
    'kdgh4133': {
      'pt': 'Mesa Nº:',
      'en': 'Table No.:',
      'es': 'Tabla No.:',
    },
    'a5eykzqp': {
      'pt': 'VS',
      'en': 'VS',
      'es': 'contra',
    },
    'dgirjnie': {
      'pt': 'Home',
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // CalendarChampions
  {
    'zy74jkkr': {
      'pt': 'Agenda Nacional',
      'en': 'Ranking & Leagues',
      'es': 'Clasificación y ligas',
    },
    'w10hz1rg': {
      'pt': 'Posição',
      'en': 'Table',
      'es': 'Tabla',
    },
    'r66b4ndq': {
      'pt': 'Tabela',
      'en': 'Table',
      'es': 'Tabla',
    },
    'ner9t46n': {
      'pt': 'Jogos',
      'en': 'Games',
      'es': 'Juegos',
    },
    'w1wxdn20': {
      'pt': 'Estatisticas',
      'en': 'Statistics',
      'es': 'Estadísticas',
    },
  },
  // CriaRanking
  {
    'eqcp4gdo': {
      'pt': 'Nome',
      'en': '',
      'es': '',
    },
    '56jiw9m5': {
      'pt': 'Nome da Liga',
      'en': '',
      'es': '',
    },
    'e5dyqirx': {
      'pt': 'Modalidade',
      'en': 'Modality',
      'es': 'Modalidad',
    },
    'ucx03f8i': {
      'pt': 'Search for an item...',
      'en': 'Search for an item...',
      'es': 'Buscar un artículo...',
    },
    'wo8c1lmy': {
      'pt': 'Torneio Aberto',
      'en': '',
      'es': '',
    },
    'b0ubdre8': {
      'pt': 'Torneio Regional',
      'en': '',
      'es': '',
    },
    'aaio60xy': {
      'pt': 'Torneio Nacional',
      'en': '',
      'es': '',
    },
    'cqio3xts': {
      'pt': 'Torneio Tipo',
      'en': '',
      'es': '',
    },
    'snsh96uz': {
      'pt': 'Search for an item...',
      'en': '',
      'es': '',
    },
    '8323n3bf': {
      'pt': 'Criar ',
      'en': '',
      'es': '',
    },
    'o5hfsilr': {
      'pt': 'Criação de  Ranking',
      'en': 'Ranking & Leagues',
      'es': 'Clasificación y ligas',
    },
    '3bdi8vjs': {
      'pt': 'Estatisticas',
      'en': 'Statistics',
      'es': 'Estadísticas',
    },
  },
  // ConsultaJogos
  {
    'ug1gg483': {
      'pt': 'Nome:',
      'en': 'Phase:',
      'es': 'Fase:',
    },
    'n1f7pbxk': {
      'pt': 'Fase:',
      'en': 'Phase:',
      'es': 'Fase:',
    },
    'hvintwgo': {
      'pt': 'Rodada Nº',
      'en': '',
      'es': '',
    },
    'kr8uvbtq': {
      'pt': 'Grupo: ',
      'en': '',
      'es': '',
    },
    '34rmen40': {
      'pt': 'Consulta Partidas',
      'en': 'Match Maintenance',
      'es': 'Mantenimiento del partido',
    },
    'bmyczl39': {
      'pt': 'Partidas',
      'en': 'Departures',
      'es': 'Salidas',
    },
  },
  // ColocacaoFederacao
  {
    '4qck6246': {
      'pt': 'Federações',
      'en': 'Final Placement',
      'es': 'Colocación final',
    },
    'kgztap6j': {
      'pt': 'Pos',
      'en': '',
      'es': '',
    },
    'zmp1mo38': {
      'pt': 'Nome',
      'en': '',
      'es': '',
    },
    'afsqlzxa': {
      'pt': 'Pontos',
      'en': '',
      'es': '',
    },
    '7lfq9mm6': {
      'pt': 'Classificação Geral',
      'en': 'Positioning',
      'es': 'Posicionamiento',
    },
    'nitir74l': {
      'pt': 'Estatisticas',
      'en': 'Statistics',
      'es': 'Estadísticas',
    },
  },
  // ColocacaoClube
  {
    'wcyukj46': {
      'pt': 'Clubes',
      'en': 'Final Placement',
      'es': 'Colocación final',
    },
    '0zf1peaz': {
      'pt': 'Pos',
      'en': '',
      'es': '',
    },
    'wi8tvesc': {
      'pt': 'Nome',
      'en': '',
      'es': '',
    },
    '0syraf1m': {
      'pt': 'Pontos',
      'en': '',
      'es': '',
    },
    'rhq8xcab': {
      'pt': 'Classificação Geral',
      'en': 'Positioning',
      'es': 'Posicionamiento',
    },
    'i8rtwt0o': {
      'pt': 'Estatisticas',
      'en': 'Statistics',
      'es': 'Estadísticas',
    },
  },
  // ColocacaoAtleta
  {
    'to10hzbs': {
      'pt': 'Atletas',
      'en': 'Final Placement',
      'es': 'Colocación final',
    },
    'nkpuii9q': {
      'pt': 'Classificação Geral',
      'en': 'Positioning',
      'es': 'Posicionamiento',
    },
    '6p46i4u8': {
      'pt': 'Estatisticas',
      'en': 'Statistics',
      'es': 'Estadísticas',
    },
  },
  // ConsultaTabela
  {
    'a1vicpc6': {
      'pt': 'Consulta Tabelas',
      'en': 'Table Generation',
      'es': 'Generación de tablas',
    },
    'boyhpjhx': {
      'pt': 'Classificação',
      'en': 'Classification',
      'es': 'Clasificación',
    },
    '01jil0ll': {
      'pt': 'PTS',
      'en': 'PTS',
      'es': 'PTS',
    },
    '81tc1a8j': {
      'pt': 'PJ',
      'en': 'P.J.',
      'es': 'P.J.',
    },
    '7mbkpref': {
      'pt': 'VIT',
      'en': 'VIT',
      'es': 'VIT',
    },
    'k7h1tqr4': {
      'pt': 'EMP',
      'en': 'EMP',
      'es': 'PEM',
    },
    '833ex4s2': {
      'pt': 'DER',
      'en': 'DER',
      'es': 'DER',
    },
    'row1gjtz': {
      'pt': 'GP',
      'en': 'GP',
      'es': 'médico de cabecera',
    },
    'cmlwkzvj': {
      'pt': 'GC',
      'en': 'GC',
      'es': 'GC',
    },
    'xiqb3pzx': {
      'pt': 'SDG',
      'en': 'SDG',
      'es': 'ODS',
    },
    'nxvr5h3h': {
      'pt': 'CG',
      'en': 'CG',
      'es': 'CG',
    },
    'nddn82kc': {
      'pt': 'MCG',
      'en': 'MCG',
      'es': 'MCG',
    },
    'x1ruyld0': {
      'pt': '%',
      'en': '%',
      'es': '%',
    },
    '19csefil': {
      'pt': 'Fases e Grupos',
      'en': 'Phases and Groups',
      'es': 'Fases y Grupos',
    },
  },
  // ConsultaEstatistica
  {
    'r8c27j5q': {
      'pt': 'Desempenho',
      'en': 'Statistics',
      'es': 'Estadísticas',
    },
    'wua4kwnx': {
      'pt': 'Desempenho Geral  no  Campeonato',
      'en': 'Final Placement',
      'es': 'Colocación final',
    },
    'cvj94je4': {
      'pt': 'Fase',
      'en': '',
      'es': '',
    },
    'h0v3xf5z': {
      'pt': 'Colocação',
      'en': '',
      'es': '',
    },
    'kpl2lql2': {
      'pt': 'Pontos',
      'en': '',
      'es': '',
    },
    'y3ib0seg': {
      'pt': 'Qtd Jogos',
      'en': '',
      'es': '',
    },
    'r58b4t0h': {
      'pt': 'Vitorias',
      'en': '',
      'es': '',
    },
    'qlksyaom': {
      'pt': 'Empates',
      'en': '',
      'es': '',
    },
    'xwgg91v0': {
      'pt': 'Derrotas',
      'en': '',
      'es': '',
    },
    'ue05geou': {
      'pt': 'Gols Pró',
      'en': '',
      'es': '',
    },
    'qz1x08ed': {
      'pt': 'Gols Contra',
      'en': '',
      'es': '',
    },
    '6ghu2lw5': {
      'pt': 'Saldo de Gols',
      'en': '',
      'es': '',
    },
    '9vlfv8zo': {
      'pt': 'Colocaçao Geral',
      'en': '',
      'es': '',
    },
    'q0z6ms6s': {
      'pt': 'Posicão Grupo',
      'en': '',
      'es': '',
    },
    'ma1j4pjc': {
      'pt': 'Aproveitamento',
      'en': '',
      'es': '',
    },
    'fai0ykpj': {
      'pt': 'Geral',
      'en': '',
      'es': '',
    },
    'n62f02y0': {
      'pt': '--',
      'en': '',
      'es': '',
    },
    'n0f0vwtx': {
      'pt': '--',
      'en': '',
      'es': '',
    },
    'ljodkf1k': {
      'pt': 'VS',
      'en': '',
      'es': '',
    },
    '4sy1iw7y': {
      'pt': 'Estatisticas',
      'en': 'Statistics',
      'es': 'Estadísticas',
    },
  },
  // NextGrupos
  {
    '7gbvrsz6': {
      'pt': 'Fases do Campeonato',
      'en': '',
      'es': '',
    },
    'ae73pxsf': {
      'pt': 'Configuração da:',
      'en': '',
      'es': '',
    },
    'cjtmtmfu': {
      'pt': 'Colocação no seu Grupo (POS)',
      'en': '',
      'es': '',
    },
    'vhnsdeum': {
      'pt': 'Colocação Geral no Campeonato (CG)',
      'en': '',
      'es': '',
    },
    'u7k5o2dc': {
      'pt': 'Colocação comparado aos Grupos (MCG)',
      'en': '',
      'es': '',
    },
    'hywgeha8': {
      'pt': 'Escolha uma das Opções!',
      'en': '',
      'es': '',
    },
    '7c93pfmb': {
      'pt': 'Search for an item...',
      'en': '',
      'es': '',
    },
    '4wn8hh4x': {
      'pt': 'º colocado:  ',
      'en': '',
      'es': '',
    },
    'd737sx6t': {
      'pt': 'SALVAR',
      'en': '',
      'es': '',
    },
    'taew4xt0': {
      'pt': 'Home',
      'en': '',
      'es': '',
    },
  },
  // ConsultaFederacoeseClubes
  {
    'yq96i5n0': {
      'pt': 'Nome:',
      'en': '',
      'es': '',
    },
    'hsivqh5e': {
      'pt': 'Apelido:',
      'en': '',
      'es': '',
    },
    'pbqjvl4g': {
      'pt': 'Usuário:',
      'en': '',
      'es': '',
    },
    '2i1xcpk3': {
      'pt': 'Sala de Troféus',
      'en': 'Change Your Universe',
      'es': 'Cambia tu universo',
    },
    'uypm35ez': {
      'pt': 'Home',
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // ListaInscritos
  {
    '225k3cnz': {
      'pt': 'Lista de Inscritos',
      'en': 'Registration List',
      'es': 'Lista de registro',
    },
    'acb70q2u': {
      'pt': 'Inscritos até o momento',
      'en': 'List of participants',
      'es': 'Lista de participantes',
    },
    'yb1v4h12': {
      'pt': 'Participantes',
      'en': 'Participants',
      'es': 'Participantes',
    },
  },
  // ConsultaJogosEstatisticos
  {
    'bqn4itdu': {
      'pt': 'Aversário:',
      'en': 'Phase:',
      'es': 'Fase:',
    },
    '8zt6qmxv': {
      'pt': 'Adversário',
      'en': '',
      'es': '',
    },
    's48bk89j': {
      'pt': 'Campeonato: ',
      'en': '',
      'es': '',
    },
    'upa2odj2': {
      'pt': 'Nome ',
      'en': '',
      'es': '',
    },
    'ak4ymuqt': {
      'pt': 'Modalidade: ',
      'en': '',
      'es': '',
    },
    'jmqewrja': {
      'pt': 'Nome ',
      'en': '',
      'es': '',
    },
    'p5vhtqbq': {
      'pt': 'Data: ',
      'en': '',
      'es': '',
    },
    'ehy86uk9': {
      'pt': 'data',
      'en': '',
      'es': '',
    },
    '8o70w27t': {
      'pt': 'Mandante',
      'en': '',
      'es': '',
    },
    '90igimue': {
      'pt': 'Hello World',
      'en': '',
      'es': '',
    },
    'gtzgwp7n': {
      'pt': 'Visitante',
      'en': '',
      'es': '',
    },
    '7wmwqpk5': {
      'pt': 'Hello World',
      'en': '',
      'es': '',
    },
    '3mkm6lga': {
      'pt': 'Consulta Históricos',
      'en': 'Match Maintenance',
      'es': 'Mantenimiento del partido',
    },
    '074hanxk': {
      'pt': 'Partidas',
      'en': 'Departures',
      'es': 'Salidas',
    },
  },
  // SalaTrofeus
  {
    '0ru57sd8': {
      'pt': 'Adversário',
      'en': '',
      'es': '',
    },
    'g8n3eira': {
      'pt': 'PJ',
      'en': '',
      'es': '',
    },
    'uqe9nlb9': {
      'pt': 'V+',
      'en': '',
      'es': '',
    },
    'wk3c3mp7': {
      'pt': 'E',
      'en': '',
      'es': '',
    },
    'jwm6dls7': {
      'pt': 'D-',
      'en': '',
      'es': '',
    },
    'z3gjx4in': {
      'pt': 'GP',
      'en': '',
      'es': '',
    },
    '67tdv7cc': {
      'pt': 'GC',
      'en': '',
      'es': '',
    },
    'ivi3w0mg': {
      'pt': 'SD',
      'en': '',
      'es': '',
    },
    'kd9fkgp0': {
      'pt': 'Área exclusiva de Assinantes',
      'en': '',
      'es': '',
    },
    'dil97n44': {
      'pt': 'Clique aqui e torne-se um Assinante',
      'en': '',
      'es': '',
    },
    'et8ic0wi': {
      'pt':
          ' Torne-se um usuário Prata e tenha os beneficios de todas as funcionalidades e livre de anuncios.',
      'en': '',
      'es': '',
    },
    '9rah6txl': {
      'pt': 'Estatisticas',
      'en': 'Change Your Universe',
      'es': 'Cambia tu universo',
    },
    'lisen32s': {
      'pt': 'Home',
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // ManutAtleta
  {
    'fe7gesde': {
      'pt': 'Nome:',
      'en': '',
      'es': '',
    },
    '65k3usqf': {
      'pt': 'Nome',
      'en': '',
      'es': '',
    },
    'eejly8du': {
      'pt': 'Apelido:',
      'en': '',
      'es': '',
    },
    '1wu7qvzm': {
      'pt': 'Apelido',
      'en': '',
      'es': '',
    },
    'jwp0v8m0': {
      'pt': 'Data Nasc:',
      'en': '',
      'es': '',
    },
    'eonzjjyw': {
      'pt': 'Fone:',
      'en': '',
      'es': '',
    },
    'bhg3njw5': {
      'pt': 'Contato',
      'en': '',
      'es': '',
    },
    'tz575i6e': {
      'pt': 'Salvar as Alterações',
      'en': '',
      'es': '',
    },
    'ulbh458f': {
      'pt': 'Manutenção Atletas',
      'en': '',
      'es': '',
    },
    '99y9pefc': {
      'pt': 'Home',
      'en': '',
      'es': '',
    },
  },
  // colocacao
  {
    'g10yxap5': {
      'pt': 'Colocação Final',
      'en': 'Final Placement',
      'es': 'Colocación final',
    },
    'ujqyzi7f': {
      'pt': 'Final Campeonato',
      'en': 'Championship Closing',
      'es': 'Clausura del Campeonato',
    },
    '60s4vigl': {
      'pt': 'Colocação\n',
      'en': 'Championship Closing',
      'es': 'Clausura del Campeonato',
    },
    'vdsw9pfi': {
      'pt': 'Posicionamento',
      'en': 'Positioning',
      'es': 'Posicionamiento',
    },
    'ymutgrib': {
      'pt': 'Estatisticas',
      'en': 'Statistics',
      'es': 'Estadísticas',
    },
  },
  // ManutencaoAdmin
  {
    'rhmn79k3': {
      'pt': 'Manutenção Federações',
      'en': 'Ranking & Leagues',
      'es': 'Clasificación y ligas',
    },
    '1pluvppg': {
      'pt': 'Federação',
      'en': '',
      'es': '',
    },
    'ncrirpmj': {
      'pt': 'Assinatura expira em:',
      'en': '',
      'es': '',
    },
    '43b2wu5j': {
      'pt': 'Presidente:',
      'en': '',
      'es': '',
    },
    'vode8ax4': {
      'pt': 'Presidente',
      'en': '',
      'es': '',
    },
    'izfsiih5': {
      'pt': 'E-mail:',
      'en': '',
      'es': '',
    },
    'z9tqpjnh': {
      'pt': 'E-Mail',
      'en': '',
      'es': '',
    },
    'tehf80gl': {
      'pt': 'Web:',
      'en': '',
      'es': '',
    },
    'edm8pgx9': {
      'pt': 'Website',
      'en': '',
      'es': '',
    },
    'pq5yj6cu': {
      'pt': 'Confirme seu Fone:',
      'en': '',
      'es': '',
    },
    'ujkxtjws': {
      'pt': 'Telefone',
      'en': '',
      'es': '',
    },
    'vazh7dge': {
      'pt': 'Salvar as Alterações',
      'en': '',
      'es': '',
    },
    'ddq6iay5': {
      'pt': 'Área exclusiva de Assinantes',
      'en': '',
      'es': '',
    },
    'cl2x8vs6': {
      'pt': 'Clique aqui e torne-se um Assinante',
      'en': '',
      'es': '',
    },
    '9ntgk4ak': {
      'pt':
          ' Torne-se um usuário Prata e tenha os beneficios de todas as funcionalidades e livre de anuncios.',
      'en': '',
      'es': '',
    },
    '2ei669ux': {
      'pt': 'Atletas',
      'en': '',
      'es': '',
    },
    '3ftu2ho0': {
      'pt': 'Lista de Atletas Federados',
      'en': '',
      'es': '',
    },
    '496hlclo': {
      'pt': 'Administradores',
      'en': '',
      'es': '',
    },
    'dyxy5r1r': {
      'pt': 'Área exclusiva de Assinantes',
      'en': '',
      'es': '',
    },
    'u4o0dear': {
      'pt': 'Clique aqui e torne-se um Assinante',
      'en': '',
      'es': '',
    },
    'cp0hsopy': {
      'pt':
          ' Torne-se um usuário Prata e tenha os beneficios de todas as funcionalidades e livre de anuncios.',
      'en': '',
      'es': '',
    },
    '6wp2au0j': {
      'pt': 'Sem Clube',
      'en': '',
      'es': '',
    },
    'lfsz2i7e': {
      'pt': 'Área exclusiva de Assinantes',
      'en': '',
      'es': '',
    },
    'm767c2g4': {
      'pt': 'Clique aqui e torne-se um Assinante',
      'en': '',
      'es': '',
    },
    'o1qwr9ln': {
      'pt':
          ' Torne-se um usuário Prata e tenha os beneficios de todas as funcionalidades e livre de anuncios.',
      'en': '',
      'es': '',
    },
    'x5799pky': {
      'pt': 'Estatisticas',
      'en': 'Statistics',
      'es': 'Estadísticas',
    },
  },
  // recuperasenha
  {
    'ih7hfsh1': {
      'pt': 'Recuperar Senha',
      'en': 'Recover Password',
      'es': 'Recuperar contraseña',
    },
    '2wtypjtg': {
      'pt': 'E-mail',
      'en': 'Email',
      'es': 'Correo electrónico',
    },
    'bfftuya7': {
      'pt': 'Digite seu e-mail de cadastro',
      'en': 'Enter your registration email',
      'es': 'Introduce tu correo electrónico de registro',
    },
    'd3ntffty': {
      'pt': 'Enviar e-mail de recuperação',
      'en': 'Send recovery email',
      'es': 'Enviar correo electrónico de recuperación',
    },
  },
  // selectParticipante
  {
    '1j0kkdcv': {
      'pt': 'Selecione...',
      'en': 'Select...',
      'es': 'Seleccionar...',
    },
    'kx3c44az': {
      'pt': 'Adicionar Participante',
      'en': 'Add Participant',
      'es': 'Añada participante',
    },
  },
  // selectFederation
  {
    'dfqxn6a6': {
      'pt': 'Selecione sua Federação ou Liga',
      'en': 'Your search result',
      'es': 'El resultado de tu búsqueda',
    },
  },
  // selectClub
  {
    'r4x8it0w': {
      'pt': 'Selecione seu Clube',
      'en': 'Select your Club',
      'es': 'Selecciona tu Club',
    },
  },
  // SelectPlacar
  {
    'lmblunvs': {
      'pt': 'Participante',
      'en': 'Participant',
      'es': 'Partícipe',
    },
    'vxbxvr6g': {
      'pt': 'Placar',
      'en': 'Scoreboard',
      'es': 'Marcador',
    },
    'j1i9xd74': {
      'pt': 'Limpar Placar',
      'en': '',
      'es': '',
    },
    '5dssm56t': {
      'pt': 'Gravar',
      'en': 'To record',
      'es': 'Para registrar',
    },
  },
  // HelpUniverso
  {
    'gpaeas7k': {
      'pt': 'Informativo',
      'en': 'Informative',
      'es': 'Informativo',
    },
    'amn2kjb1': {
      'pt':
          'Aqui, você irá configurar qual a sua Liga, Federação,  Clube ou Confraria a qual você pertence, bem como a(s) modalidade(s) por quantidade de toque que você pratica.\n\nEssas configurções irão ajudar o Aplicativo UB  a convidar participantes, montar tabelas e jogos conforme caracteristica informada.\n\nLembrando que é por este cadastro que o UB irá agrupar os Ranqueamentos.\n\nCaso não encontre sua confederação ou clube, favor entrar em contato pelo WhatsApp 41  991430659 que em breve iremos cadastrar.\n',
      'en':
          'Here, you will configure which League, Federation, Club or Brotherhood you belong to, as well as the modality(s) by amount of touch you practice.\n\nThese settings will help the Universo Botonista Application to invite participants, set up tables and games according to the characteristics provided.\n\nYou will need to add your photo, Name and Nickname that will be used in tables and Games.\n\nIf you cannot find your confederation or club, please contact us via WhatsApp 41 991430659 and we will soon register it.',
      'es':
          'Aquí configurarás a qué Liga, Federación, Club o Hermandad perteneces, así como la(s) modalidad(es) por cantidad de toque que practicas.\n\nEstas configuraciones ayudarán a la Aplicación Universo Botonista a invitar participantes, montar mesas y juegos según las características proporcionadas.\n\nDeberá agregar su foto, nombre y apodo que se usará en las mesas y los juegos.\n\nSi no encuentras tu confederación o club, por favor contáctanos vía WhatsApp 41 991430659 y pronto lo registraremos.',
    },
  },
  // HelpNewChampion
  {
    'udi1mba9': {
      'pt': 'Informativo',
      'en': 'Informative',
      'es': 'Informativo',
    },
    'hf7tzkut': {
      'pt':
          'Modalidade:\nDeverá trazer as modalidades que estão relacionadas ao seu universo, selecionado atletas que jogam a mesma modalidade que a sua no momento da criação de um novo campeonato\n\nTorneio Tipo:\nTreino, estará disponível para todos os participantes e na escolha desta opção, deverá enviar um convite para todos os participantes da sua liga/Federação.\nAberto, estará disponivel para todos os assinantes e deverá enviar convite para todos que jogaram em algum momento contigo.\n\nTorneio Aberto: Para assinantes e voce poderá criar etapas e Ranking.\nTorneio Regional: Para assinantes e voce poderá criar Etapas e Ranking.\n\nTorneio Nacional: Para assinantes e voce poderá criar e acompanhar Etapas e Ranking.\n\nParticipação:\nIndividual, por atleta\nPor Equipe, em construção\n\nCaso tenha alguma duvida entrar em contato através do WhatsApp 41  991430659.\n',
      'en':
          'Modality:\nYou must bring the sports that are related to your universe, selecting athletes who play the same sport as you when creating a new championship\n\nTournament Type:\nTraining will be available to all participants and when choosing this option, you must send an invitation to all participants in your league/Federation.\nOpen, it will be available to all subscribers and you must send an invitation to everyone who has played with you at some point.\nOpen Tournament: For subscribers and you can create stages and Ranking.\nRegional Tournament: For subscribers and you create Stages and Ranking.\nNational Tournament: For subscribers and you could create Stages and Ranking.\n\nParticipation:\nIndividual, per athlete\nBy Team, under construction\n\nIf you have any questions, please contact us via WhatsApp 41 991430659.',
      'es':
          'Modalidad:\nDebes traer los deportes que están relacionados con tu universo, seleccionando atletas que practiquen el mismo deporte que tú al crear un nuevo campeonato.\n\nTipo de torneo:\nLos entrenamientos estarán disponibles para todos los participantes y al elegir esta opción, deberás enviar una invitación a todos los participantes de tu liga/federación.\nAbierto, estará disponible para todos los suscriptores y deberás enviar una invitación a todos los que hayan jugado contigo en algún momento.\nTorneo Abierto: Para suscriptores y podrás crear etapas y Ranking.\nTorneo Regional: Para suscriptores y tú creas Etapas y Ranking.\nTorneo Nacional: Para suscriptores y podrás crear Etapas y Ranking.\n\nParticipación:\nIndividual, por atleta\nPor equipo, en construcción\n\nSi tienes alguna duda, ponte en contacto con nosotros a través de WhatsApp 41 991430659.',
    },
  },
  // Cadnewuser
  {
    'v0zfah8i': {
      'pt': 'Inclusão Novo Usuário',
      'en': 'New User Inclusion',
      'es': 'Inclusión de nuevos usuarios',
    },
    'nacmjfv7': {
      'pt': 'E-mail do convidado',
      'en': 'Guest email',
      'es': 'Correo electrónico de invitado',
    },
    'l5xo7raz': {
      'pt': 'Nome convidado',
      'en': 'Guest name',
      'es': 'Nombre del invitado',
    },
  },
  // ConvidarUsuario
  {
    't2ttk11l': {
      'pt': 'Selecionar Atletas',
      'en': '',
      'es': '',
    },
    '96cdvpgb': {
      'pt': 'Adicionar Atletas',
      'en': '',
      'es': '',
    },
    '0w7v78rq': {
      'pt': 'Adicionar Convidados',
      'en': 'Add Guests',
      'es': 'Agregar invitados',
    },
  },
  // aa
  {
    'oyp73669': {
      'pt': 'Atenção',
      'en': 'Attention',
      'es': 'Atención',
    },
    '62dftie5': {
      'pt': 'Deseja remover a ',
      'en': 'Do you want to remove the',
      'es': '¿Quieres eliminar el',
    },
  },
  // HelpTabela
  {
    '7u5lfua1': {
      'pt': 'Informativo',
      'en': 'Informative',
      'es': 'Informativo',
    },
    '7pn3twdh': {
      'pt':
          'Critérios para colocação\n1º Numero de Pontos\n2º Total Vitorias\n3º Saldo de Gols\n4º Gols PRÓ\n5º Gols Contra\n6º Pontuação Geral\n\n \nTerminologia Importantes para geração das Proximas Fases;\n\nCG - Melhor colocado geral no campeonato independente de qual grupo esteja.\n\nMCG - Melhor colocado  em comparação ao mesmo colocado de outro grupo.\nEx.\n11 - Melhor primeiro colocado entre os primeiros colocados dos grupos.\n12- Segundo mehor primeiro colocado.\n\nCampeonato criado com 3 grupos, dos 1º colocados de cada grupo,  qual foi o melhor primeiro.\n',
      'en':
          'Here, you will configure which League, Federation, Club or Brotherhood you belong to, as well as the modality(s) by amount of touch you practice.\n\nThese settings will help the Universo Botonista Application to invite participants, set up tables and games according to the characteristics provided.\n\nYou will need to add your photo, Name and Nickname that will be used in tables and Games.\n\nIf you cannot find your confederation or club, please contact us via WhatsApp 41 991430659 and we will soon register it.',
      'es':
          'Aquí configurarás a qué Liga, Federación, Club o Hermandad perteneces, así como la(s) modalidad(es) por cantidad de toque que practicas.\n\nEstas configuraciones ayudarán a la Aplicación Universo Botonista a invitar participantes, montar mesas y juegos según las características proporcionadas.\n\nDeberá agregar su foto, nombre y apodo que se usará en las mesas y los juegos.\n\nSi no encuentras tu confederación o club, por favor contáctanos vía WhatsApp 41 991430659 y pronto lo registraremos.',
    },
  },
  // Administradores
  {
    'aogdcf48': {
      'pt': ' Administradores',
      'en': 'Informative',
      'es': 'Informativo',
    },
    'm8ttlaob': {
      'pt': 'Administrador Master',
      'en': '',
      'es': '',
    },
    'nt8i7fw8': {
      'pt': 'Administrador Secundário',
      'en': '',
      'es': '',
    },
  },
  // SelectPlacarCopy2
  {
    '64s8mj8s': {
      'pt': 'Manutenção',
      'en': 'Participant',
      'es': 'Partícipe',
    },
    'ldiwmjai': {
      'pt': 'Correção',
      'en': '',
      'es': '',
    },
  },
  // gerarJogos
  {
    'j2fvy58n': {
      'pt': 'Jogos do mesmo grupo',
      'en': 'Games from the same group',
      'es': 'Juegos del mismo grupo.',
    },
    'pvjymzet': {
      'pt': 'Jogos de grupos distintos',
      'en': 'Different group games',
      'es': 'Diferentes juegos grupales.',
    },
    'geymwydt': {
      'pt': 'Todos contra todos',
      'en': 'All against all',
      'es': 'Todos contra todos',
    },
    '99wpcdbd': {
      'pt': 'Selecione um modo...',
      'en': 'Select a mode...',
      'es': 'Seleccione un modo...',
    },
    'mwbb1fk9': {
      'pt': 'Search for an item...',
      'en': 'Search for an item...',
      'es': 'Buscar un artículo...',
    },
    'ysjvd9yx': {
      'pt': 'Qtd. de mesas',
      'en': 'Number of tables',
      'es': 'Número de mesas',
    },
    'tzo31f3m': {
      'pt': 'Gerar Jogos',
      'en': 'OK',
      'es': 'DE ACUERDO',
    },
    '57rx12hg': {
      'pt': 'teste',
      'en': 'OK',
      'es': 'DE ACUERDO',
    },
    'nt1b2ntq': {
      'pt': 'Finalizar Fase',
      'en': 'OK',
      'es': 'DE ACUERDO',
    },
  },
  // inputBox
  {
    'z9dnaa0x': {
      'pt': 'Cancelar',
      'en': '',
      'es': '',
    },
    'lc298doz': {
      'pt': 'Salvar',
      'en': '',
      'es': '',
    },
  },
  // Share
  {
    'fp0jgvfg': {
      'pt': 'Envie sua Mensagem',
      'en': 'Choosing',
      'es': 'Eligiendo',
    },
    'oye8qj2l': {
      'pt': 'Mensagem',
      'en': 'Next Phase by;',
      'es': 'Próxima Fase por;',
    },
    '8metgy2d': {
      'pt': 'Mensagem',
      'en': '',
      'es': '',
    },
    'te4dow6a': {
      'pt': 'Enviar',
      'en': '',
      'es': '',
    },
  },
  // Mensagem
  {
    'ewx73vnt': {
      'pt': 'Melhorias e Sugestôes',
      'en': 'Choosing',
      'es': 'Eligiendo',
    },
    '4o4j0svv': {
      'pt': 'Confirme seu Fone:',
      'en': '',
      'es': '',
    },
    'yn3jxvhy': {
      'pt': 'Telefone',
      'en': '',
      'es': '',
    },
    'o9dmu2va': {
      'pt': 'Mensagem',
      'en': 'Next Phase by;',
      'es': 'Próxima Fase por;',
    },
    '9vk7wjgq': {
      'pt': 'Mensagem',
      'en': '',
      'es': '',
    },
    'wnomm9lp': {
      'pt': 'Enviar',
      'en': '',
      'es': '',
    },
  },
  // ConfiguraPonto
  {
    'psn5e6wz': {
      'pt': 'Pontuação',
      'en': 'Informative',
      'es': 'Informativo',
    },
    'rlbnox83': {
      'pt': 'Configure  a Pontuação',
      'en': '',
      'es': '',
    },
    'rz1vz56s': {
      'pt': 'Posição',
      'en': '',
      'es': '',
    },
    'bb8izki7': {
      'pt': 'Posição',
      'en': '',
      'es': '',
    },
    '43am94dr': {
      'pt': '1',
      'en': '',
      'es': '',
    },
    'i6uul4f8': {
      'pt': 'Pontos',
      'en': '',
      'es': '',
    },
    '9fayblt0': {
      'pt': 'Pontos',
      'en': '',
      'es': '',
    },
    '3zoyjyou': {
      'pt': '0',
      'en': '',
      'es': '',
    },
    'zlj5p0i1': {
      'pt': 'Inclui Pontos Corridos',
      'en': '',
      'es': '',
    },
  },
  // SelectEtapas
  {
    'vsxu10j7': {
      'pt': 'Selecione as Etapas',
      'en': 'Attention',
      'es': 'Atención',
    },
    '3hmaja9i': {
      'pt': 'º',
      'en': '',
      'es': '',
    },
    'rsckt6x4': {
      'pt': 'Salvar',
      'en': '',
      'es': '',
    },
  },
  // MensagemChampion
  {
    '2smvp6bu': {
      'pt': 'Avisos',
      'en': 'Choosing',
      'es': 'Eligiendo',
    },
    'cpp78lii': {
      'pt': 'Escreva a sua Mensagem!',
      'en': 'Next Phase by;',
      'es': 'Próxima Fase por;',
    },
    'q87sccwn': {
      'pt': 'Mensagem',
      'en': '',
      'es': '',
    },
    'qv1xyvxs': {
      'pt': 'Enviar',
      'en': '',
      'es': '',
    },
  },
  // HekpPartidas
  {
    's61yv3in': {
      'pt': 'Partidas',
      'en': 'Attention',
      'es': 'Atención',
    },
    'c78pt2k7': {
      'pt':
          'Somente Administradores poderá dar a devida manutenção em telas de:\n',
      'en': 'Do you want to remove the',
      'es': '¿Quieres eliminar el',
    },
    'aci96ash': {
      'pt': 'Resultado dos Jogos',
      'en': '',
      'es': '',
    },
    'lt00dezp': {
      'pt': 'Alteracao de Mesa ou Rodada',
      'en': '',
      'es': '',
    },
  },
  // filtroNextFasePosicao
  {
    'odcucw5y': {
      'pt': 'Option 1',
      'en': '',
      'es': '',
    },
    'yb8ttwjq': {
      'pt': 'Fase',
      'en': '',
      'es': '',
    },
    'd0bmq7cf': {
      'pt': 'Search for an item...',
      'en': '',
      'es': '',
    },
    'w856pde5': {
      'pt': 'Option 1',
      'en': '',
      'es': '',
    },
    'd52thpo0': {
      'pt': 'Grupo',
      'en': '',
      'es': '',
    },
    'b1zanfl5': {
      'pt': 'Search for an item...',
      'en': '',
      'es': '',
    },
    'yyawb06a': {
      'pt': 'Posição a ser escolhida',
      'en': '',
      'es': '',
    },
    '1bgondd6': {
      'pt': 'Posição?',
      'en': '',
      'es': '',
    },
    'khr2ayvd': {
      'pt': 'Adicione',
      'en': '',
      'es': '',
    },
  },
  // HelpFinal
  {
    'l2jkkylr': {
      'pt': 'Atenção',
      'en': 'Attention',
      'es': 'Atención',
    },
    '1wa824bw': {
      'pt':
          'Quando capeonato for opção;\nTorneio Aberto,\nTorneio Regional,\nTorneio Nacional,\n\nestá sequencia de classificação \nserá levada para o Ranking  nesta\n mesma sequencia.',
      'en': 'Do you want to remove the',
      'es': '¿Quieres eliminar el',
    },
  },
  // MSGSeuUniverso
  {
    'o5ajiutr': {
      'pt': 'Atenção',
      'en': 'Attention',
      'es': 'Atención',
    },
    'ph7k22ql': {
      'pt':
          'Você deverá preencher;\nSeu Nome\nSeu Apelido\nData de Aniversário\nSua Federação\nSeu Clube\nSuas Modalidades...',
      'en': 'Do you want to remove the',
      'es': '¿Quieres eliminar el',
    },
    'eunqixo6': {
      'pt':
          'Informações necessárias para;\n- Convites para novos campeonatos,\n-Cálculo de Etapas,\n-Históricos de Jogos,\n- Priorização de jogos nas \nprimeiras rodadas.\n\nCaso sua liga ou clube não esteja \ncadastrado, você poderá solicitar\natravés do suporte...',
      'en': 'Do you want to remove the',
      'es': '¿Quieres eliminar el',
    },
  },
  // PlanoOuro
  {
    '5qite1ai': {
      'pt': 'Atenção Plano;',
      'en': 'Attention',
      'es': 'Atención',
    },
    'ioo3ut2x': {
      'pt': 'Voce está contratando o plano para ;',
      'en': '',
      'es': '',
    },
    'os8t1ww9': {
      'pt': 'Mensal',
      'en': '',
      'es': '',
    },
    'a97lqkrs': {
      'pt': 'Anual',
      'en': '',
      'es': '',
    },
    'n4orp8o9': {
      'pt': 'Mensal',
      'en': '',
      'es': '',
    },
    'pozdaha2': {
      'pt': 'Custo Mensal  de  R\$ 24,99\nCusto Anual de  R\$ 250,00',
      'en': 'Monthly cost of R\$25.99\nAnnual cost of R\$250.00',
      'es': 'Costo mensual de R\$ 25,99\nCosto anual de R\$ 250,00',
    },
    'qinr39gl': {
      'pt': 'Aderir ao Plano Ouro',
      'en': 'Join the Gold Plan',
      'es': 'Únete al Plan Oro',
    },
  },
  // HelpAdministre
  {
    'tcpfwvw7': {
      'pt': 'Atenção',
      'en': 'Attention',
      'es': 'Atención',
    },
    '7s3xbjtl': {
      'pt': 'Somente usuarios Prata e Ouro terão\n acesso a está área..\n ',
      'en': 'Do you want to remove the',
      'es': '¿Quieres eliminar el',
    },
    'x4bpwiob': {
      'pt': 'Planos e Assinaturas',
      'en': '',
      'es': '',
    },
  },
  // filtroNextChampion
  {
    'p1gjysv0': {
      'pt': 'Option 1',
      'en': '',
      'es': '',
    },
    'k5ugsebg': {
      'pt': 'Fase',
      'en': '',
      'es': '',
    },
    'ndsvmb6s': {
      'pt': 'Search for an item...',
      'en': '',
      'es': '',
    },
    '9h7am6g4': {
      'pt': 'Option 1',
      'en': '',
      'es': '',
    },
    'humqdzeg': {
      'pt': 'Grupo',
      'en': '',
      'es': '',
    },
    'fnymllef': {
      'pt': 'Search for an item...',
      'en': '',
      'es': '',
    },
    'poa8u1xj': {
      'pt': 'Posição a ser escolhida',
      'en': '',
      'es': '',
    },
    '6icg7ztt': {
      'pt': 'Posição?',
      'en': '',
      'es': '',
    },
    'vzmwp19v': {
      'pt': 'Adicione',
      'en': '',
      'es': '',
    },
  },
  // CadNovoUser
  {
    'vepfwn3m': {
      'pt': 'Inclusão Novo Atleta',
      'en': 'New User Inclusion',
      'es': 'Inclusión de nuevos usuarios',
    },
    'lgcgbs3i': {
      'pt': 'E-mail do convidado',
      'en': 'Guest email',
      'es': 'Correo electrónico de invitado',
    },
    'v59r07rx': {
      'pt': 'Nome convidado',
      'en': 'Guest name',
      'es': 'Nombre del invitado',
    },
    'i3845dsh': {
      'pt': 'Incluir Novo Atleta',
      'en': '',
      'es': '',
    },
  },
  // Miscellaneous
  {
    'u0l6zlju': {
      'pt': '',
      'en': '',
      'es': '',
    },
    'kx3ujbh8': {
      'pt': '',
      'en': '',
      'es': '',
    },
    's5g9z6wd': {
      'pt': '',
      'en': '',
      'es': '',
    },
    '3cn8fvmo': {
      'pt': 'Error; Erro de Autenticação...',
      'en': '',
      'es': '',
    },
    '3cxpg6he': {
      'pt': 'Enviado e-mail para redefinição de senha...',
      'en': '',
      'es': '',
    },
    '5o58yqdf': {
      'pt': 'E-mail, obrigatório... ',
      'en': '',
      'es': '',
    },
    '8gooebr8': {
      'pt': '',
      'en': '',
      'es': '',
    },
    'mnqxsfgg': {
      'pt': 'Senha Incorreta...',
      'en': '',
      'es': '',
    },
    'wanofyel': {
      'pt': 'Favor enviar o codigo de SMS....',
      'en': '',
      'es': '',
    },
    '4ayn6bzv': {
      'pt': 'Deseja excluir sua conta...',
      'en': '',
      'es': '',
    },
    'docaoky7': {
      'pt': 'Favor fazer o Login novamente antes de atualizar seu e-mail...',
      'en': '',
      'es': '',
    },
    '03p4n7nl': {
      'pt': 'Verifique seu e-mail, para redefinição de senha...',
      'en': '',
      'es': '',
    },
    '1ylshvv4': {
      'pt': 'Email já está em uso...',
      'en': '',
      'es': '',
    },
    'xp2jxkcn': {
      'pt': 'Formato invalido!',
      'en': 'Invalid format!',
      'es': '¡Formato inválido!',
    },
    'i2xjjlr4': {
      'pt': 'Enviando arquivo',
      'en': 'Sending file',
      'es': 'enviando archivo',
    },
    'r6av9vyu': {
      'pt': 'Sucesso',
      'en': 'Success',
      'es': 'Éxito',
    },
    'oh5t7haj': {
      'pt': 'Falha no envio',
      'en': 'Sending failed',
      'es': 'Envío fallido',
    },
    'pqqb6p01': {
      'pt': '',
      'en': '',
      'es': '',
    },
    'lhv08zvt': {
      'pt': 'Escolha uma opção',
      'en': 'Choose an option',
      'es': 'Elige una opcion',
    },
    '65e6j9h9': {
      'pt': 'Galeria',
      'en': 'Gallery',
      'es': 'Galería',
    },
    'gz1exip1': {
      'pt': 'Galeria de Fotos',
      'en': 'Photo gallery',
      'es': 'Galería de fotos',
    },
    'cjupg05z': {
      'pt': 'Galeria de Videos',
      'en': 'Video Gallery',
      'es': 'Galeria de VIDEOS',
    },
    'yvpcdyk8': {
      'pt': 'Camera',
      'en': 'Camera',
      'es': 'Cámara',
    },
    '2w3057e9': {
      'pt': '',
      'en': '',
      'es': '',
    },
    '27r3ygbq': {
      'pt': '',
      'en': '',
      'es': '',
    },
    '0fb4bw8f': {
      'pt': '',
      'en': '',
      'es': '',
    },
    '6x6mhy97': {
      'pt': '',
      'en': 'Error',
      'es': '',
    },
  },
].reduce((a, b) => a..addAll(b));
