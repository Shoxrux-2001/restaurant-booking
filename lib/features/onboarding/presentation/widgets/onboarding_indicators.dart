import 'package:flutter/material.dart';

class OnboardingIndicators extends StatelessWidget {
  final int currentPage;
  final int pageCount;

  const OnboardingIndicators({
    Key? key,
    required this.currentPage,
    required this.pageCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(pageCount, (index) => Container(
        margin: const EdgeInsets.all(4),
        width: currentPage == index ? 10 : 6,
        height: 6,
        decoration: BoxDecoration(
          color: currentPage == index ? Colors.green : Colors.grey[300],
          shape: BoxShape.circle,
        ),
      )),
    );
  }
}