// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';

class CRUDButton extends StatefulWidget {
  final VoidCallback onTap;
  final String buttonName;

  const CRUDButton({
    super.key,
    required this.buttonName,
    required this.onTap,
  });

  @override
  State<CRUDButton> createState() => _CRUDButtonState();
}

class _CRUDButtonState extends State<CRUDButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: 40,
        width: 150,
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            widget.buttonName,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
