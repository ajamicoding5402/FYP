import 'package:flutter/material.dart';

class SectionCard extends StatelessWidget {
  const SectionCard({
    super.key,
    required this.title,
    this.altColor = false,
    required this.onclick,
    required this.desc,
  });

  final String title;
  final String desc;
  final bool altColor;
  final VoidCallback onclick;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        borderRadius: BorderRadius.circular(25),
        elevation: 20,
        child: Stack(
          children: <Widget>[
            // The outer container (The one on top)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.circular(25),
              ),
              constraints: const BoxConstraints(
                minHeight: 300,
                minWidth: double.infinity,
              ),
              child: Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              ),
            ),
            // The inner container (The colored one)
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                decoration: BoxDecoration(
                  color: altColor
                      ? const Color.fromRGBO(241, 117, 95, 1)
                      : const Color.fromRGBO(1, 72, 65, 1),
                  borderRadius: BorderRadius.circular(25),
                ),
                constraints: const BoxConstraints(
                  minHeight: 245,
                  minWidth: double.infinity,
                ),
                child: Text(
                  desc,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
            Positioned(
              right: 0,
              left: 0,
              bottom: 15,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton.icon(
                  style: ButtonStyle(
                    backgroundColor:
                        const MaterialStatePropertyAll(Colors.white),
                    foregroundColor: MaterialStatePropertyAll(
                      altColor
                          ? const Color.fromRGBO(241, 117, 95, 1)
                          : const Color.fromRGBO(1, 72, 65, 1),
                    ),
                  ),
                  onPressed: onclick,
                  icon: const Icon(Icons.gamepad_outlined),
                  label: Text(title),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
