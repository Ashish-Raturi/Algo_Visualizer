import 'dart:async';
import 'dart:math';
import 'package:algo_visualizer/about_algo/bubble_sort.dart';
import 'package:algo_visualizer/about_algo/insertion_sort.dart';
import 'package:algo_visualizer/about_algo/selection_sort.dart';
import 'package:algo_visualizer/stick_painter.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<int> lines;
  int numberOfLines = 12;
  bool isSorting = false;
  bool isSorted = false;
  String algoDropdownValue = 'Bubble Sort';
  String speedDropdownValue = 'Normal';
  int speed = 1500;
  var random = Random();
  String console = '';
  List<int> coloredIndex;
  List<int> swapedIndex;
  bool swaped = false;
  bool swapColor = false;

  @override
  void initState() {
    super.initState();
    lines = List<int>(numberOfLines);
    coloredIndex = List<int>(2);
    coloredIndex[0] = -1;
    coloredIndex[1] = -1;
    swapedIndex = List<int>(2);
    swapedIndex[0] = -1;
    swapedIndex[1] = -1;
    _randomize();
  }

  _randomize() {
    setState(() {
      isSorted = false;
      isSorting = false;
      console =
          'Welcome Algo Visualizer\n\nDeveloped By ~ Ashish Raturi \n\nDeveloped In ~ Flutter \n\nTime Taken in Development ~ 1 Progressive week \n\nRandomizeing Done';
      for (int i = 0; i < numberOfLines; i++) {
        int temp = random.nextInt(100);
        if (temp < 10) {
          temp += 10;
        }
        lines[i] = temp;
      }
    });
  }

  _consoleIntro() {
    setState(() {
      console +=
          '\n\nStarting Sorting ... \n\nAlgorithm ~ $algoDropdownValue,\t Speed ~ $speedDropdownValue';
    });
  }

  _swap(int firstIndex, int secondIndex) {
    console += '\n\nswap ${lines[firstIndex]} and ${lines[secondIndex]}';
    int temp;
    temp = lines[firstIndex];
    lines[firstIndex] = lines[secondIndex];
    lines[secondIndex] = temp;
  }

  _bubbleSort() async {
    _consoleIntro();
    setState(() {
      isSorting = true;
      isSorted = false;
      console += '\n\nOrignal Array = ${lines.toString()}';
    });
    for (int i = numberOfLines - 1; i > 0; i--) {
      for (int j = 0; j < i; j++) {
        coloredIndex[0] = j;
        coloredIndex[1] = j + 1;
        if (lines[j] > lines[j + 1]) {
          await Future.delayed(Duration(milliseconds: speed));
          setState(() {
            swaped = true;
          });
          _swap(j, j + 1);
        }
        await Future.delayed(Duration(milliseconds: speed));
        setState(() {
          swaped = false;
        });
      }
    }
    setState(() {
      console += '\n\nSorted Array = ${lines.toString()}';
      isSorting = false;
      isSorted = true;
      coloredIndex[0] = -1;
      coloredIndex[1] = -1;
    });
  }

  _selectionSort() async {
    _consoleIntro();
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      isSorting = true;
      isSorted = false;
      console += '\n\nOrignal Array = ${lines.toString()}';
    });

    for (int i = 0; i < lines.length; i++) {
      int minValue = lines[i];
      int minIndex = i;
      coloredIndex[0] = i;
      for (int j = minIndex + 1; j < lines.length; j++) {
        setState(() {
          swapColor = false;
          coloredIndex[1] = j;
        });

        if (minValue > lines[j]) {
          minIndex = j;
          minValue = lines[j];
          await Future.delayed(Duration(milliseconds: 200));
          setState(() {
            swapColor = true;
          });
        }
        await Future.delayed(Duration(milliseconds: speed));
      }
      swapedIndex[0] = i;
      swapedIndex[1] = minIndex;
      setState(() {
        swaped = true;
      });

      _swap(i, minIndex);
      await Future.delayed(Duration(milliseconds: speed));
      setState(() {
        swaped = false;
      });
    }
    setState(() {
      console += '\n\nSorted Array = ${lines.toString()}';
      isSorting = false;
      isSorted = true;
      coloredIndex[0] = -1;
      coloredIndex[1] = -1;
    });
  }

  _insertionSort() async {
    _consoleIntro();
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      isSorting = true;
      isSorted = false;
      console += '\n\nOrignal Array = ${lines.toString()}';
    });

    for (int i = 1; i < lines.length; i++) {
      int key = lines[i];
      int j = i - 1;
      coloredIndex[0] = i;
      await Future.delayed(Duration(milliseconds: speed));
      setState(() {
        coloredIndex[0] = -1;
        coloredIndex[1] = i;
      });

      //move element which is greater than key
      while (j >= 0 && lines[j] > key) {
        await Future.delayed(Duration(milliseconds: 1500));
        setState(() {
          coloredIndex[1] = j;
        });
        lines[j + 1] = lines[j];
        j--;
      }
      setState(() {
        coloredIndex[1] = j + 1;
        console += '\n\nInsert $key';
      });

      lines[j + 1] = key;

      await Future.delayed(Duration(milliseconds: speed));

      setState(() {
        coloredIndex[1] = -1;
      });
    }
    setState(() {
      isSorting = false;
      isSorted = true;
      console += '\n\nSorted Array = ${lines.toString()}';
      coloredIndex[0] = -1;
      coloredIndex[1] = -1;
    });
  }

  _selectAlgorithm() {
    switch (algoDropdownValue) {
      case 'Bubble Sort':
        _bubbleSort();
        break;
      case 'Selection Sort':
        _selectionSort();
        break;
      case 'Insertion Sort':
        _insertionSort();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.amber,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'Algorithm Visualizer',
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: [
                      Text(
                        'Shorting Algorithm\t\t:-\t\t',
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.w500),
                      ),
                      DropdownButton<String>(
                        value: algoDropdownValue,
                        dropdownColor: Colors.orange,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 18.0),
                        icon: Icon(
                          Icons.arrow_downward,
                          color: Colors.black,
                        ),
                        hint: Text(algoDropdownValue),
                        iconSize: 24,
                        underline: Container(
                          height: 2,
                          color: Colors.black,
                        ),
                        onChanged: (String value) {
                          setState(() {
                            algoDropdownValue = value;
                            console += '\n\nSorting Algorithm is set to $value';
                          });
                        },
                        items: !isSorting
                            ? <String>[
                                'Bubble Sort',
                                'Selection Sort',
                                'Insertion Sort',
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  child: Text(value),
                                  value: value,
                                );
                              }).toList()
                            : null,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: [
                      Text(
                        'Speed\t\t:-\t\t',
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.w500),
                      ),
                      DropdownButton<String>(
                        value: speedDropdownValue,
                        dropdownColor: Colors.orange,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 18.0),
                        icon: Icon(
                          Icons.arrow_downward,
                          color: Colors.black,
                        ),
                        iconSize: 24,
                        underline: Container(
                          height: 2,
                          color: Colors.black,
                        ),
                        onChanged: (String value) {
                          setState(() {
                            speedDropdownValue = value;
                            console += "\n\nSorting Speed is set to $value";
                            if (value == 'Slow') {
                              speed = 1750;
                            } else if (value == 'Normal') {
                              speed = 1500;
                            } else if (value == 'Fast') {
                              speed = 1000;
                            } else if (value == 'Very Fast') {
                              speed = 500;
                            }
                          });
                        },
                        items: <String>['Slow', 'Normal', 'Fast', 'Very Fast']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            child: Text(value),
                            value: value,
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Console',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      GestureDetector(
                        onTap: () {
                          switch (algoDropdownValue) {
                            case 'Bubble Sort':
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      BubbleSort()));
                              break;
                            case 'Insertion Sort':
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      InsertionSort()));
                              break;
                            case 'Selection Sort':
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      SelectionSort()));
                              break;
                          }
                        },
                        child: Hero(
                          tag: 'algo',
                          child: Text("$algoDropdownValue ?",
                              style: TextStyle(
                                  color: Colors.pink,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w500,
                                  decoration: TextDecoration.underline)),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    padding: EdgeInsets.all(5.0),
                    width: double.maxFinite,
                    height: 160.0,
                    color: Colors.black,
                    child: SingleChildScrollView(
                      reverse: true,
                      child: Text(
                        console,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  CustomPaint(
                      painter: StickPainter(
                          lines: lines,
                          width: width,
                          height: height,
                          coloredIndex: coloredIndex,
                          swap: swaped,
                          swapColor: swapColor,
                          algoDropdownValue: algoDropdownValue,
                          swapedIndex: swapedIndex)),
                  SizedBox(
                    height: 200.0,
                  ),
                ],
              )),
        ),
      ),
      bottomNavigationBar: Row(
        children: [
          Expanded(
            child: FlatButton(
              child: Text(
                'Randomize',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onPressed: isSorting ? null : _randomize,
            ),
          ),
          Expanded(
            child: FlatButton(
              child: Text(
                'Start Sorting',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onPressed: isSorting || isSorted ? null : _selectAlgorithm,
            ),
          )
        ],
      ),
    );
  }
}
