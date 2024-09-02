import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final String image;
  final String name;
  final VoidCallback onTap;

  const ItemCard(
      {super.key,
      required this.image,
      required this.name,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        surfaceTintColor: Colors.white,
        color: Colors.grey[200],
        elevation: 1.0,
        margin: const EdgeInsets.all(8.0), // Adds margin around the card
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0), // Rounded corners
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    image,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color:
                      Colors.black, // Ensures text color is black for contrast
                ),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 5),
            //   child: Row(
            //     children: [
            // Expanded(
            //   child: Text(
            //     name,
            //     style: const TextStyle(
            //       fontWeight: FontWeight.bold,
            //       fontSize: 12,
            //       color: Colors
            //           .black, // Ensures text color is black for contrast
            //     ),
            //   ),
            // ),
            //       IconButton(
            //           onPressed: () {},
            //           icon: const Icon(
            //             Icons.add_circle_outline_rounded,
            //             color: Colors.blue,
            //           ))
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
