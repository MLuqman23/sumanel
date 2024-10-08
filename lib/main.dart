// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:sumanel/screens/user_list.dart';

// import 'controllers/auth_controller.dart';
// import 'screens/sign_in.dart';

// void main() {
//   runApp(ProviderScope(child: MyApp()));
// }

// class MyApp extends ConsumerWidget {
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final authState = ref.watch(authProvider);

//     return MaterialApp(
//       title: 'ReqRes Auth App',
//       theme: ThemeData(primarySwatch: Colors.blue),
//       home: authState.isAuthenticated ? UserListScreen() : LoginScreen(),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'screens/user_list.dart';
import 'controllers/auth_controller.dart';
import 'screens/sign_in.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ReqRes Auth App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: authState.isAuthenticated ? UserListScreen() : LoginScreen(),
    );
  }
}
