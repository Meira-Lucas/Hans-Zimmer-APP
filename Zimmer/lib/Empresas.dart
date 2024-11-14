import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: EmpresasScreen(),
    );
  }
}

class EmpresasScreen extends StatelessWidget {
  // Informações sobre as empresas
  final List<Company> companies = [
    Company(
      name: "Remote Control Productions",
      description:
          "Estúdio fundado por Hans Zimmer, que se tornou um importante centro de composição para trilhas sonoras. A empresa abriga vários compositores e músicos que colaboram em projetos de filmes e jogos.",
      logoUrl:
          "https://upload.wikimedia.org/wikipedia/commons/4/4d/Remote_Control_Productions_logo.png",
      websiteUrl: "https://www.remotecontrolproductions.com/",
    ),
    Company(
      name: "Warner Bros.",
      description:
          "Inclui a trilogia 'Batman' de Christopher Nolan e 'Harry Potter', onde a música de Zimmer ajudou a criar a atmosfera emocional dos filmes.",
      logoUrl:
          "https://upload.wikimedia.org/wikipedia/commons/5/5a/Warner_Bros_%28WB%29_logo.png",
      websiteUrl: "https://www.warnerbros.com/",
    ),
  ];

  // Função para abrir a URL
  void _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Empresas Famosas onde passou"),
        backgroundColor: Color(0xff000000),
      ),
      body: Column(
        children: companies.map((company) {
          return CompanyCard(
            company: company,
            onTap: () => _launchURL(company.websiteUrl),
          );
        }).toList(),
      ),
    );
  }
}

class Company {
  final String name;
  final String description;
  final String logoUrl;
  final String websiteUrl;

  Company({
    required this.name,
    required this.description,
    required this.logoUrl,
    required this.websiteUrl,
  });
}

class CompanyCard extends StatelessWidget {
  final Company company;
  final VoidCallback onTap;

  const CompanyCard({
    Key? key,
    required this.company,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: EdgeInsets.all(16),
        child: Column(
          children: [
            Image.network(company.logoUrl),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                company.description,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
