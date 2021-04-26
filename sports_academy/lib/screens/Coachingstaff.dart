import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CoachingSatff extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Image.network(
                'https://lh3.googleusercontent.com/proxy/4joKgZO_MsvzIQBfQhADA6LLYg4CZ3kq7eR2kROVEa29g-JqWvuITddN3-vDzKhntotuSBWlIu0EFDSlb9ghPrSbprCmJyml7PKd'),
          ),
          SliverAppBar(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
              ),
            ),
            title: Text('Coaches'),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate((BuildContext, int index) {
            if (index > 20) {
              return null;
            }
            return Card(
              child: ListTile(
                leading: Icon(Icons.person),
                title: Text('Marcus Reus'),
                trailing: Icon(Icons.phone),
                subtitle: Text('Football Coach'),
              ),
            );
          })),
        ],
      ),
    );
  }
}
