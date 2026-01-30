import 'package:flutter/material.dart';

class Artists extends StatefulWidget {
  const Artists({super.key});

  @override
  State<Artists> createState() => _ArtistsState();
}

class _ArtistsState extends State<Artists> with TickerProviderStateMixin {
  Color amarelo = Color(0xFFC0A045);
  Color preto = Color(0xFF1A180F);

  late TabController controller;

  List dados = [
    {
      "nome": "Leonardo da Vinci",
      "data": "1452 - 1519",
      "img": "assets/images/leonardo_da_vinci/leonardo_da_vinci.jpeg",
      "obras": [
        {
          "img": "assets/images/leonardo_da_vinci/mona_lisa.jpg",
          "tl": 999,
          "tr": 999,
          "bl": 999,
          "br": 999,
        },
        {
          "img": "assets/images/leonardo_da_vinci/lady_ermine.jpg",
          "tl": 0,
          "tr": 0,
          "bl": 999,
          "br": 999,
        },
        {
          "img": "assets/images/leonardo_da_vinci/litta_madonna.jpg",
          "tl": 0,
          "tr": 0,
          "bl": 0,
          "br": 0,
        },
      ],
    },

    {
      "nome": "Michelangelo",
      "data": "1475 - 1564",
      "img": "assets/images/michelangelo/michelangelo.jpg",
      "obras": [
        {
          "img": "assets/images/michelangelo/david.jpg",
          "tl": 0,
          "tr": 0,
          "bl": 999,
          "br": 999,
        },
        {
          "img": "assets/images/michelangelo/torment_of_saint_anthony.jpg",
          "tl": 999,
          "tr": 999,
          "bl": 999,
          "br": 999,
        },
        {
          "img": "assets/images/michelangelo/delphic_sibyl.jpg",
          "tl": 999,
          "tr": 999,
          "bl": 0,
          "br": 0,
        },
      ],
    },

    {
      "nome": "Gustav Klimt",
      "data": "1862 - 1918",
      "img": "assets/images/gustav_klimt/gustav_klimt.jpg",
      "obras": [
        {
          "img": "assets/images/gustav_klimt/the_kiss.jpg",
          "tl": 999,
          "tr": 999,
          "bl": 0,
          "br": 0,
        },
        {
          "img": "assets/images/gustav_klimt/adele_bloch_bauer.jpg",
          "tl": 0,
          "tr": 0,
          "bl": 0,
          "br": 0,
        },
        {
          "img": "assets/images/gustav_klimt/lady_with_fan.jpg",
          "tl": 999,
          "tr": 999,
          "bl": 999,
          "br": 999,
        },
      ],
    },
  ];

  @override
  void initState() {
    controller = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Container(height: 24),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 16,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Explore the art of",
                        style: TextStyle(fontSize: 32, color: preto),
                      ),
                      Text(
                        "Renaissance",
                        style: TextStyle(fontSize: 46, color: amarelo),
                      ),
                    ],
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Type to search…",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                      prefixIcon: Icon(Icons.search),
                      suffixIcon: Icon(Icons.fullscreen),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(
              width: width,
              height: 50,
              child: TabBar(
                controller: controller,
                tabs: [
                  Tab(key: Key('a'), text: "Artists"),
                  Tab(key: Key('b'), text: "Artworks"),
                ],
              ),
            ),
            Container(height: 16),
            Expanded(
              child: TabBarView(
                controller: controller,
                children: [
                  for (int i = 0; i < 2; i++)
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          for (var item in dados)
                            Padding(
                              padding: const EdgeInsets.only(bottom: 16),
                              child: Column(
                                children: [
                                  ListTile(
                                    title: Text(
                                      item['nome'],
                                      textAlign: item['nome'] == "Michelangelo"
                                          ? TextAlign.end
                                          : null,
                                    ),
                                    subtitle: Text(
                                      item['data'],
                                      textAlign: item['nome'] == "Michelangelo"
                                          ? TextAlign.end
                                          : null,
                                    ),
                                    leading: item['nome'] != "Michelangelo"
                                        ? CircleAvatar(
                                            backgroundImage: AssetImage(
                                              item['img'],
                                            ),
                                          )
                                        : null,
                                    trailing: item['nome'] == "Michelangelo"
                                        ? CircleAvatar(
                                            backgroundImage: AssetImage(
                                              item['img'],
                                            ),
                                          )
                                        : null,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: item['nome'] != "Michelangelo"
                                          ? 16
                                          : 0,
                                      right: item['nome'] == "Michelangelo"
                                          ? 16
                                          : 0,
                                    ),
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      reverse: item['nome'] == "Michelangelo",
                                      child: Row(
                                        children: [
                                          for (var obra in item['obras'])
                                            GestureDetector(
                                              onTap: () {
                                                if (item['nome'] ==
                                                    "Leonardo da Vinci") {
                                                  Navigator.pushNamed(
                                                    context,
                                                    '/exhibit',
                                                  );
                                                }
                                              },
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: 8,
                                                ),
                                                child: Container(
                                                  width: width * .33,
                                                  height: width * .43,

                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                      image: AssetImage(
                                                        obra['img'],
                                                      ),
                                                      fit: BoxFit.cover,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                obra['bl']
                                                                    .toDouble(),
                                                              ),
                                                          topLeft:
                                                              Radius.circular(
                                                                obra['tl']
                                                                    .toDouble(),
                                                              ),
                                                          topRight:
                                                              Radius.circular(
                                                                obra['tr']
                                                                    .toDouble(),
                                                              ),
                                                          bottomRight:
                                                              Radius.circular(
                                                                obra['br']
                                                                    .toDouble(),
                                                              ),
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
