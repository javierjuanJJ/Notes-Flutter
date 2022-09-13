import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes/constants/routes.dart';
import 'package:notes/services/auth/auth_service.dart';
import 'package:notes/services/auth/bloc/auth_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/services/auth/bloc/auth_event.dart';

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({Key? key}) : super(key: key);

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify Email'),
      ),
      body: Column(
        children: [
          const Text(
              "We've sent you an email confirmation. Please open it to verify your account."),
          const Text(
              "If you haven't received a verification email yet, press the button below. "),
          TextButton(
            onPressed: () {
              context.read<AuthBloc>().add(
                const AuthEventSendEmailVerification(),
              );
            },
            child: Text('Send email verification'),
          ),
          TextButton(
              onPressed: () async {
                await AuthService.firebase().logOut();
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(registerRoute, (route) => false);
                context.read<AuthBloc>().add(
                  const AuthEventLogOut(),
                );
              },
              child: const Text('Restart'))
        ],
      ),
    );
  }
}
