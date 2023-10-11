import 'package:flutter/material.dart';

class DrawerNavBar extends StatelessWidget {
  const DrawerNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        UserAccountsDrawerHeader(
            accountName: Text('Hello ' + 'Van Dat'),
            accountEmail: Text('20050068@student.bdu.edu.vn'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                  child: Image.asset(
                'lib/images/users/avatar.jpg',
                width: 90,
                height: 90,
                fit: BoxFit.cover,
              )),
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                    'https://images.unsplash.com/photo-1447933601403-0c6688de566e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1961&q=80',
                  ),
                  fit: BoxFit.cover),
            )),
        ListTile(
          leading: Icon(Icons.favorite),
          title: Text('Favorite'),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.share),
          title: Text('Shaze'),
          onTap: () {},
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.notifications),
          title: Text('Notifications'),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text('Settings'),
          onTap: () {},
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.logout),
          title: Text('Logout'),
          onTap: () {},
        )
      ],
    );
  }
}
