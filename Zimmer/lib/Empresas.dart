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
          "https://www.dropbox.com/scl/fi/99002ofjsi19e2w68xk7j/377647785-cf865750-49c2-40be-91cd-dbd8f53088e4-removebg-preview.png?rlkey=k1l0zd8moivcl2hz66vj8c9au&st=filzjhef&raw=1",
      websiteUrl: "https://www.remotecontrolproductions.com/",
    ),
    Company(
      name: "Warner Bros.",
      description:
          "Inclui a trilogia 'Batman' de Christopher Nolan e 'Harry Potter', onde a música de Zimmer ajudou a criar a atmosfera emocional dos filmes.",
      logoUrl:
          "https://www.dropbox.com/scl/fi/f6n4qp0fck7leym3lowib/377638703-f3199a63-47af-4d40-8b4f-03c434225b30-removebg-preview.png?rlkey=t2xd3vvsgob7j677w7xhe7qgb&st=30uwkp2k&raw=1",
      websiteUrl: "https://www.warnerbros.com/",
    ),
    Company(
      name: "Disney",
      description:
          "A trilha sonora de O Rei Leão (1994) é uma das mais conhecidas e aclamadas, tendo recebido vários prêmios, incluindo um Oscar.",
      logoUrl:
          "https://www.dropbox.com/scl/fi/hikc2kboroh05uhrjn9cr/377639227-da6a9342-ffde-404d-a798-3beb10778fb3.jpg?rlkey=ww2ndjwogk8r4c9dsv2uah34o&st=jtn1gfdb&raw=1",
      websiteUrl: "https://www.disney.com.br/",
    ),
    Company(
      name: "DreamWorks",
      description:
          "Composições para Gladiador e a série Shrek, que mescla humor e emoção.",
      logoUrl:
          "https://www.dropbox.com/scl/fi/nnldcei8b6e2dv5f36siq/377640929-34eaa7b7-de47-436d-b438-6f9a19186481.jpg?rlkey=b3twkym44qx0yyw6aanhxkr09&st=jkon5zxl&raw=1",
      websiteUrl: "https://www.dreamworks.com/",
    ),
    Company(
      name: "20th Century Fox",
      description:
          " Inclui colaborações em filmes como O Código Da Vinci e A Origem.",
      logoUrl:
          "https://www.dropbox.com/scl/fi/ork2uyiy1pcv11wd2f3lw/377641714-09970339-f1ba-4574-a22c-7a31943cbbf2.jpg?rlkey=1bdc49qdzwhkf6fl6h2dsisco&st=691g55l8&raw=1",
      websiteUrl: "https://www.20thcenturystudios.com/",
    ),
    Company(
      name: "Universal Pictures",
      description:
          "Trabalhos em trilhas sonoras para filmes de ação e aventura, incluindo O Código Da Vinci.",
      logoUrl:
          "https://www.dropbox.com/scl/fi/a01tj6bw7gp1hirhip7c8/377642091-f18b215a-41b1-4fed-a737-a64a0ced8f0a.jpg?rlkey=f0amry1xrpvrquj7lkjvij9ly&st=sf9tjahe&raw=1",
      websiteUrl: "https://www.universalpictures.com/",
    ),
    Company(
      name: "Columbia Pictures",
      description:
          "Trabalhos em filmes como A Última Fronteira e A Guerra do Fogo.",
      logoUrl:
          "https://www.dropbox.com/scl/fi/y4oi17ouj60g6f63h6jv4/377643295-787ffa55-f8d5-4155-87f1-27449c474403.jpg?rlkey=pigpvnmbgr595jw8fh3an0uvn&st=r0ok5waa&raw=1",
      websiteUrl: "https://www.sonypictures.com/",
    ),
    Company(
      name: "New Line Cinema",
      description:
          "Colaborações com outros compositores na trilha sonora dos filmes.",
      logoUrl:
          "https://www.dropbox.com/scl/fi/virf8950q846n8tgydihg/377645137-fe21b5f0-638f-4390-b257-07faf499fd42.png?rlkey=6wnc41sy26i80g6cdxxf26dwr&st=an5zs8zl&raw=1",
      websiteUrl:
          "https://www.warnerbros.com/company/divisions/motion-pictures",
    ),
    Company(
      name: "Paramount Pictures",
      description:
          "Trabalhos em trilhas sonoras para filmes de ação e aventura.",
      logoUrl:
          "https://www.dropbox.com/scl/fi/xeyzbbb3asoissm5pji2z/377643869-7e236349-c27b-477f-8852-6066d66665df-removebg-preview.png?rlkey=87y6pccalac26i8xtmzsooq7x&st=k021cglc&raw=1",
      websiteUrl: "https://www.paramountpictures.com/",
    ),
    Company(
      name: "Sony Pictures Entertainment",
      description:
          "Trabalhos variados, incluindo trilhas sonoras para filmes de ação e drama.",
      logoUrl:
          "https://www.dropbox.com/scl/fi/ackkzsu8h7qz69cizavjl/377645662-099ec290-0934-4d65-bdd2-58e2bd89f6c0-removebg-preview.png?rlkey=9qytoa8xl6euunjdf0t0b031l&st=3mwrzcw4&raw=1",
      websiteUrl: "https://www.sonypictures.com/",
    ),
    Company(
      name: "Activision",
      description:
          "Composição para Call of Duty: Modern Warfare 2, onde sua música ajudou a intensificar a experiência de jogo.",
      logoUrl:
          "https://www.dropbox.com/scl/fi/pd26lq09icx57j2bch7vg/377648667-53b750a5-f262-4523-bf58-ac63fea23a5e.png?rlkey=wye5lwwrz3oua4yeomuhvtkjx&st=urphe5p9&raw=1",
      websiteUrl: "https://www.activision.com/",
    ),
    Company(
      name: "Interscope Records",
      description:
          "Trabalhos em trilhas sonoras e colaborações musicais com artistas",
      logoUrl:
          "https://www.dropbox.com/scl/fi/s0w1qp9v944rsr092o3bk/377648031-10f4312e-56b9-4a39-ba8b-21d5aeeb52cc-removebg-preview.png?rlkey=t1mo7juq7xtf3bji6b6296zi1&st=iwaz5u91&raw=1",
      websiteUrl:
          "https://interscope.com/?srsltid=AfmBOoqIdEWB_5OjzueeS9fC7XqtIsiz58mn_ruLwssC60k4cvwt02F7",
    ),
    Company(
      name: "Ubisoft",
      description:
          "Participação na trilha sonora do filme Assassin’s Creed, que é baseado na popular série de jogos.",
      logoUrl:
          "https://www.dropbox.com/scl/fi/mpo8tvn3ufm743810cqhs/377648732-68d9b3fd-c8c0-479e-9187-dc377c0ae085-removebg-preview.png?rlkey=xuigpu3bw2gblo610fdyi4y2k&st=ch49lmyh&raw=1",
      websiteUrl: "https://www.ubisoft.com/pt-br/",
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
      body: ListView(
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
