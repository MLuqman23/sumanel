import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controllers/user_controller.dart';

class UserListScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userList = ref.watch(userProvider);

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.greenAccent,
          leading: Icon(Icons.arrow_back),
          title: Text(
            'User List',
            style: TextStyle(color: Colors.black, fontSize: 20),
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: userList.when(
            data: (users) => ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return ListTile(
                  leading:
                      CircleAvatar(backgroundImage: NetworkImage(user.avatar)),
                  title: Text('${user.firstName} ${user.lastName}'),
                  subtitle: Text(
                    '${user.email}',
                    style: TextStyle(color: Colors.grey[420], fontSize: 14),
                  ),
                );
              },
            ),
            loading: () => Center(child: CircularProgressIndicator()),
            error: (err, stack) => Center(child: Text('Error: $err')),
          ),
        ),
      ),
    );
  }
}
