import 'package:flutter/material.dart';

class PerfumingSelectionWidget extends StatefulWidget {
  const PerfumingSelectionWidget({super.key});

  @override
  State<PerfumingSelectionWidget> createState() =>
      _PerfumingSelectionWidgetState();
}

class _PerfumingSelectionWidgetState extends State<PerfumingSelectionWidget> {
  String? _selectedPerfume;
  final List<String> _perfumes = [
    'Oud Musk',
    'Musk',
    'Shaghaf Oud',
    'Inara',
    'Bahjah',
    'Najahi'
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Perfuming',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  'QR 03.05',
                  style: TextStyle(color: Colors.blue[700], fontSize: 12),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 5,
            runSpacing: 8,
            children: _perfumes.map((perfume) {
              bool isSelected = _selectedPerfume == perfume;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedPerfume = perfume;
                  });
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[300]!),
                    borderRadius: BorderRadius.circular(20),
                    color: isSelected ? Colors.blue[50] : Colors.white,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: isSelected ? Colors.blue : Colors.grey[400]!,
                            width: 2,
                          ),
                        ),
                        child: isSelected
                            ? Center(
                                child: Container(
                                  width: 12,
                                  height: 12,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.blue,
                                  ),
                                ),
                              )
                            : null,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        perfume,
                        style: TextStyle(
                          color: isSelected ? Colors.blue[700] : Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
