import 'package:flutter/material.dart';
import 'package:flutter_puzzle/puzzle/widget/grid_widget.dart';

class PuzzlePage extends StatefulWidget {
  const PuzzlePage({Key? key}) : super(key: key);

  @override
  State<PuzzlePage> createState() => _PuzzlePageState();
}

class _PuzzlePageState extends State<PuzzlePage> {
  final _numbers = [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15,16];
  final _indexes =[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15,16];
  var _moves =0;
  @override
  void initState() {
    _numbers.shuffle();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Puzzle'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 24,
          ),
          Text('Moves: $_moves',style: const TextStyle(fontSize: 25),),
          const SizedBox(
            height: 24,
          ),
          GridWidget(onItemClick: _onItemClick, numbers: _numbers,indexes: _indexes,),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: MaterialButton(
              minWidth: 200,
              height: 40,
              color: Colors.blueAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16)
              ),
              child: const Text('Shuffle',style: TextStyle(color: Colors.white,fontSize: 20),),
              onPressed: (){
                _numbers.shuffle();
                setState(() {
                  _moves=0;
                });
              },
            ),
          )
        ],
      ),
    );
  }

  void _onItemClick(int index) {
    if (_canMove(index)) {
      setState(() {
        _numbers[_numbers.indexOf(16)] = _numbers[index];
        _numbers[index] = 16;
        ++_moves;
      });
    }
  }

  bool _canMove(int index){
    if(index+1<16 && _numbers[index+1]==16 && (index+1)%4!=0) {
      return true;
    }
    if(index-1>=0 && _numbers[index-1]==16 && index%4!=0) {
      return true;
    }
    if(index+4<16 && _numbers[index+4]==16) {
      return true;
    }
    if(index-4 >=0 && _numbers[index-4]==16) {
      return true;
    }
    return false;
  }
}
