import 'package:flutter/material.dart';
import 'package:toonflix/widgets/button.dart';
import 'package:toonflix/widgets/currency_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: const Color(0xFF181818),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            const Text("Hey, Selena",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 34,
                                    fontWeight: FontWeight.w600)),
                            Text("welcome back",
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.8),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600)),
                          ])
                    ],
                  ),
                  const SizedBox(height: 60),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Total Balance",
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.6),
                            fontSize: 20,
                            fontWeight: FontWeight.w300),
                      ),
                      const Text(
                        "\$5 194 382",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 42,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Row(
                        children: [
                          MyButton(
                            txt: "Transform",
                            bgColor: Colors.yellow,
                            textColor: Colors.black,
                          ),
                          SizedBox(
                            width: 40,
                          ),
                          MyButton(
                            txt: "Request",
                            bgColor: Color(0xFF1F1F1F),
                            textColor: Colors.white,
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  const Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Wallets",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 28,
                            ),
                          ),
                          Text(
                            "view All",
                            style: TextStyle(
                                color: Color(0x66FFFFFF),
                                fontWeight: FontWeight.w200,
                                fontSize: 16),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      CurrencyCard(
                        name: "Euro",
                        code: "EUR",
                        amount: "6 787",
                        icon: Icons.euro_symbol_rounded,
                        isReversed: true,
                        order: 1,
                      ),
                      CurrencyCard(
                        name: "Bitcoin",
                        code: "9 763",
                        amount: "BTC",
                        icon: Icons.currency_bitcoin,
                        isReversed: false,
                        order: 2,
                      ),
                      CurrencyCard(
                        name: "Dollar",
                        code: "163",
                        amount: "USD",
                        icon: Icons.attach_money,
                        isReversed: true,
                        order: 3,
                      )
                    ],
                  )
                ],
              ),
            ),
          )),
    );
  }
}
