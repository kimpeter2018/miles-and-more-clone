import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:miles_and_more_clone/features/auth/auth_controller.dart';
import 'package:miles_and_more_clone/features/auth/screens/register_name_screen.dart';
import 'package:miles_and_more_clone/features/auth/widgets/page_indicator.dart';
import 'package:miles_and_more_clone/features/auth/widgets/password_textfield.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  static const String routeName = '/register-screen';

  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String? emailError;
  String? passwordError;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 228, 228, 228),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        margin: const EdgeInsets.fromLTRB(20.0, 35.0, 20.0, 20.0),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const PageIndicator(
              totalPages: 2,
              currentPage: 1,
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              'Specify your access details',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(
              height: 40,
            ),
            const Text('Please enter your email address and set a password.'),
            const SizedBox(
              height: 20,
            ),
            const Text(
                'If you don\'t habe a Miles & More account yet, you can register for Travel ID.'),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: ValueListenableBuilder<TextEditingValue>(
                valueListenable: emailController,
                builder: (context, value, child) {
                  return TextField(
                    controller: emailController,
                    onTapOutside: (event) {
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    decoration: InputDecoration(
                        border: const UnderlineInputBorder(),
                        labelText: 'Email address',
                        errorText: emailError),
                  );
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: ObscureTextField(
                error: passwordError,
                controller: passwordController,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () async {
                  final email = emailController.text;
                  final password = passwordController.text;
                  final isEmail = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(emailController.text);
                  final isInUse = await ref
                      .read(authControllerProvider.notifier)
                      .checkEmailInUse(emailController.text.trim());

                  setState(() {
                    if (isInUse) {
                      emailError = 'This email is already in use';
                    } else if (!isEmail) {
                      emailError = 'Incorrect email format';
                    } else {
                      emailError = null;
                    }
                    emailError = !isEmail ? 'Incorrect email format' : null;
                    if (passwordController.text.isEmpty) {
                      passwordError = 'Please enter your password';
                    } else if (passwordController.text.length < 8) {
                      passwordError =
                          'Password needs to be longer than 8 characters';
                    } else {
                      passwordError = null;
                    }
                  });

                  if (email.isNotEmpty && password.isNotEmpty && isEmail) {
                    context.pushNamed(RegisterNameScreen.routeName,
                        queryParameters: {
                          'email': email,
                          'password': password
                        });
                  } else if (!isEmail) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Invalid Email')),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Please enter all fields')),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Theme.of(context).colorScheme.onPrimaryContainer,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 14.0),
                ),
                child: const Text('Continue'),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
