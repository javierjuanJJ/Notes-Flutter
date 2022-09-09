import 'dart:developer' as devtools show log;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes/constants/routes.dart';
import 'package:notes/enums/menuAction.dart';
import 'package:notes/main.dart';
import 'package:notes/services/auth/auth_service.dart';
import 'package:notes/services/crud/notes_services.dart';

class NotesView extends StatefulWidget {
  const NotesView({Key? key}) : super(key: key);

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
  late final NotesService _notesService;

  String get userEmail => AuthService.firebase().currentUser!.email!;

  @override
  void initState() {
    _notesService = NotesService();
    super.initState();
  }

  @override
  void dispose() {
    _notesService.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My notes'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(newNoteRoute);
            },
          ),
          PopupMenuButton<MenuAction>(
            onSelected: (value) async {
              switch (value) {
                case MenuAction.logout:
                  final dialog = await showLogOutDialog(context);

                  if (dialog) {
                    await AuthService.firebase().logOut();
                    Navigator.of(context)
                        .pushNamedAndRemoveUntil(loginRoute, (_) => false);
                  }

                  break;
              }
              devtools.log(value.toString());
              print(value);
            },
            itemBuilder: (context) {
              return const [
                PopupMenuItem<MenuAction>(
                  value: MenuAction.logout,
                  child: Text('Log Out'),
                )
              ];
            },
          )
        ],
      ),
      body: FutureBuilder(
        future: _notesService.getOrCreateUser(email: userEmail),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              return StreamBuilder(
                stream: _notesService.allNotes,
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return Text('Waiting for all notes');
                      break;
                    default:
                      return CircularProgressIndicator();
                  }
                },
              );
            default:
              return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
