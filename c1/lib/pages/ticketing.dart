import 'package:flutter/material.dart';

class Ticketing extends StatefulWidget {
  const Ticketing({super.key});

  @override
  State<Ticketing> createState() => _TicketingState();
}

class _TicketingState extends State<Ticketing> {
  Color preto = Color(0xFF1C1C1C);
  Color amarelo = Color(0xFFC7A02D);
  Color branco = Color(0xFFFBFBF9);

  int a = 0;
  int b = 0;

  int selecionado = 13;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: preto,
      body: SizedBox(
        width: width,
        height: height,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: width,
                      height: height * .35,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/museum.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Stack(
                        children: [
                          Opacity(
                            opacity: 1,
                            child: Container(
                              width: width,
                              height: height * .35,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    preto,
                                    preto.withOpacity(.7),
                                    amarelo.withOpacity(.01),
                                  ],
                                  begin: AlignmentGeometry.bottomCenter,
                                  end: AlignmentGeometry.topCenter,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: width,
                            height: height * .35,
                            child: Center(
                              child: Text(
                                "Official\nTicketing Service",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: branco,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "1. Date to visit",
                                style: TextStyle(color: amarelo, fontSize: 24),
                              ),
                              Row(
                                spacing: 8,
                                children: [
                                  Icon(
                                    Icons.arrow_back_ios_new_rounded,
                                    color: branco,
                                  ),
                                  Text(
                                    "September",
                                    style: TextStyle(
                                      color: branco,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: branco,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            width: width,
                            height: 58,
                            child: GridView.count(
                              physics: NeverScrollableScrollPhysics(),
                              crossAxisCount: 7,
                              padding: EdgeInsets.all(0),
                              children: [
                                for (String dia in [
                                  'Sum',
                                  'Mon',
                                  'Tue',
                                  'Wed',
                                  'Thu',
                                  'Fri',
                                  'Sat',
                                ])
                                  Center(
                                    child: Text(
                                      dia,
                                      style: TextStyle(
                                        color: amarelo,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: width,
                            height: 58 * 5,
                            child: GridView.count(
                              physics: NeverScrollableScrollPhysics(),
                              crossAxisCount: 7,
                              padding: EdgeInsets.all(0),
                              children: [
                                for (int dia in List.generate(
                                  30,
                                  (index) => index + 1,
                                ))
                                  GestureDetector(
                                    onTap: () {
                                      if (dia > 13 && dia != 17 && dia != 24) {
                                        selecionado = dia;
                                        setState(() {});
                                      }
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          999,
                                        ),
                                        border: dia == selecionado
                                            ? Border.all(
                                                width: 1,
                                                color: amarelo,
                                              )
                                            : null,
                                      ),
                                      child: Center(
                                        child: Text(
                                          dia.toString(),
                                          style: TextStyle(
                                            color:
                                                dia < 13 ||
                                                    dia == 17 ||
                                                    dia == 24
                                                ? branco.withOpacity(.4)
                                                : dia == 13
                                                ? amarelo
                                                : branco,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "2. Number of tickets",
                                style: TextStyle(color: amarelo, fontSize: 24),
                              ),
                            ],
                          ),
                          Container(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: width * .58,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "General Admission",
                                      style: TextStyle(
                                        color: branco,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      "€22",
                                      style: TextStyle(
                                        color: amarelo,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        if (b > 0) {
                                          b--;
                                          setState(() {});
                                        }
                                      },
                                      icon: Icon(Icons.remove, color: branco),
                                    ),
                                    SizedBox(
                                      width: 20,
                                      child: Center(
                                        child: Text(
                                          "$b",
                                          style: TextStyle(
                                            color: branco,
                                            fontSize: 24,
                                          ),
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        if (b < 9) {
                                          b++;
                                          setState(() {});
                                        }
                                      },
                                      icon: Icon(Icons.add, color: branco),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Container(height: 24),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: width * .58,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Under 18s, Under 26s residents of the EEA, Museum members, Professionals",
                                      style: TextStyle(
                                        color: branco,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      "FREE",
                                      style: TextStyle(
                                        color: amarelo,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        if (a > 0) {
                                          a--;
                                          setState(() {});
                                        }
                                      },
                                      icon: Icon(Icons.remove, color: branco),
                                    ),
                                    SizedBox(
                                      width: 20,
                                      child: Center(
                                        child: Text(
                                          "$a",
                                          style: TextStyle(
                                            color: branco,
                                            fontSize: 24,
                                          ),
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        if (a < 9) {
                                          a++;
                                          setState(() {});
                                        }
                                      },
                                      icon: Icon(Icons.add, color: branco),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: width,
              color: amarelo,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 24,
                  horizontal: 24,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total: €44',
                      style: TextStyle(color: preto, fontSize: 20),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: preto),
                      onPressed: () => (),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10,
                        ),
                        child: Text(
                          "Checkout",
                          style: TextStyle(color: amarelo, fontSize: 16),
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
    );
  }
}
