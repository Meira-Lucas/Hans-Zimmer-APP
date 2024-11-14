import 'package:flutter/material.dart';
import 'Musicas.dart';
import 'Empresas.dart';

class BiographyScreen extends StatefulWidget {
  @override
  _BiographyScreenState createState() => _BiographyScreenState();
}

class _BiographyScreenState extends State<BiographyScreen> {
  // URL das imagens e textos
  final String composerImageUrl =
      'https://www.dropbox.com/scl/fi/gtk4upktuoe3a4ndujt3a/92d5b2f4-4b69-4d87-8614-4014132ef204.jpg?rlkey=5lvrye0zhc5itxoy37n7nq3vj&st=rvt596og&raw=1';
  final String backgroundImageUrl =
      'https://www.dropbox.com/scl/fi/q4n238b5iqrd2qfltdw8h/download.jpg?rlkey=zf4fasbven2ouyb6d73wu93r9&st=av2wd5tx&raw=1';

  final String composerName = 'HANS ZIMMER';
  final String composerTitle = 'COMPOSITOR';

  final String biographyText =
      'Hans Zimmer é um renomado compositor e produtor musical alemão, conhecido por suas trilhas sonoras icônicas em filmes. Nascido em 12 de setembro de 1957, em Frankfurt, ele começou sua carreira na música trabalhando em jingles publicitários e na música pop antes de se dedicar ao cinema.';

  final String riseTitle = 'Ascensão';
  final String riseText =
      'Zimmer ganhou destaque na década de 1980, especialmente com a trilha sonora de "Rain Man". Desde então, ele compôs para uma variedade de filmes de grande sucesso, incluindo "O Rei Leão", "Gladiador", "A Origem", "Interestelar" e a série "Batman" dirigida por Christopher Nolan. Seu estilo combina elementos orquestrais tradicionais com tecnologia moderna, criando sonoridades envolventes e emocionais.';

  // Definindo qual tela exibir
  int _currentIndex = 0;

  final List<Widget> _screens = [
    BiographyContent(), // A tela da biografia
    MusicasScreen(), // Tela de músicas
    EmpresasScreen(), // Tela de empresas
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: _screens[_currentIndex], // Exibe a tela com base no índice
      // Barra de navegação inferior
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.white),
            label: 'Biografia',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.music_note, color: Colors.white),
            label: 'Músicas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business, color: Colors.white),
            label: 'Empresas',
          ),
        ],
      ),
    );
  }
}

class BiographyContent extends StatelessWidget {
  final String composerImageUrl =
      'https://www.dropbox.com/scl/fi/gtk4upktuoe3a4ndujt3a/92d5b2f4-4b69-4d87-8614-4014132ef204.jpg?rlkey=5lvrye0zhc5itxoy37n7nq3vj&st=rvt596og&raw=1';
  final String composerName = 'HANS ZIMMER';
  final String composerTitle = 'COMPOSITOR';
  final String biographyText =
      'Hans Zimmer é um renomado compositor e produtor musical alemão, conhecido por suas trilhas sonoras icônicas em filmes. Nascido em 12 de setembro de 1957, em Frankfurt, ele começou sua carreira na música trabalhando em jingles publicitários e na música pop antes de se dedicar ao cinema.';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Imagem e título do compositor
        Container(
          color: Colors.grey[800],
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              Image.network(
                composerImageUrl,
                width: 150,
                height: 150,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 10),
              Text(
                composerName,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                composerTitle,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
        ),
        // Texto de Biografia e Ascensão
        Expanded(
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://www.dropbox.com/scl/fi/q4n238b5iqrd2qfltdw8h/download.jpg?rlkey=zf4fasbven2ouyb6d73wu93r9&st=av2wd5tx&raw=1'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5),
                  BlendMode.darken,
                ),
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Text(
                    biographyText,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20),
                  // Seção de Ascensão
                  Text(
                    'Ascensão',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Zimmer ganhou destaque na década de 1980, especialmente com a trilha sonora de "Rain Man".',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
