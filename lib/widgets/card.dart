import 'package:flutter/material.dart';

class CurrencCard extends StatelessWidget {
  final String moneyNameText;
  final String moneyUnitText;
  final String moneyText;
  final IconData moneyIcon;
  final bool isInverted;
  final _blackColor = const Color(0xFF1F2123);
  final int offsetNum;

  const CurrencCard({
    required this.moneyNameText,
    required this.moneyUnitText,
    required this.moneyText,
    required this.moneyIcon,
    required this.isInverted,
    required this.offsetNum,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, offsetNum * -20),
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: isInverted ? Colors.white : _blackColor,
        ),
        child: Padding(
          padding: EdgeInsets.all(25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    moneyNameText,
                    style: TextStyle(
                      color: isInverted ? _blackColor : Colors.white,
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        moneyText,
                        style: TextStyle(
                          color: isInverted ? _blackColor : Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        moneyUnitText,
                        style: TextStyle(
                          color: isInverted
                              ? _blackColor
                              : Colors.white.withAlpha(150),
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Transform.scale(
                scale: 2,
                child: Transform.translate(
                  offset: Offset(-5, 12),
                  child: Icon(
                    moneyIcon,
                    color: isInverted ? _blackColor : Colors.white,
                    size: 88,
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
