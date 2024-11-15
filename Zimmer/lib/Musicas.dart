import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MusicasScreen(),
    );
  }
}

// Classe Musica para armazenar as informações de cada música
class Musica {
  final String titulo;
  final String url;

  Musica({required this.titulo, required this.url});
}

// Classe para a tela de músicas
class MusicasScreen extends StatefulWidget {
  @override
  _MusicasScreenState createState() => _MusicasScreenState();
}

class _MusicasScreenState extends State<MusicasScreen> {
  final AudioPlayer _audioPlayer = AudioPlayer();

  final List<Musica> musicas = [
    Musica(
      titulo: 'Batman: Cavaleiro das Trevas',
      url:
          'https://www.dropbox.com/scl/fi/s1b77sh3hsm1or565hdwp/The-Dark-Knight-Rises-OST-1.-A-Storm-is-Coming-Hans-Zimmer-M4A_128K.m4a?rlkey=77s9iv9m3yo337dzhtyp06eol&st=j2fhlrex&raw=1',
    ),
    Musica(
      titulo: 'Rango',
      url:
          'https://www.dropbox.com/scl/fi/bjwndvqz84xxmq47gm4m3/Rango-Suite-M4A_128K.m4a?rlkey=x9ybw55p4fl7wh5e1qo1xlj9c&st=8qyn3stu&raw=1',
    ),
    Musica(
      titulo: 'Os Simpsons',
      url:
          'https://www.dropbox.com/scl/fi/y8p8fw4pii2ldlud2cypx/The-Simpsons-Movie-OST-_1-The-Simpsons_-television-theme-M4A_128K.m4a?rlkey=fpmurc11i5x6e42oi166ztajy&st=4wmqeim8&raw=1',
    ),
    Musica(
      titulo: 'Piratas do Caribe: No Fim do Mundo',
      url:
          'https://www.dropbox.com/scl/fi/6r3paucwx0t2xycq6kmks/Up-Is-Down-From-_Pirates-of-the-Caribbean_-At-World_s-End__Score-M4A_128K.m4a?rlkey=whxnu6bsjrfbg547h8js33cw3&st=lp1e9jdy&raw=1',
    ),
    Musica(
      titulo: 'Piratas do Caribe: O Baú da Morte',
      url:
          'https://www.dropbox.com/scl/fi/pupw3gk94wxazgeg2865h/Pirates-Of-The-Caribbean-Dead-Man_s-Chest-Score-01-Jack-Sparrow-Hans-Zimmer-M4A_128K.m4a?rlkey=fcr6zrr3apjcl6bo9fm69gfrb&st=yzq779pz&raw=1',
    ),
    Musica(
      titulo: 'Batman Begins',
      url:
          'https://www.dropbox.com/scl/fi/hcr3mbtebkhtguvg6ti2n/Batman-Begins-OST-Vespertilio-M4A_128K.m4a?rlkey=3hxn66meiisoaswgo814iqwrm&st=n6tyetqm&raw=1',
    ),
    Musica(
      titulo: 'INTERSTELLAR',
      url:
          'https://www.dropbox.com/scl/fi/6py143gvu0v5rzftt4f9y/Interstellar-Main-Theme-Extra-Extended-Soundtrack-by-Hans-Zimmer-M4A_128K.m4a?rlkey=lnj59atndcng7a3ftjwr0gnvv&st=fivu0k53&raw=1',
    ),
    Musica(
      titulo: 'PIRATAS DO CARIBE - Trilha Principal',
      url:
          'https://www.dropbox.com/scl/fi/dh67b8j9zwghbg1iu5r6s/Main-Theme-_-Pirates-of-the-Caribbean-M4A_128K.m4a?rlkey=4tl8fs3w1ri7u7f1mfllwvxgn&st=w8jvffqw&raw=1',
    ),
    Musica(
      titulo: 'O Chamado',
      url:
          'https://www.dropbox.com/scl/fi/zqfgrnbpebn9hb3wpq0cz/O-Chamado-Trailer-Original-M4A_128K.m4a?rlkey=p5vv98i0s581mv4i6vsu1e2q6&st=jvpblf10&raw=1',
    ),
    Musica(
      titulo: 'Pear Harbor',
      url:
          'https://www.dropbox.com/scl/fi/e5rqwnperh5ef86s77zw2/Pearl-Harbor-Soundtrack-Tennessee-Hans-Zimmer-M4A_128K.m4a?rlkey=dpknna3qajb8h3i7euuuje73h&st=jn70j025&raw=1',
    ),
    Musica(
      titulo: 'Gladiador',
      url:
          'https://www.dropbox.com/scl/fi/u60x8cumw6llxf31nw0wh/Gladiator-Now-We-Are-Free-Super-Theme-Song-M4A_128K.m4a?rlkey=86eap58fzhqirmp1sw79ztnth&st=w8zg1wb5&raw=1',
    ),
    Musica(
      titulo: 'Rei Leão',
      url:
          'https://www.dropbox.com/scl/fi/nucosvdhdyl2pd3iendwi/Lion-King-Complete-Score-01-Circle-Of-Life-Hans-Zimmer-M4A_128K.m4a?rlkey=ec6dg1okw0u1zmxp3n7yooys6&st=43c2alw7&raw=1',
    ),
  ];

  // Função para reproduzir a música
  void _playMusic(String url) async {
    await _audioPlayer.stop(); // Parar qualquer áudio em execução
    await _audioPlayer.play(url); // Reproduzir diretamente com o URL
  }

  @override
  void dispose() {
    _audioPlayer.dispose(); // Liberar recursos do player ao sair
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Músicas'),
        backgroundColor: Colors.black,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Imagem de fundo
          Image.network(
            'https://www.dropbox.com/scl/fi/gtk4upktuoe3a4ndujt3a/92d5b2f4-4b69-4d87-8614-4014132ef204.jpg?rlkey=5lvrye0zhc5itxoy37n7nq3vj&st=rvt596og&raw=1',
            fit: BoxFit.cover,
          ),
          Container(
            color: Colors.black.withOpacity(0.6), // Camada escurecida
          ),
          ListView.builder(
            itemCount: musicas.length,
            itemBuilder: (context, index) {
              final musica = musicas[index];
              return ListTile(
                leading: Icon(
                  Icons.music_note,
                  color: Colors.white,
                  size: 40,
                ),
                title: Text(
                  musica.titulo,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                trailing: Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                ),
                onTap: () {
                  _playMusic(musica.url); // Reproduzir a música ao clicar
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
