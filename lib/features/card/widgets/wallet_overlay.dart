import 'package:add_to_google_wallet/widgets/add_to_google_wallet_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:miles_and_more_clone/data_models/google_wallet_pass_string.dart';
import 'package:miles_and_more_clone/data_models/user/user_repository.dart';
import 'package:miles_and_more_clone/features/auth/auth_controller.dart';
import 'package:qr_flutter/qr_flutter.dart';

class WalletOverlay extends ConsumerWidget {
  const WalletOverlay({Key? key}) : super(key: key);

  void _showSnackBar(BuildContext context, String text) =>
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authControllerProvider).value;

    return GestureDetector(
      onTap: () => Navigator.of(context).pop(),
      child: Scaffold(
        backgroundColor: Colors.white.withValues(alpha: 0.9),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              IconData(0xf13d, fontFamily: 'MaterialIcons'),
              size: 32,
              color: Colors.grey,
            ),
            const SizedBox(height: 16),
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              color: Theme.of(context).colorScheme.onPrimaryContainer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset('assets/images/miles_&_more_logo_white.png',
                            height: 16),
                        Image.asset('assets/images/lufthansa_logo_white.png',
                            height: 16),
                      ],
                    ),
                    const SizedBox(height: 60),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("${user?.firstName} ${user?.surName}",
                            style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color:
                                    Theme.of(context).colorScheme.onPrimary)),
                        Image.asset('assets/images/star_alliance_logo.jpg',
                            height: 48),
                      ],
                    ),
                    const SizedBox(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("SERVICE CARD NO.",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimary)),
                            Text(user?.serviceCardNumber ?? '',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimary)),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                    Container(
                      color: Theme.of(context).colorScheme.onPrimary,
                      child: QrImageView(
                        data: user?.serviceCardNumber ?? '',
                        version: 8,
                        size: 150.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            AddToGoogleWalletButton(
              pass: getPass(
                  userId: user!.uid,
                  userEmail: user.email,
                  passId: user.serviceCardNumber,
                  userFirstName: user.firstName,
                  userSurName: user.surName),
              onSuccess: () => _showSnackBar(context, 'Success!'),
              onCanceled: () => _showSnackBar(context, 'Action canceled.'),
              onError: (Object error) =>
                  _showSnackBar(context, error.toString()),
              locale: const Locale.fromSubtags(
                languageCode: 'en',
                countryCode: 'EN',
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              child: const Text(
                "By using this service, Miles & More transmits your digital serice card to Google",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
