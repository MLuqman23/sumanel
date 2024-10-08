// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import '../controllers/auth_controller.dart';

// class LoginScreen extends ConsumerWidget {
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final authState = ref.watch(authProvider);

//     return Scaffold(
//       appBar: AppBar(title: Text('Login')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//                 controller: _emailController,
//                 decoration: InputDecoration(labelText: 'Email')),
//             TextField(
//                 controller: _passwordController,
//                 decoration: InputDecoration(labelText: 'Password'),
//                 obscureText: true),
//             ElevatedButton(
//               onPressed: authState.isLoading
//                   ? null
//                   : () {
//                       ref.read(authProvider.notifier).login(
//                           _emailController.text, _passwordController.text);
//                     },
//               child: authState.isLoading
//                   ? CircularProgressIndicator()
//                   : Text('Login'),
//             ),
//             if (authState.error != null)
//               Text(authState.error!, style: TextStyle(color: Colors.red)),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controllers/auth_controller.dart';
import 'sign_up.dart';

class LoginScreen extends ConsumerWidget {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            children: [
              SizedBox(
                height: 65,
              ),
              Text(
                'Hello!',
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
              Text(
                'Please Login here.',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 45,
              ),
              SizedBox(
                height: 55,
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                      hintText: 'Email',
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 55,
                child: TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                      hintText: 'Password',
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                  obscureText: true,
                ),
              ),
              SizedBox(
                height: 100,
              ),
              ElevatedButton(
                  onPressed: authState.isLoading
                      ? null
                      : () {
                          ref.read(authProvider.notifier).login(
                              _emailController.text, _passwordController.text);
                        },
                  child: authState.isLoading
                      ? CircularProgressIndicator()
                      : Text('Login', style: TextStyle(fontSize: 17)),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.greenAccent,
                      minimumSize: Size(double.infinity, 48),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)))),
              if (authState.error != null)
                Text(authState.error!,
                    style: TextStyle(
                      color: Colors.red,
                    )),
              SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  // Navigate to the sign-up screen if the user doesn't have an account
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SignUpScreen()),
                  );
                },
                child: Text("Don't have an account? Sign Up"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
