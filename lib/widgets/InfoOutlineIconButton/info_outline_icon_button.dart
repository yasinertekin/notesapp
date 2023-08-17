import 'package:flutter/material.dart';

class InfoOutlineIconButton extends StatelessWidget {
  const InfoOutlineIconButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xff3b3b3b),
      child: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.info_outline),
      ),
    );
  }
}
