import 'package:flutter/material.dart';
import 'package:ice_laundry/app/widgets/addto_basket.dart';

import 'perfume_selection.dart';

class ItemDetails extends StatefulWidget {
  final String image;
  final String name;

  const ItemDetails({
    required this.image,
    required this.name,
    super.key,
  });

  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  int _dryCleanCount = 0;
  int _washAndIronCount = 0;
  int _pressOnlyCount = 0;

  void _incrementDryClean() {
    setState(() {
      _dryCleanCount++;
    });
  }

  void _decrementDryClean() {
    if (_dryCleanCount > 0) {
      setState(() {
        _dryCleanCount--;
      });
    }
  }

  void _incrementWashAndIron() {
    setState(() {
      _washAndIronCount++;
    });
  }

  void _decrementWashAndIron() {
    if (_washAndIronCount > 0) {
      setState(() {
        _washAndIronCount--;
      });
    }
  }

  void _incrementPressOnly() {
    setState(() {
      _pressOnlyCount++;
    });
  }

  void _decrementPressOnly() {
    if (_pressOnlyCount > 0) {
      setState(() {
        _pressOnlyCount--;
      });
    }
  }

  Widget _buildServiceRow(String serviceName, double price, int itemCount,
      Function increment, Function decrement) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                serviceName,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(color: Colors.grey[700]),
              ),
              Text(
                "QR ${itemCount * price}",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: Colors.grey[500]),
              ),
            ],
          ),
          itemCount == 0
              ? SizedBox(
                  height: 30,
                  child: ElevatedButton(
                    onPressed: () => increment(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[50], // Background color
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(20), // Border radius
                      ),
                    ),
                    child: Text('Add Item',
                        style: Theme.of(context).textTheme.labelLarge
                        // Text color
                        ),
                  ))
              : Container(
                  height: 30,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue), // Blue border color
                    borderRadius:
                        BorderRadius.circular(20), // Border radius of 20
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () => decrement(),
                        icon: const Icon(
                          Icons.remove,
                          size: 15,
                        ),
                      ),
                      Container(
                        width: 20,
                        alignment: Alignment.center,
                        child: Text(
                          itemCount.toString(),
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                      IconButton(
                        onPressed: () => increment(),
                        icon: const Icon(
                          Icons.add,
                          size: 15,
                        ),
                      ),
                    ],
                  ),
                ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 60,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 10, vertical: 5), // Add padding around the image
              child: Image.asset(
                "assets/images/arrow.png",
                height: 25,
              ),
            ),
          ),
        ),
        actions: [
          Card(
            margin: const EdgeInsets.all(5),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 10, vertical: 5), // Add padding around the image
              child: Image.asset(
                "assets/images/shopping-cart.png",
                height: 25,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                // Background image
                Image.asset(
                  "assets/images/background.png",
                  fit: BoxFit.cover, // Cover the entire screen
                ),
                // Foreground image
                SizedBox(
                  height: MediaQuery.of(context).size.height *
                      0.3, // 30% of the available height
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    widget.image,
                    fit: BoxFit.contain, // Adjust as needed
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                widget.name,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            _buildServiceRow("Dry Clean", 19.0, _dryCleanCount,
                _incrementDryClean, _decrementDryClean),
            const Divider(),
            const SizedBox(height: 10),
            _buildServiceRow("Wash&Iron", 15.0, _washAndIronCount,
                _incrementWashAndIron, _decrementWashAndIron),
            const Divider(),
            const SizedBox(height: 10),
            _buildServiceRow("Press Only", 10.0, _pressOnlyCount,
                _incrementPressOnly, _decrementPressOnly),
            const Divider(),
            const SizedBox(height: 10),
            const PerfumingSelectionWidget(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Text("Add your Instructions",
                  style: Theme.of(context).textTheme.titleMedium),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text("We are happy to hear from you.",
                  style: Theme.of(context).textTheme.bodyMedium),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  maxLines: 5,
                  decoration: InputDecoration(
                    border: InputBorder.none, // Remove the default border
                    hintText: 'Comment',
                    hintStyle:
                        TextStyle(color: Colors.grey[600]), // Hint text color
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 10), // Padding inside the text field
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AddToBasketButton(
                total: 10.00,
                onPressed: () {},
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
