import 'dart:async';

import 'package:appbar_textfield/appbar_textfield.dart';
import 'package:flutter/material.dart';
import 'package:faker/faker.dart';

class Contact {
  final String name;
  final DateTime date;

  Contact(this.name, this.date);
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ListScreen(),
    );
  }
}

class ListScreen extends StatefulWidget {
  ListScreen({Key? key}) : super(key: key);

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  List<Contact> _allContacts = <Contact>[];
  StreamController<List<Contact>> _contactStream =
      StreamController<List<Contact>>();

  @override
  void initState() {
    _allContacts = List.generate(1000, (i) {
      return Contact(
        faker.person.name(),
        faker.date.dateTime(),
      );
    });

    _contactStream.add(_allContacts);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarTextField(
          title: Text("Contacts"),
          onBackPressed: _onRestoreAllData,
          onClearPressed: _onRestoreAllData,
          onChanged: _onSearchChanged,
        ),
        body: _buildBody());
  }

  void _onSearchChanged(String value) {
    List<Contact> foundContacts = _allContacts
        .where((Contact contact) =>
            contact.name.toLowerCase().indexOf(value.toLowerCase()) > -1)
        .toList();

    this._contactStream.add(foundContacts);
  }

  void _onRestoreAllData() {
    this._contactStream.add(this._allContacts);
  }

  Widget _buildBody() {
    return StreamBuilder<List<Contact>>(
        stream: _contactStream.stream,
        builder: (context, snapshot) {
          List<Contact> contacts = snapshot.hasData ? snapshot.data! : [];

          return ListView.builder(
            itemCount: contacts.length,
            itemBuilder: (context, index) {
              var contact = contacts[index];
              return ListTile(
                leading: CircleAvatar(),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        contact.name,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                        "${contact.date.day.toString()}/${contact.date.month.toString()}/${contact.date.year.toString()}",
                        style: TextStyle(color: Colors.grey)),
                  ],
                ),
                subtitle: Text(faker.job.title()),
              );
            },
          );
        });
  }

  @override
  void dispose() {
    _contactStream.close();
    super.dispose();
  }
}
