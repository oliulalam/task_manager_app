import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:task_manager_app/ui/screens/auth/reset_password_screen.dart';
import 'package:task_manager_app/ui/screens/auth/sign_in_screen.dart';
import 'package:task_manager_app/ui/utility/app_colors.dart';
import 'package:task_manager_app/ui/widgets/background_widget.dart';

class PinVerificationScreen extends StatefulWidget {
  const PinVerificationScreen({super.key});

  @override
  State<PinVerificationScreen> createState() => _PinVerificationScreenState();
}

class _PinVerificationScreenState extends State<PinVerificationScreen> {
  final TextEditingController _pinKeyTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackggroundWidget(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 100),
                  Text(
                    'Pin Verification',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),

                  Text(
                    'A 6 digits verification pin has been sent your email address',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(height: 24),

                  _buildPinCodeTextField(),

                  const SizedBox(height: 16),
                  ElevatedButton(onPressed: () {
                    _onTabVerifyOtpButton();
                  }, child: Text("Verify")),

                  SizedBox(height: 36),

                  buildSignInSection(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSignInSection() {
    return Center(
      child: RichText(
        text: TextSpan(
          text: "Have account?",
          style: TextStyle(
            color: Colors.black.withOpacity(0.8),
            letterSpacing: 0.4,
            fontWeight: FontWeight.w600,
          ),
          children: [
            TextSpan(
              text: 'Sign In',
              style: TextStyle(color: AppColors.themeColor),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  _onTabSignInButton();
                },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPinCodeTextField() {
    return PinCodeTextField(
      length: 6,
      animationType: AnimationType.fade,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(5),
        fieldHeight: 50,
        fieldWidth: 40,
        activeFillColor: Colors.white,
        selectedFillColor: Colors.white,
        inactiveFillColor: Colors.white,
        selectedColor: AppColors.themeColor,
      ),
      animationDuration: Duration(milliseconds: 300),
      backgroundColor: Colors.transparent,
      keyboardType: TextInputType.number,
      enableActiveFill: true,
      controller: _pinKeyTEController,
      appContext: context,
    );
  }

  void _onTabSignInButton() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => SignInScreen()),
      (route) => false,
    );
  }

  void _onTabVerifyOtpButton() {
    Navigator.push(context, MaterialPageRoute(builder: (context)=> ResetPasswordScreen()));
  }

  @override
  void dispose() {
    _pinKeyTEController.dispose();
    super.dispose();
  }
}
