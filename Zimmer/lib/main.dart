import 'package:flutter/material.dart';
import 'Biography.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoadingScreen(), // Define a LoadingScreen como tela inicial
    );
  }
}

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

    Future.delayed(Duration(seconds: 5), () {
      _controller.reverse().then((_) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => BiographyScreen()),
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
            'https://www.dropbox.com/scl/fi/6tq4l8ktgpdmjeofm9i7l/images.jpg?rlkey=7axde64bu472fi3m0gmzsbec2&st=i417wcrj&raw=1',
            fit: BoxFit.cover,
          ),
          // Camada escurecida
          Container(
            color: Colors.black.withOpacity(0.6),
          ),
          // Conteúdo principal da tela de carregamento
          Center(
            child: FadeTransition(
              opacity: _animation,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Imagem central
                  Image.network(
                    'https://www.dropbox.com/scl/fi/gtk4upktuoe3a4ndujt3a/92d5b2f4-4b69-4d87-8614-4014132ef204.jpg?rlkey=5lvrye0zhc5itxoy37n7nq3vj&st=rvt596og&raw=1',
                    width: 150,
                    height: 150,
                  ),
                  SizedBox(height: 20),
                  // Título
                  Text(
                    'Hans Zimmer',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
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
