import 'package:flutter/material.dart';

class CustomNavbar extends StatelessWidget {
  final VoidCallback onFeedPressed;
  final VoidCallback onCameraPressed;
  final VoidCallback onDashboardPressed;

  const CustomNavbar({
    Key? key,
    required this.onFeedPressed,
    required this.onCameraPressed,
    required this.onDashboardPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, bottom: 16),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: onFeedPressed,
              style: FilledButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(6),
                backgroundColor: const Color.fromARGB(146, 33, 37, 41),
              ),
              child: const Icon(
                Icons.ramen_dining,
                color: Colors.white,
                size: 40,
              ),
            ),
            FilledButton.tonal(
              onPressed: onCameraPressed,
              style: FilledButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(6),
                backgroundColor: const Color.fromARGB(146, 33, 37, 41),
              ),
              child: const Icon(
                Icons.circle,
                color: Color(0xFFfa5252),
                size: 54,
              ),
            ),
            FilledButton.tonal(
              onPressed: onDashboardPressed,
              style: FilledButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(6),
                backgroundColor: const Color.fromARGB(146, 33, 37, 41),
              ),
              child: const Icon(
                Icons.dashboard,
                color: Colors.white,
                size: 40,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
