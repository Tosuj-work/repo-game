import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repo_game/core/router/app_router.dart';
import 'package:repo_game/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:repo_game/features/auth/presentation/widgets/activity_icon.dart';
import 'package:repo_game/features/auth/presentation/widgets/custom_text_field.dart';

@RoutePage()
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key, this.email});

  final String? email;

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _nameController = TextEditingController();
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();
  final _ageController = TextEditingController();
  String _selectedSex = 'Мужской';
  String _selectedActivity = 'walking';
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  StreamSubscription? _registerBlocSubscription;

  @override
  void dispose() {
    _nameController.dispose();
    _heightController.dispose();
    _weightController.dispose();
    _ageController.dispose();
    _registerBlocSubscription?.cancel();
    super.dispose();
  }

  void _register() {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        _isLoading = true;
      });

      // Получаем данные из формы
      final name = _nameController.text;
      final heightStr = _heightController.text;
      final weightStr = _weightController.text;
      final ageStr = _ageController.text;

      // Конвертируем строки в числа, если они не пустые
      final height = heightStr.isNotEmpty ? int.tryParse(heightStr) : null;
      final weight = weightStr.isNotEmpty ? int.tryParse(weightStr) : null;
      final age = ageStr.isNotEmpty ? int.tryParse(ageStr) : null;

      // Получаем email из маршрута (если есть)
      final email = widget.email ?? 'user${DateTime.now().millisecondsSinceEpoch}@example.com';

      // Используем BLoC для обновления профиля пользователя
      final bloc = context.read<AuthBloc>();

      // Сначала регистрируем пользователя с временным паролем
      bloc.add(AuthEvent.signUpWithEmail(
        email: email,
        password: 'password123', // В реальном приложении нужно генерировать сложный пароль
        username: name,
      ));

      // Слушаем состояние блока для обработки результата
      _registerBlocSubscription = bloc.stream.listen((state) {
        state.maybeWhen(
          authenticated: (_) {
            // Пользователь успешно зарегистрирован, обновляем его профиль
            bloc.add(AuthEvent.updateUserProfile(
              email: email,
              username: name,
              height: height,
              weight: weight,
              age: age,
              sex: _selectedSex,
              mainActivity: _selectedActivity,
            ));

            // После успешного обновления профиля перенаправляем на домашний экран
            context.router.replace(const MainTabsRoute());

            // Обнуляем состояние загрузки
            if (mounted) {
              setState(() {
                _isLoading = false;
              });
            }
          },
          error: (message) {
            // Показываем ошибку
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(message),
                backgroundColor: Colors.red,
              ),
            );

            // Обнуляем состояние загрузки
            if (mounted) {
              setState(() {
                _isLoading = false;
              });
            }
          },
          orElse: () {},
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF90E0C5), // Верхний цвет (бирюзовый)
              Color(0xFFFFF8E1), // Нижний цвет (светло-желтый)
            ],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 24),
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: const Color(0xFF90E0C5), // Бирюзовый фон для блока
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  ),
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Заголовок
                      const Text(
                        'REGISTER',
                        style: TextStyle(
                          color: Color(0xFF03045E),
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 30),

                      // Поле имени
                      CustomTextField(
                        controller: _nameController,
                        hint: 'Name',
                        keyboardType: TextInputType.name,
                      ),
                      const SizedBox(height: 20),

                      // Строка с полем для пола и роста
                      Row(
                        children: [
                          // Поле для пола
                          Expanded(
                            child: CustomTextField(
                              hint: 'Sex',
                              readOnly: true,
                              onTap: () => _showSexPicker(),
                              initialValue: _selectedSex,
                            ),
                          ),
                          const SizedBox(width: 16),
                          // Поле для роста
                          Expanded(
                            child: CustomTextField(
                              controller: _heightController,
                              hint: 'Height',
                              keyboardType: TextInputType.number,
                              suffix: 'см',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),

                      // Строка с полем для веса и возраста
                      Row(
                        children: [
                          // Поле для веса
                          Expanded(
                            child: CustomTextField(
                              controller: _weightController,
                              hint: 'Weight',
                              keyboardType: TextInputType.number,
                              suffix: 'кг',
                            ),
                          ),
                          const SizedBox(width: 16),
                          // Поле для возраста
                          Expanded(
                            child: CustomTextField(
                              controller: _ageController,
                              hint: 'Age',
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),

                      // Выбор основной активности
                      const Text(
                        'Main Activity',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF03045E),
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Иконки активностей
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ActivityIcon(
                              activity: 'cycling',
                              icon: Icons.directions_bike,
                              selectedActivity: _selectedActivity,
                              onActivitySelected: (activity) {
                                setState(() {
                                  _selectedActivity = activity;
                                });
                              },
                            ),
                            ActivityIcon(
                              activity: 'walking',
                              icon: Icons.directions_walk,
                              selectedActivity: _selectedActivity,
                              onActivitySelected: (activity) {
                                setState(() {
                                  _selectedActivity = activity;
                                });
                              },
                            ),
                            ActivityIcon(
                              activity: 'running',
                              icon: Icons.directions_run,
                              selectedActivity: _selectedActivity,
                              onActivitySelected: (activity) {
                                setState(() {
                                  _selectedActivity = activity;
                                });
                              },
                            ),
                            ActivityIcon(
                              activity: 'swimming',
                              icon: Icons.pool,
                              selectedActivity: _selectedActivity,
                              onActivitySelected: (activity) {
                                setState(() {
                                  _selectedActivity = activity;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),

                      // Кнопка регистрации
                      SizedBox(
                        height: 56,
                        child: ElevatedButton(
                          onPressed: _isLoading ? null : _register,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFF9B64B),
                            foregroundColor: const Color(0xFF03045E),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          child: _isLoading
                              ? const CircularProgressIndicator(
                                  color: Color(0xFF03045E),
                                )
                              : const Text(
                                  'Sign Up',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showSexPicker() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Выберите пол',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              ListTile(
                title: const Text('Мужской'),
                onTap: () {
                  setState(() {
                    _selectedSex = 'Мужской';
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Женский'),
                onTap: () {
                  setState(() {
                    _selectedSex = 'Женский';
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
