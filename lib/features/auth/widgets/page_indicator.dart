import 'package:flutter/material.dart';

class PageIndicator extends StatelessWidget {
  final int totalPages;
  final int currentPage;

  const PageIndicator({
    super.key,
    required this.totalPages,
    required this.currentPage,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(totalPages * 2 - 1, (index) {
        if (index % 2 == 0) {
          int pages = (index ~/ 2) + 1;
          bool isHighlighted = pages == currentPage;
          return CircleAvatar(
            radius: 15,
            backgroundColor:
                isHighlighted ? Theme.of(context).primaryColor : Colors.grey,
            child: Text(
              '$pages',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        } else {
          return const Padding(
            padding: EdgeInsets.all(4.0),
            child: SizedBox(
              width: 50,
              child: Divider(
                color: Colors.grey,
                thickness: 2,
              ),
            ),
          );
        }
      }),
    );
  }
}
