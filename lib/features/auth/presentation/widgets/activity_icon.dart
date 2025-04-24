import 'package:flutter/material.dart';

class ActivityIcon extends StatelessWidget {
  final String activity;
  final IconData icon;
  final String selectedActivity;
  final ValueChanged<String> onActivitySelected;

  const ActivityIcon({
    super.key,
    required this.activity,
    required this.icon,
    required this.selectedActivity,
    required this.onActivitySelected,
  });

  @override
  Widget build(BuildContext context) {
    final bool isSelected = selectedActivity == activity;

    return GestureDetector(
      onTap: () {
        onActivitySelected(activity);
      },
      child: Container(
        width: 64,
        height: 64,
        decoration: BoxDecoration(
          color: const Color(0xFFFFF8E1),
          borderRadius: BorderRadius.circular(16),
          border: isSelected ? Border.all(color: const Color(0xFF03045E), width: 2) : null,
        ),
        child: Icon(
          icon,
          color: const Color(0xFF03045E),
          size: 32,
        ),
      ),
    );
  }
} 
