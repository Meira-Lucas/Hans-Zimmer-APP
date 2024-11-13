import 'package:flutter/material.dart';
import 'Biography.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    _controller.forward();

    Future.delayed(Duration(seconds: 3), () {
      _controller.reverse().then((_) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
              builder: (context) =>
                  BiographyScreen()), // Substitua por sua tela de destino
        );
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Imagem de fundo com URL
          Image.network(
            'https://www.dropbox.com/scl/fi/gtk4upktuoe3a4ndujt3a/92d5b2f4-4b69-4d87-8614-4014132ef204.jpg?rlkey=5lvrye0zhc5itxoy37n7nq3vj&st=rvt596og&raw=1',
            fit: BoxFit.cover,
          ),
          // Camada escurecida
          Container(
            color: Colors.black
                .withOpacity(0.6), // Ajuste a opacidade conforme necessário
          ),
          // Conteúdo da tela de carregamento
          Center(
            child: FadeTransition(
              opacity: _animation,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.music_note, size: 100, color: Colors.white),
                  SizedBox(height: 20),
                  Text(
                    'Carregando...',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
