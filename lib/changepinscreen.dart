import 'package:bls_user_flutter/waveheader.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'homescreen.dart';

class ChangePinScreen extends StatefulWidget {
  const ChangePinScreen({super.key});

  @override
  State<ChangePinScreen> createState() => _ChangePinScreenState();
}

String pin = '';
bool existing = true;
TextEditingController pinController = TextEditingController();

class _ChangePinScreenState extends State<ChangePinScreen> {
  String text = 'Verify 4-digit security pin';
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final imageHeight = screenHeight * 0.2;
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: const Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: const Color.fromRGBO(234, 239, 243, 1),
      ),
    );

    return Scaffold(
      body: Container(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Stack(
                children: [
                  WaveHeader(),
                  Positioned(
                    top: 80,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Image.asset('assets/images/logo.png',
                        width: 250, height: 80, ),
                    ),
                  )
                ],
              ),

              const SizedBox(
                height: 20,
              ),
              const Text(
                'Hi, SuperUser',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(text,
                  style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
                  textAlign: TextAlign.center),
              const SizedBox(
                height: 20,
              ),
              Pinput(
                length: 4,
                autofocus: true,
                controller: pinController,
                defaultPinTheme: defaultPinTheme,
                submittedPinTheme: submittedPinTheme,
                focusedPinTheme: focusedPinTheme,
                pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                showCursor: true,
                closeKeyboardWhenCompleted: true,
                onCompleted: (value) {
                  pin = value;
                  savePin();
                },
              ),
              const SizedBox(
                height: 30,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text('Forgot Pin?',
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
                  textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }

  void savePin() async {
    var pref = await SharedPreferences.getInstance();
    var existingPin = pref.getString('pin').toString();

    if (pin.isEmpty || pin.length < 4) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Enter Pin!")));
    } else {
      if (existing) {
        if (existingPin == pin) {
          existing = false;
          pin = '';
          pinController.clear();
          setState(() {
            text = 'Enter New 4-digit security pin';
          });
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Incorrect Pin!")));
        }
      } else {
        await pref.setString('pin', pin);
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Pin Saved!")));
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => HomeScreen()), // Your Home Screen
        );
      }
    }
  }
}
