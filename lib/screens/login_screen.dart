import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:sign_button/sign_button.dart';
import 'package:habitmate/config/constraint.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

final GetIt getIt = GetIt.instance;
final tr = getIt.get<AppLocalizations>();
const List<Widget> screenContent = [
  WelcomeToText(),
  SizedBox(
    height: 100,
  ),
  BrandQuoteText(),
  SignInButtons(),
  AuthDeclaration(),
];

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      backgroundColor: themeData.colorScheme.background,
      body: SafeArea(
        child: Center(
          child: MediaQuery.of(context).size.height > 500
              ? const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: screenContent,
                )
              : ListView(
                  children: screenContent,
                ),
        ),
      ),
    );
  }
}

class WelcomeToText extends StatelessWidget {
  const WelcomeToText({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Column(
      children: [
        Padding(
          padding: defaultTopPadding,
          child: Text(
            tr.welcome_to,
            style: themeData.textTheme.bodyMedium?.copyWith(
              color: themeData.colorScheme.outline,
              fontSize: 30,
            ),
          ),
        ),
        Text(
          tr.app_name,
          style: themeData.textTheme.bodyLarge?.copyWith(
            fontFamily: 'Montserrat',
            color: themeData.colorScheme.primary,
            height: 1,
            fontSize: 50,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class BrandQuoteText extends StatelessWidget {
  const BrandQuoteText({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Padding(
      padding: defaultHorizontalViewPadding,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: tr.auth_brand_quote_text1,
          style: themeData.textTheme.bodyMedium?.copyWith(
            color: themeData.colorScheme.outline,
            fontSize: 25,
          ),
          children: [
            TextSpan(
              text: tr.for_a_better_life,
              style: themeData.textTheme.bodyMedium?.copyWith(
                color: themeData.colorScheme.primary,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
                decorationThickness: 0.5,
                decorationColor: themeData.colorScheme.primary,
                fontSize: 25,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SignInCustomButton extends StatelessWidget {
  final ButtonType type;
  final Function() onPressed;
  const SignInCustomButton(
      {super.key, required this.type, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SignInButton(
      buttonType: type,
      buttonSize: ButtonSize.medium,
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}

class SignInButtons extends StatelessWidget {
  const SignInButtons({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Column(
      children: [
        Padding(
          padding: defaultTopPadding,
          child: Center(
            child: SignInCustomButton(
              type: ButtonType.googleDark,
              onPressed: () => {context.go('/home')},
            ),
          ),
        ),
        Padding(
          padding: defaultTopPadding / 2,
          child: Center(
            child: SignInCustomButton(
              type: ButtonType.appleDark,
              onPressed: () => {context.go('/home')},
            ),
          ),
        ),
        Padding(
          padding: defaultTopPadding,
          child: InkWell(
            onTap: () {
              context.go('/home');
            },
            child: Text(
              tr.or_sign_in_later,
              style: themeData.textTheme.bodyMedium?.copyWith(
                color: themeData.colorScheme.outline,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class AuthDeclaration extends StatelessWidget {
  const AuthDeclaration({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Padding(
      padding: defaultHorizontalViewPadding.add(
        defaultTopPadding,
      ),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: tr.auth_declaration_text,
          style: themeData.textTheme.bodyMedium?.copyWith(
            color: themeData.colorScheme.outline,
            fontSize: 15,
          ),
          children: [
            TextSpan(
              text: tr.terms_of_service,
              style: themeData.textTheme.bodyMedium?.copyWith(
                color: themeData.colorScheme.primary,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
                decorationThickness: 0.5,
                decorationColor: themeData.colorScheme.primary,
                fontSize: 15,
              ),
            ),
            TextSpan(
              text: ' ${tr.and} ',
              style: themeData.textTheme.bodyMedium?.copyWith(
                color: themeData.colorScheme.outline,
                fontSize: 15,
              ),
            ),
            TextSpan(
              text: tr.privacy_policy,
              style: themeData.textTheme.bodyMedium?.copyWith(
                color: themeData.colorScheme.primary,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
                decorationThickness: 0.5,
                decorationColor: themeData.colorScheme.primary,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Martin Gogołowicz || SobGOG || 30.08.2023
// Last edit: Martin Gogołowicz || SobGOG || 14.09.2023