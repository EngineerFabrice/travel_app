import 'package:flutter/material.dart';

class CustomStatusBar extends StatelessWidget {
  const CustomStatusBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Container(
        height: 24,
        color: Colors.black,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${DateTime.now().hour}:${DateTime.now().minute.toString().padLeft(2, '0')}',
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
            Row(
              children: const [
                Icon(Icons.signal_cellular_4_bar, color: Colors.white, size: 12),
                SizedBox(width: 4),
                Icon(Icons.wifi, color: Colors.white, size: 12),
                SizedBox(width: 4),
                Icon(Icons.battery_full, color: Colors.white, size: 12),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
