import 'package:flutter/material.dart';
import 'package:random_password_generator/features/password_generator/presentation/components/password_list_item.dart';

class PasswordList extends StatelessWidget {
  final List<String> passwords;
  final ValueChanged<String> onPressed;

  const PasswordList({
    super.key,
    required this.passwords,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
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
