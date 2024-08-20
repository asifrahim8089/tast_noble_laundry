import 'package:flutter/material.dart';

class ItemDialog extends StatefulWidget {
  final String image;
  final String name;

  const ItemDialog({
    required this.image,
    required this.name,
    super.key,
  });

  @override
  State<ItemDialog> createState() => _ItemDialogState();
}

class _ItemDialogState extends State<ItemDialog> {
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          serviceName,
          style: Theme.of(context)
              .textTheme
              .titleSmall
              ?.copyWith(color: Colors.grey),
        ),
        Text(
          "QR ${itemCount * price}",
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: Colors.blue[900]),
        ),
        itemCount == 0
            ? SizedBox(
                height: 30,
                child: OutlinedButton(
                  onPressed: () => increment(),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.blue, // Text and icon color
                    side: const BorderSide(
                        color: Colors.blue), // Blue border color
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(20), // Border radius of 20
                    ),
                  ),
                  child: Text(
                    'Add Item',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
              )
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20),
            ),
            color: Colors.white,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        widget.name,
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.close,
                      color: Colors.black,
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
              SizedBox(
                height:
                    constraints.maxHeight * 0.5, // 50% of the available height
                width: constraints.maxWidth,
                child: Image.asset(
                  widget.image,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildServiceRow("Dry Clean", 19.0, _dryCleanCount,
                          _incrementDryClean, _decrementDryClean),
                      const SizedBox(height: 10),
                      _buildServiceRow("Wash&Iron", 15.0, _washAndIronCount,
                          _incrementWashAndIron, _decrementWashAndIron),
                      const SizedBox(height: 10),
                      _buildServiceRow("Press Only", 10.0, _pressOnlyCount,
                          _incrementPressOnly, _decrementPressOnly),
                      const SizedBox(height: 10),
                      Text(
                        "Kindly login to add items to basket or to place an order.",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(color: Colors.blue[900]),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.login,
                      color: Colors.white, // Icon color
                    ),
                    label: const Text(
                      'Login',
                      style: TextStyle(color: Colors.white), // Text color
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Colors.blue[900], // Button background color
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(15), // Border radius of 15
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
