import 'package:flutter/material.dart';
import 'package:random_password_generator/features/presentation/components/password_list_item.dart';

class PasswordList extends StatelessWidget {
  final List<String> passwords;

  const PasswordList({
    Key? key,
    required this.passwords,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: const Text('Random Password Generator'),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final item = this.passwords.elementAt(index);
              return PasswordListItem(
                password: item,
              );
            },
            childCount: this.passwords.length,
          ),
        ),
      ],
    );
  }
}
