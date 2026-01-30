import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Exhibit extends StatefulWidget {
  const Exhibit({super.key});

  @override
  State<Exhibit> createState() => _ExhibitState();
}

class _ExhibitState extends State<Exhibit> {
  Color preto = Color(0xFF1C1C1C);
  Color amarelo = Color(0xFFC7A02D);
  Color cinza = Color(0xFFBBBBBB);
  PageController controller = PageController(viewportFraction: .8);

  List dados = [];
  int index = 0;

  Future<void> startApp() async {
    String json = await rootBundle.loadString('assets/data/artworks.json');
    dados = jsonDecode(json);
    setState(() {});
  }

  @override
  void initState() {
    startApp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: preto,
      body: dados.isEmpty
          ? Center(child: CircularProgressIndicator())
          : SizedBox(
              width: width,
              height: height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: width,
                    height: height * .5,
                    child: PageView(
                      controller: controller,
                      onPageChanged: (value) {
                        index = value;
                        setState(() {});
                      },
                      children: [
                        for (var dado in dados)
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (dado['title'] != "Lady Ermine")
                                  Container(
                                    color: amarelo,
                                    child: ListTile(
                                      title: Text(dado['title']),
                                      subtitle: Text(
                                        "${dado['years']} - ${dado['born_at']}",
                                      ),
                                      trailing: CircleAvatar(
                                        backgroundColor: preto,
                                        child: Center(
                                          child: Icon(
                                            Icons.arrow_outward_rounded,
                                            color: cinza,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                SizedBox(
                                  width: width,
                                  height: height * .4,
                                  child: ClipRRect(
                                    borderRadius: BorderRadiusGeometry.only(
                                      bottomLeft: Radius.circular(
                                        dado['title'] == "Lady Ermine"
                                            ? 0
                                            : 999,
                                      ),
                                      bottomRight: Radius.circular(
                                        dado['title'] == "Lady Ermine"
                                            ? 0
                                            : 999,
                                      ),

                                      topLeft: Radius.circular(
                                        dado['title'] != "Lady Ermine"
                                            ? 0
                                            : 999,
                                      ),
                                      topRight: Radius.circular(
                                        dado['title'] != "Lady Ermine"
                                            ? 0
                                            : 999,
                                      ),
                                    ),
                                    child: Image.asset(
                                      'assets/images/leonardo_da_vinci/${dado['img']}.jpg',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                if (dado['title'] == "Lady Ermine")
                                  Container(
                                    color: amarelo,
                                    child: ListTile(
                                      title: Text(dado['title']),
                                      subtitle: Text(
                                        "${dado['years']} - ${dado['born_at']}",
                                      ),
                                      trailing: CircleAvatar(
                                        backgroundColor: preto,
                                        child: Center(
                                          child: Icon(
                                            Icons.arrow_outward_rounded,
                                            color: cinza,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 24,
                      horizontal: 50,
                    ),
                    child: Stack(
                      children: [
                        Transform.translate(
                          offset: Offset(-20, 0),
                          child: Opacity(
                            opacity: .3,
                            child: Image.asset(
                              "assets/images/quote.png",
                              height: 60,
                            ),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(0, 30),
                          child: Text(
                            dados[index]['comment'],
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize: 14),
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
