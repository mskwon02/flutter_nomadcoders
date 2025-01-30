import 'package:flutter/material.dart';

class CurrencyCard extends StatelessWidget {
  final String name;
  final String amount;
  final String code;
  final IconData icon;
  final bool isReversed;
  final int order;

  const CurrencyCard(
      {super.key,
      required this.name,
      required this.amount,
      required this.code,
      required this.icon,
      required this.isReversed,
      required this.order});

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, order * (-20)),
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: isReversed ? const Color(0xff1f1f1f) : Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                        color:
                            isReversed ? Colors.white : const Color(0xff1f1f1f),
                        fontWeight: FontWeight.w600,
                        fontSize: 28),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Text(
                        amount,
                        style: TextStyle(
                            color: isReversed
                                ? Colors.white
                                : const Color(0xff1f1f1f),
                            fontWeight: FontWeight.w400,
                            fontSize: 18),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Text(
                        code,
                        style: TextStyle(
                          color: isReversed
                              ? Colors.white
                              : const Color(0xff1f1f1f),
                        ),
                      )
                    ],
                  )
                ],
              ),
              Transform.scale(
                scale: 2.2,
                child: Transform.translate(
                  offset: const Offset(-5, 12),
                  child: Icon(
                    icon,
                    color: isReversed ? Colors.white : const Color(0xff1f1f1f),
                    size: 88,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
