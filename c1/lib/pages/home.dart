import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late AnimationController controller;
  Animation<double>? animation;

  late AnimationController controller2;
  Animation<double>? animation2;
  Animation<double>? animation3;

  Color preto = Color(0xFF1C1C1C);
  Color amarelo = Color(0xFFC7A02D);
  Color amareloClaro = Color(0xFFCDC4A6);
  Color branco = Color(0xFF535353);

  String txt1 = "Experience Art";
  String txt2 =
      "We are thrilled to invite you to join us for an extraordinary event that will immerse you in the world of art.";

  List<String> txt1l = [];
  List<String> txt2l = [];

  animar() async {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    animation = Tween<double>(
      begin: 500.0,
      end: 30.0,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.linear));

    controller.addListener(() => setState(() {}));
    await controller.forward();

    for (int i = 0; i < txt1.length; i++) {
      txt1l.add(txt1[i]);
      setState(() {});
      await Future.delayed(const Duration(milliseconds: 100));
    }

    for (int i = 0; i < txt2.length; i++) {
      txt2l.add(txt2[i]);
      setState(() {});
      await Future.delayed(const Duration(milliseconds: 20));
    }

    controller2 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    animation2 = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: controller2, curve: Curves.linear));
    animation3 = Tween<double>(
      begin: 20,
      end: 0,
    ).animate(CurvedAnimation(parent: controller2, curve: Curves.linear));

    controller2.addListener(() => setState(() {}));
    await controller2.forward();
  }

  @override
  void initState() {
    animar();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: preto,
      body: SizedBox(
        width: width,
        height: height,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 32),
          child: Column(
            spacing: 40,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset("assets/images/logo.png", height: 70),
              Stack(
                alignment: AlignmentGeometry.bottomCenter,
                children: [
                  Container(
                    height: height * .56,
                    width: width,
                    padding: EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(999),
                        topRight: Radius.circular(999),
                      ),
                      border: Border.all(width: 2, color: amarelo),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(999),
                        topRight: Radius.circular(999),
                      ),
                      child: Image.asset(
                        "assets/images/louvre.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  Positioned(
                    bottom: 0,
                    child: Container(
                      height: animation?.value ?? 500.0,
                      width: width,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: preto,
                            blurRadius: 20,
                            spreadRadius: 30,
                            offset: Offset(0, -30),
                          ),
                        ],
                        color: preto,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 130,
                    child: Column(
                      spacing: 8,
                      children: [
                        Text(
                          txt1l.join(),
                          style: TextStyle(color: amareloClaro, fontSize: 32),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            txt2l.join(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFFBBBBBB),

                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              Transform.translate(
                offset: Offset(0, animation3?.value ?? 20),
                child: Opacity(
                  opacity: animation2?.value ?? 0,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: amarelo),
                    onPressed: () => Navigator.pushNamed(context, '/explore'),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 14,
                      ),
                      child: Text(
                        "Explore Now",
                        style: TextStyle(color: preto, fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
