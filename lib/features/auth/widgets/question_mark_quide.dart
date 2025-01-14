import 'package:flutter/material.dart';

class QuestionMarkGuide extends StatelessWidget {
  final String guideText;

  const QuestionMarkGuide({
    super.key,
    required this.guideText,
  });

  void _showGuide(BuildContext context) {
    final overlay = Overlay.of(context);
    final renderBox = context.findRenderObject() as RenderBox;
    final position = renderBox.localToGlobal(Offset.zero);

    late OverlayEntry overlayEntry;

    overlayEntry = OverlayEntry(
      builder: (context) => Stack(
        children: [
          GestureDetector(
            onTap: () {
              overlayEntry.remove();
            },
            behavior: HitTestBehavior.translucent,
          ),
          Positioned(
            left: position.dx - 250,
            top: position.dy + renderBox.size.height + 5,
            child: Material(
              color: Colors.transparent,
              child: Container(
                constraints: const BoxConstraints(maxWidth: 300),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Text(
                        guideText,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                        ),
                        softWrap: true,
                      ),
                    ),
                    // Close button
                    Positioned(
                      top: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: () {
                          overlayEntry.remove();
                        },
                        child: const Icon(
                          Icons.close,
                          color: Colors.black,
                          size: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );

    overlay.insert(overlayEntry);

    ModalRoute.of(context)!.addLocalHistoryEntry(
      LocalHistoryEntry(onRemove: () {
        overlayEntry.remove();
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 35,
      width: 35,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          width: 1,
          style: BorderStyle.solid,
        ),
      ),
      child: IconButton(
        onPressed: () => _showGuide(context),
        icon: const Icon(
          Icons.question_mark,
          size: 15,
        ),
      ),
    );
  }
}
