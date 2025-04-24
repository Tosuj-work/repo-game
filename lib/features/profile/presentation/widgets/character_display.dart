import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class CharacterDisplay extends StatelessWidget {
  final String name;
  final String number;
  final Color? shirtColor;
  final Color? pantsColor;

  const CharacterDisplay({
    super.key,
    required this.name,
    required this.number,
    this.shirtColor,
    this.pantsColor,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Фон для персонажа
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.background,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  spreadRadius: 5,
                ),
              ],
            ),
          ),
          
          // Персонаж
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Голова
              Container(
                width: 60,
                height: 60,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFFFC107), // Цвет лица
                ),
                child: Stack(
                  children: [
                    // Глаза
                    Positioned(
                      top: 20,
                      left: 12,
                      child: Container(
                        width: 10,
                        height: 10,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 20,
                      right: 12,
                      child: Container(
                        width: 10,
                        height: 10,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    
                    // Улыбка
                    Positioned(
                      bottom: 15,
                      left: 20,
                      child: Container(
                        width: 20,
                        height: 5,
                        decoration: const BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 5),
              
              // Футболка
              Container(
                width: 80,
                height: 50,
                decoration: BoxDecoration(
                  color: shirtColor ?? AppColors.shirtColors[0],
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Center(
                  child: Text(
                    number,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              
              // Руки
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 15,
                    height: 30,
                    decoration: BoxDecoration(
                      color: shirtColor ?? AppColors.shirtColors[0],
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(width: 50),
                  Container(
                    width: 15,
                    height: 30,
                    decoration: BoxDecoration(
                      color: shirtColor ?? AppColors.shirtColors[0],
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
              
              // Штаны
              Container(
                width: 50,
                height: 40,
                decoration: BoxDecoration(
                  color: pantsColor ?? AppColors.pantsColors[0],
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
              ),
              
              // Ноги
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 15,
                    height: 30,
                    decoration: BoxDecoration(
                      color: pantsColor ?? AppColors.pantsColors[0],
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Container(
                    width: 15,
                    height: 30,
                    decoration: BoxDecoration(
                      color: pantsColor ?? AppColors.pantsColors[0],
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
} 
