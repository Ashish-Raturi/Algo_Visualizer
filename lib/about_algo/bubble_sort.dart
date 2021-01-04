import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BubbleSort extends StatelessWidget {
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
                  child: Text('Bubble Short',
                      style: GoogleFonts.raleway(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.pink,
                      )),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  'Bubble Sort is a simple algorithm which is used to sort a given set of n elements provided in form of an array with n number of elements. Bubble Sort compares all the element one by one and sort them based on their values.\n\nIf the given array has to be sorted in ascending order, then bubble sort will start by comparing the first element of the array with the second element, if the first element is greater than the second element, it will swap both the elements, and then move on to compare the second and the third element, and so on.\n\nIf we have total n elements, then we need to repeat this process for n-1 times.\n\nIt is known as bubble sort, because with every complete iteration the largest element in the given array, bubbles up towards the last place or the highest index, just like a water bubble rises up to the water surface.',
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
                  '•	Worst Case Time Complexity [ Big-O ]: O(n2) \n\n•	Best Case Time Complexity [Big-omega]: O(n)\n\n •	Average Time Complexity [Big-theta]: O(n2)\n\n •	Space Complexity: O(1)',
                  style: GoogleFonts.raleway(
                      fontSize: 18.0, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
