import 'package:flutter/material.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    
    return Scaffold(
      backgroundColor: Color(0xFF1C1C1C),
      body: SizedBox(
        width: width,
        height: height,
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            spacing: 16,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(height: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Explore',
                    style: TextStyle(color: Color(0xFFEDDBBA), fontSize: 32),
                  ),
                  Divider(),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Upcoming Event',
                    style: TextStyle(color: Color(0xFFEEEEEE), fontSize: 20),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/ticketing'),
                    child: Row(
                      spacing: 4,
                      children: [
                        Text(
                          'Tickets',
                          style: TextStyle(
                            color: Color(0xFFEEEEEE),
                            fontSize: 14,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Color(0xFFEEEEEE),
                          size: 16,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFF333333),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                      ),
                      child: Image.asset("assets/images/renaissance.jpg"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(24),
                      child: Row(
                        spacing: 24,
                        children: [
                          Column(
                            children: [
                              Text(
                                "10",
                                style: TextStyle(
                                  color: Color(0xFFEEEEEE),
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "OCT",
                                style: TextStyle(
                                  color: Color(0xFFEEEEEE),
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              spacing: 8,
                              children: [
                                Text(
                                  "Renaissance Exhibition",
                                  style: TextStyle(
                                    color: Color(0xFFEEEEEE),
                                    fontSize: 20,
                                  ),
                                ),
                                Row(
                                  spacing: 8,
                                  children: [
                                    Text(
                                      "9:00 AM",
                                      style: TextStyle(
                                        color: Color(0xFFEEEEEE),
                                        fontSize: 16,
                                      ),
                                    ),
                                    Icon(
                                      Icons.arrow_forward,
                                      color: Color(0xFFEEEEEE),
                                      size: 16,
                                    ),
                                    Text(
                                      "6:00 PM",
                                      style: TextStyle(
                                        color: Color(0xFFEEEEEE),
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  "Indulge in the rich tapestry of Renaissance art",
                                  style: TextStyle(
                                    color: Color(0xFFC7A02D),
                                    fontSize: 16,
                                    decoration: TextDecoration.underline,
                                    decorationColor: Color(0xFFC7A02D),
                                    decorationThickness: 2,
                                  ),
                                ),
                                Text(
                                  "+33 (0)1 23 45 67 89",
                                  style: TextStyle(
                                    color: Color(0xFFEEEEEE),
                                    fontSize: 16,
                                    decoration: TextDecoration.underline,
                                    decorationColor: Color(0xFFEEEEEE),
                                    decorationThickness: 2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(context, '/artists'),
                      child: Container(
                        width: width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(8),
                            bottomRight: Radius.circular(8),
                          ),
                          color: Color(0xFFC7A02D),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: Center(
                          child: Text(
                            "Visit Gallery",
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xFF333333),
                              fontWeight: FontWeight.normal,
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
      ),
    );
  }
}

// 333333
// C7A02D
// EEEEEE
