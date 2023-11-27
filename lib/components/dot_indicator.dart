import 'package:flutter/material.dart';

class DotIndicator extends StatefulWidget {
  const DotIndicator({Key? key, required this.pageCount, required this.pageIndex}) : super(key: key);
  final int pageCount;
  final int pageIndex;

  @override
  State<DotIndicator> createState() => _DotIndicatorState();
}

class _DotIndicatorState extends State<DotIndicator> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (20.0 * widget.pageCount),
      height: 10.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          for (var i = 0; i < widget.pageCount; i++)
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(i == widget.pageIndex ? 1.0 : 0.5),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
        ],
      ),
    );
  }
}
