import 'package:flutter/material.dart';
import 'package:random_password_generator/features/presentation/widgets/password_list_item.dart';

class PasswordList extends StatelessWidget {
  final List<String> items;
  final ValueChanged<String> onSelect;

  const PasswordList({
    Key? key,
    required this.items,
    required this.onSelect,
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
              final item = this.items.elementAt(index);
              return PasswordListItem(
                password: item,
                onTap: () => this.onSelect(item),
              );
            },
            childCount: this.items.length,
          ),
        ),
      ],
    );

    return ListView.separated(
      padding: EdgeInsets.symmetric(vertical: 20),
      itemCount: this.items.length,
      itemBuilder: (context, index) {
        final item = this.items.elementAt(index);

        return PasswordListItem(
          password: item,
          onTap: () => this.onSelect(item),
        );
      },
      separatorBuilder: (context, index) {
        return Divider(
          height: 5,
          thickness: 1,
        );
      },
    );
  }
}
