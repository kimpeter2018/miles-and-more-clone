import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:miles_and_more_clone/data_models/user/user_model.dart';
import 'package:miles_and_more_clone/features/auth/auth_controller.dart';
import 'package:miles_and_more_clone/features/auth/widgets/page_indicator.dart';
import 'package:miles_and_more_clone/features/auth/widgets/question_mark_quide.dart';
import 'package:miles_and_more_clone/features/auth/screens/welcome_screen.dart';

class RegisterNameScreen extends ConsumerStatefulWidget {
  final String enteredEmail;
  final String enteredPassword;
  static const String routeName = '/register-name-screen';

  const RegisterNameScreen({
    super.key,
    required this.enteredEmail,
    required this.enteredPassword,
  });

  @override
  ConsumerState<RegisterNameScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterNameScreen> {
  final firstNameController = TextEditingController();
  final surNameController = TextEditingController();
  Gender? gender = Gender.mr;

  @override
  void dispose() {
    firstNameController.dispose();
    surNameController.dispose();
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
            const PageIndicator(totalPages: 2, currentPage: 1),
            const SizedBox(height: 40),
            Text('Your personal details',
                style: Theme.of(context).textTheme.headlineLarge),
            const SizedBox(height: 40),
            const Text(
                'Please complete all the fields to register for a Travel ID'),
            const SizedBox(height: 30),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Salutation',
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary)),
                      Row(
                        children: <Widget>[
                          Row(
                            children: [
                              Radio<Gender>(
                                value: Gender.mr,
                                groupValue: gender,
                                onChanged: (Gender? value) {
                                  setState(() {
                                    gender = value;
                                  });
                                },
                              ),
                              const Text('Mr.'),
                            ],
                          ),
                          const SizedBox(width: 6),
                          Row(
                            children: [
                              Radio<Gender>(
                                value: Gender.ms,
                                groupValue: gender,
                                onChanged: (Gender? value) {
                                  setState(() {
                                    gender = value;
                                  });
                                },
                              ),
                              const Text('Ms.'),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Flexible(
                  child: QuestionMarkGuide(
                      guideText:
                          "The salutations \"Mr\" and \"Ms\" are currently the only options available due to technical reasons. Additional options which will also include other gender identities are in the planning stage."),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: firstNameController,
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'First name',
                      ),
                    ),
                  ),
                  const QuestionMarkGuide(
                    guideText:
                        "Please give your first name(s) in Roman letters exactly as they are shown on your ID card/passport",
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: surNameController,
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Surname',
                      ),
                    ),
                  ),
                  const QuestionMarkGuide(
                    guideText:
                        "Please give your surname in Roman letters exactly as it is shown on your ID card/passport",
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () {
                  final firstName = firstNameController.text;
                  final surName = surNameController.text;
                  if (firstName.isNotEmpty && surName.isNotEmpty) {
                    ref.read(authControllerProvider.notifier).register(
                          email: widget.enteredEmail,
                          password: widget.enteredPassword,
                          firstName: firstName,
                          surName: surName,
                          gender: gender!,
                        );
                    Navigator.of(context).popUntil((route) =>
                        route.settings.name == WelcomeScreen.routeName);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Please enter all fields')),
                    );
                  }
                },
                child: const Text('Register'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
