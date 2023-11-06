import 'package:flutter/material.dart';

class ActionIcons extends StatelessWidget {
  const ActionIcons({super.key, required this.ctx});

  final BuildContext ctx;

  Widget iconContainer({required IconData icon, required String label}) {
    return Container(
      alignment: Alignment.center,
      width: 90,
      height: 70,
      decoration: BoxDecoration(
        color: Theme.of(ctx).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Colors.blue,
          ),
          const SizedBox(height:5 ,),
          Text(
            label,
            style: const TextStyle(color: Colors.blue),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        iconContainer(icon: Icons.chat, label: 'Message'),
        iconContainer(icon: Icons.call_sharp, label: 'Call'),
        iconContainer(icon: Icons.videocam, label: 'Video'),
        iconContainer(icon: Icons.mail_rounded, label: 'Mail'),
      ],
    );
  }
}
