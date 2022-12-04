import 'package:diplomayin/utils/utils.dart';
import 'package:diplomayin/widget/app_error_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.logout_outlined,
        color: Colors.white,
      ),
      onPressed: () {
        Utils.showAppDialog(
            context,
            AlertWidget(
              cancelMessage: 'Cancel',
              confirmMessage: 'Confirm',
              message: 'Are you sure you want to logout?',
              title: 'Logout',
              onConfirm: () async {
                try {
                  await FirebaseAuth.instance.signOut();
                } catch (e) {
                  Utils.showAppDialog(
                      context,
                      AppErrorWidget(
                        message: e.toString(),
                      ));
                }
              },
            ));
      },
    );
  }
}
