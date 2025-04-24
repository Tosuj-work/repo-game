import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class CharacterCustomization extends StatefulWidget {
  final String initialName;
  final String initialNumber;
  final Function(String name, String number) onCustomizationChanged;

  const CharacterCustomization({
    super.key,
    required this.initialName,
    required this.initialNumber,
    required this.onCustomizationChanged,
  });

  @override
  State<CharacterCustomization> createState() => _CharacterCustomizationState();
}

class _CharacterCustomizationState extends State<CharacterCustomization> {
  late TextEditingController _nameController;
  late TextEditingController _numberController;
  
  int _selectedShirtColor = 0;
  int _selectedPantsColor = 0;
  
  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.initialName);
    _numberController = TextEditingController(text: widget.initialNumber);
    
    // Добавляем слушатели для обновления персонажа при изменениях
    _nameController.addListener(_notifyChanges);
    _numberController.addListener(_notifyChanges);
  }
  
  @override
  void dispose() {
    _nameController.dispose();
    _numberController.dispose();
    super.dispose();
  }
  
  void _notifyChanges() {
    widget.onCustomizationChanged(_nameController.text, _numberController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.primary.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Настройки персонажа',
            style: TextStyle(
              color: AppColors.primary,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          
          // Имя персонажа
          TextField(
            controller: _nameController,
            decoration: const InputDecoration(
              labelText: 'Имя персонажа',
              prefixIcon: Icon(Icons.person),
              hintText: 'Введите имя',
            ),
          ),
          const SizedBox(height: 12),
          
          // Номер игрока
          TextField(
            controller: _numberController,
            decoration: const InputDecoration(
              labelText: 'Номер игрока',
              prefixIcon: Icon(Icons.tag),
              hintText: 'Введите номер',
            ),
            keyboardType: TextInputType.number,
            maxLength: 2,
          ),
          
          const SizedBox(height: 12),
          
          // Цвет футболки
          Text(
            'Цвет футболки:',
            style: TextStyle(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 40,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: AppColors.shirtColors.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedShirtColor = index;
                      _notifyChanges();
                    });
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    margin: const EdgeInsets.only(right: 8),
                    decoration: BoxDecoration(
                      color: AppColors.shirtColors[index],
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: _selectedShirtColor == index 
                            ? AppColors.accent 
                            : Colors.transparent,
                        width: 3,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          
          const SizedBox(height: 12),
          
          // Цвет шорт
          Text(
            'Цвет шорт:',
            style: TextStyle(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 40,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: AppColors.pantsColors.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedPantsColor = index;
                      _notifyChanges();
                    });
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    margin: const EdgeInsets.only(right: 8),
                    decoration: BoxDecoration(
                      color: AppColors.pantsColors[index],
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: _selectedPantsColor == index 
                            ? AppColors.accent 
                            : Colors.transparent,
                        width: 3,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
} 
