import 'package:flutter/material.dart';
import 'Biography.dart';
import 'Empresas.dart';

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
class MusicasScreen extends StatelessWidget {
  // Lista de músicas com título e URL
  final List<Musica> musicas = [
    Musica(
      titulo: 'INTERSTELLAR',
      url: 'https://www.example.com/interstellar.mp3',
    ),
    Musica(
      titulo: 'PIRATAS DO CARIBE',
      url: 'https://www.example.com/pirates.mp3',
    ),
    Musica(
      titulo: 'GLADIADOR',
      url: 'https://www.example.com/gladiator.mp3',
    ),
    Musica(
      titulo: 'A ORIGEM',
      url: 'https://www.example.com/inception.mp3',
    ),
    Musica(
      titulo: 'O REI LEÃO',
      url: 'https://www.example.com/lionking.mp3',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trilhas'),
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
                leading: Image.network(
                  'https://www.example.com/album_cover_${index + 1}.jpg',
                  width: 50,
                  height: 50,
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
                  // Código para tocar a música a partir da URL
                  // Pode ser implementado com um plugin como 'audioplayers'
                },
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.white),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.white),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.album, color: Colors.white), // Ícone de disco
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business, color: Colors.white),
            label: '',
          ),
        ],
        onTap: (index) {
          // Navegação entre as telas de acordo com o índice do ícone
          switch (index) {
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BiographyScreen()),
              );
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EmpresasScreen()),
              );
              break;
          }
        },
      ),
    );
  }
}
