import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _fromKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isObsecure = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
        body: Stack(
      fit: StackFit.expand,
      children: [
        // Image.asset(
        //   'lib/assets/images/login_logout/welcome-screen.jpg',
        //   fit: BoxFit.cover,
        // ),
        Center(
          child: Padding(
            padding: EdgeInsets.all(25.0),
            child: Form(
              key: _fromKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 200,
                    child: Image.asset('lib/assets/images/login_logout/cup-coffee.png', color: Colors.orange,)),
                  SizedBox(height: 15.0,),
                  //field Email
                  TextFormField(
                    controller: _emailController,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Required Email';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: 'Enter your email...',
                        prefixIcon: Icon(Icons.email),
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () {
                            _emailController.clear();
                          },
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide:
                                BorderSide(color: Colors.grey.shade600)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide:
                                BorderSide(color: Colors.grey.shade600))),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  //field Password
                  TextFormField(
                    controller: _passwordController,
                    obscureText: !isObsecure,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Password is empty';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: 'Enter your password...',
                        prefixIcon: Icon(Icons.vpn_key_sharp),
                        suffixIcon: IconButton(
                          icon: Icon(isObsecure
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              isObsecure = !isObsecure;
                            });
                          },
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide:
                                BorderSide(color: Colors.grey.shade600)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide:
                                BorderSide(color: Colors.grey.shade600))),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  //forgot password
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forgot password?',
                        style: TextStyle(decoration: TextDecoration.underline),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  //button Login
                  SizedBox(
                    width: double.infinity,
                    height: 45.0,
                    child: ElevatedButton(
                        onPressed: () {
                          if (_fromKey.currentState!.validate()) {
                            print('Validation is Done');
                          }
                        },
                        child: Text('Login', style: TextStyle(color: Colors.white),)),
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: Colors.grey[900],
                        ),
                      ),
                      Text(' Or continue with '),
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: Colors.grey[900],
                        ),
                      )
                    ],
                  )
                  //register
                  
                ],
              ),
            ),
          ),
        )
      ],
    ));
  }
}
