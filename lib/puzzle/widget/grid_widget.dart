import 'package:flutter/material.dart';

class GridWidget extends StatelessWidget {
  const GridWidget(
      {Key? key,
      required this.onItemClick,
      required this.numbers,
      required this.indexes})
      : super(key: key);
  final Function(int) onItemClick;
  final List<int> numbers;
  final List<int> indexes;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
          shrinkWrap: true,
          itemCount: numbers.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4),
          itemBuilder: (_, index) {
            return numbers[index] == 16
                ? const SizedBox.shrink()
                : _sliderItem(index, MediaQuery.of(context).size.width / 4.1);
          }),
    );
  }

  bool _isInPosition(int index) {
    return indexes[index] == numbers[index];
  }

  Widget _sliderItem(int index, double width) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: InkWell(
        onTap: () => onItemClick(index),
        child: Container(
          width: width,
          height: width,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: _isInPosition(index)
                  ? const Color(0xff16a085)
                  : const Color(0xff95a5a6),
              borderRadius: BorderRadius.circular(8)),
          child: Text(
            numbers[index].toString(),
            style: const TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
