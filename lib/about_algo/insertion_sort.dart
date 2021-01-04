import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InsertionSort extends StatelessWidget {
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
                  child: Text('Insertion Short',
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
                  'Consider you have 10 cards out of a deck of cards in your hand. And they are sorted, or arranged in the ascending order of their numbers.\n\nIf I give you another card, and ask you to insert the card in just the right position, so that the cards in your hand are still sorted. What will you do?\n\nWell, you will have to go through each card from the starting or the back and find the right position for the new card, comparing it\'s value with each card. Once you find the right position, you will insert the card there.\n\nSimilarly, if more new cards are provided to you, you can easily repeat the same process and insert the new cards and keep the cards sorted too.\n\nThis is exactly how insertion sort works. It starts from the index 1(not 0), and each index starting from index 1 is like a new card, that you have to place at the right position in the sorted subarray on the left.',
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
                Text(
                  '\n•	Worst Case Time Complexity [ Big-O ]: O(n2)\n\n•	Best Case Time Complexity [Big-omega]: O(n)\n\n•	Average Time Complexity [Big-theta]: O(n2)\n\n•	Space Complexity: O(1)',
                  style: GoogleFonts.raleway(
                      fontSize: 18.0, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 20.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
