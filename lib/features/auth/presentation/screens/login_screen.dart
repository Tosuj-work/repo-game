import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repo_game/core/router/app_router.dart';
import 'package:repo_game/core/theme/app_theme.dart';
import 'package:repo_game/features/auth/presentation/bloc/auth_bloc.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() {
    if (_formKey.currentState?.validate() ?? false) {
      // Отправляем запрос на вход через BLoC
      context.read<AuthBloc>().add(AuthEvent.signInWithEmail(
            email: _emailController.text,
            password: 'dummy-password', // Фиктивный пароль
          ));
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
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            state.maybeWhen(
              authenticated: (_) {
                context.router.replace(const MainTabsRoute());
              },
              userNotFound: (email) {
                // Если пользователь не найден, показываем сообщение и перенаправляем на регистрацию
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Пользователь не найден. Пожалуйста, зарегистрируйтесь'),
                    backgroundColor: Colors.orange,
                  ),
                );
                // Задержка позволяет увидеть сообщение перед переходом на экран регистрации
                Future.delayed(const Duration(seconds: 1), () {
                  if (context.mounted) {
                    context.router.push(RegisterRoute(email: email));
                  }
                });
              },
              error: (message) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(message),
                    backgroundColor: Colors.red,
                  ),
                );
              },
              orElse: () {},
            );
          },
          builder: (context, state) {
            return SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  child: Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 24),
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFF8E1), // Светло-желтый фон для блока
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
                        children: [
                          // Название (сначала заголовок, потом лого)
                          const Text(
                            'SPORT\nCHALLENGES',
                            style: TextStyle(
                              color: Color(0xFF03045E),
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              height: 1.1,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 24),

                          // Лого
                          Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                              color: const Color(0xFF1696A1),
                              borderRadius: BorderRadius.circular(60),
                            ),
                            child: Center(
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  const Icon(
                                    Icons.terrain,
                                    size: 70,
                                    color: Colors.white,
                                  ),
                                  Positioned(
                                    top: 22,
                                    right: 24,
                                    child: Container(
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: const Icon(
                                        Icons.flag,
                                        size: 12,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 40),

                          // Email поле
                          Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFFADE8F4).withOpacity(0.5),
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: Colors.white,
                                width: 2,
                              ),
                            ),
                            child: TextFormField(
                              controller: _emailController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: const InputDecoration(
                                hintText: 'Email',
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 18),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Введите email';
                                }
                                if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                                  return 'Введите корректный email';
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(height: 16),

                          // Кнопка входа
                          SizedBox(
                            width: double.infinity,
                            height: 56,
                            child: ElevatedButton(
                              onPressed: state.maybeWhen(
                                loading: () => null,
                                orElse: () => _login,
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFF9B64B),
                                foregroundColor: const Color(0xFF03045E),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: state.maybeWhen(
                                loading: () => const CircularProgressIndicator(
                                  color: Color(0xFF03045E),
                                ),
                                orElse: () => const Text(
                                  'Log In',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 24),

                          // Забыли пароль
                          TextButton(
                            onPressed: () {
                              // Действие для сброса пароля
                            },
                            child: const Text(
                              'Forgot password?',
                              style: TextStyle(
                                color: Color(0xFF1696A1),
                                fontSize: 16,
                              ),
                            ),
                          ),

                          // Регистрация
                          TextButton(
                            onPressed: () {
                              context.router.push(RegisterRoute());
                            },
                            child: const Text(
                              'Sign Up',
                              style: TextStyle(
                                color: Color(0xFF1696A1),
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
