import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectionSort extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.amber,
        body: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Hero(
                  tag: 'algo',
                  child: Text(
                    'Selection Short',
                    style: GoogleFonts.raleway(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.pink,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  'Selection sort is conceptually the most simplest sorting algorithm. This algorithm will first find the smallest element in the array and swap it with the element in the first position, then it will find the second smallest element and swap it with the element in the second position, and it will keep on doing this until the entire array is sorted.\n\nIt is called selection sort because it repeatedly selects the next-smallest element and swaps it into the right place.',
                  style: GoogleFonts.raleway(
                      fontSize: 18.0, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  'Time Complexity',
                  style: GoogleFonts.raleway(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.pink,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  '•	Worst Case Time Complexity [ Big-O ]: O(n2)\n\n•	Best Case Time Complexity [Big-omega]: O(n2)\n\n•	Average Time Complexity [Big-theta]: O(n2)\n\n•	Space Complexity: O(1)\n\n',
                  style: GoogleFonts.raleway(
                      fontSize: 18.0, fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
