import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:wiz/resources/auth_methods.dart';
import 'package:wiz/screens/register.dart';
import 'package:wiz/utils/colors.dart';
import 'package:wiz/widgets/text_field_imput.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();

class _loginState extends State<login> {
  final TapGestureRecognizer _gestureRecognizer = TapGestureRecognizer()
    ..onTap = () {};
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(16, 200, 16, 64),
        child: ListView(
          children: [
            const Text(
              'Log in',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(
              height: 40,
            ),

            TextFieldInput(
              hintText: '',
              textEditingController: _emailController,
              textInputType: TextInputType.text,
              label: 'Email ID',
            ),
            const SizedBox(
              height: 24,
            ),
            TextFieldInput(
              hintText: '',
              textEditingController: _passwordController,
              textInputType: TextInputType.text,
              label: 'Password',
              isPass: true,
            ),
            const SizedBox(
              height: 24,
            ),

            const SizedBox(
              height: 16,
            ),
            InkWell(
              onTap: () async {
                String res = await AuthMethods().loginUser(
                  email: _emailController.text,
                  password: _passwordController.text,
                );
              },
              child: Container(
                height: 56,
                child: const Text(
                  'Login',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
                width: double.infinity,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: const ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(4.0),
                    ),
                  ),
                  color: purple,
                ),
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            Flexible(
              child: Container(),
              flex: 2,
            ),
            //transitioning to signup
            Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center, children: [
                  Text('New Member?'),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterScreen()),
                      );
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(color: purple),
                    ),
                  ),
                ],
                
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
