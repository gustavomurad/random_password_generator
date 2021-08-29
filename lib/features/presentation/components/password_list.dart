import 'package:flutter/material.dart';
import 'package:random_password_generator/features/presentation/components/password_list_item.dart';

class PasswordList extends StatelessWidget {
  final List<String> passwords;
  final ValueChanged<String> onPressed;

  const PasswordList({
    Key? key,
    required this.passwords,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: const Text('Random Password Generator'),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final item = passwords.elementAt(index);
              return PasswordListItem(
                password: item,
                onPressed: onPressed,
              );
            },
            childCount: passwords.length,
          ),
        ),
      ],
    );
  }
}
