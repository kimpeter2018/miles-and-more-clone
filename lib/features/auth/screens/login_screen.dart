import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miles_and_more_clone/features/auth/auth_controller.dart';
import 'package:miles_and_more_clone/features/auth/widgets/password_textfield.dart';
import 'package:miles_and_more_clone/features/auth/widgets/question_mark_quide.dart';

class LoginScreen extends ConsumerStatefulWidget {
  static const String routeName = '/login-screen';

  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isEmailSubmitted = false;

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
            const SizedBox(
              height: 40,
            ),
            Text(
              'Login',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
                'Please enter your servicecard number or Travel ID (email address)'),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ValueListenableBuilder<TextEditingValue>(
                      valueListenable: emailController,
                      builder: (context, value, child) {
                        return TextField(
                          enabled: !isEmailSubmitted,
                          controller: emailController,
                          onTapOutside: (event) {
                            FocusManager.instance.primaryFocus?.unfocus();
                          },
                          decoration: InputDecoration(
                              border: const UnderlineInputBorder(),
                              labelText: (emailController.value.text.isEmpty)
                                  ? 'Travel ID (email address) / Servicecard number'
                                  // email validating expression
                                  : RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                          .hasMatch(emailController.text)
                                      ? 'Email'
                                      : 'Username'),
                        );
                      },
                    ),
                  ),
                  const QuestionMarkGuide(
                      guideText:
                          "You entered your Travel ID (email address) when you registered. Your servicecard number consists of 15 digits and can be found on your Miles & More servicecard and in the email you received after registration.")
                ],
              ),
            ),
            Visibility(
              visible: isEmailSubmitted,
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ObscureTextField(
                        controller: passwordController,
                      ),
                    ),
                    Container(
                        alignment: Alignment.center,
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 1,
                            style: BorderStyle.solid,
                          ),
                        ),
                        child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.question_mark,
                              size: 15,
                            )))
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () async {
                  if (!isEmailSubmitted && emailController.text.isNotEmpty) {
                    setState(() {
                      isEmailSubmitted = true;
                    });
                  } else {
                    final email = emailController.text;
                    final password = passwordController.text;
                    if (email.isNotEmpty && password.isNotEmpty) {
                      ref.read(authControllerProvider.notifier).login(
                            email: emailController.text.trim(),
                            password: passwordController.text.trim(),
                          );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Please enter all fields')),
                      );
                    }
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
                child: Text(isEmailSubmitted ? 'Sign In' : 'Next'),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Visibility(
              visible: isEmailSubmitted,
              child: TextButton(
                  onPressed: () async {
                    setState(() {
                      isEmailSubmitted = false;
                    });
                  },
                  child: const Text('Back')),
            ),
          ],
        ),
      ),
    );
  }
}
