import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterchatexample/modules/person/bloc/item_bloc.dart';
import 'package:flutterchatexample/modules/person/bloc/item_event.dart';
import 'package:flutterchatexample/modules/person/bloc/item_state.dart';
import 'package:flutterchatexample/modules/person/models/personModel.dart';
import 'package:flutterchatexample/view/chat.dart';

class ExemploFirebase extends StatefulWidget {
  ExemploFirebase({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State createState() => ExemploFirebaseState();
}

class ExemploFirebaseState extends State<ExemploFirebase> {

  ItemBloc bloc;

  @override
  void initState() {
    super.initState();

    bloc = ItemBloc();
  }

  @override
  void dispose() {
    super.dispose();
    bloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocProvider<ItemBloc>(
        builder: (context) => bloc..add(ItemLoad()),
        child: BlocBuilder<ItemBloc, ItemState>(
          builder: (context, state) {
            if (state is ItemsLoaded) {
              return ListView.builder(
                itemCount: state.persons.length,
                itemBuilder: (context, index) => _buildItem(state.persons[index]),
              );
            }

            return CircularProgressIndicator();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onAddPressed,
        tooltip: 'Adicionar um item',
        child: Icon(Icons.add),
      ),
    );
  }
  
  Widget _buildItem(PersonModel person) {
    return ListTile(
      leading: Icon(Icons.supervisor_account),
      title: Text(person.alias),
      subtitle: Text(person.email.toString()),
      onTap: (){
                Navigator.push(
                              context, MaterialPageRoute(builder: (context) => Chat(peerId: "123", peerAvatar: "abc",)));
      },
    );
  }

  void _onAddPressed() {
    _newPersonDialog();
  }

  Future<void> _newPersonDialog() async {

    String alias;
    String email;

    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Adicionar pessoa'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Form(
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Apelido"
                        ),
                        onChanged: (value) {
                          alias = value.toString();
                        },
                      ),
                       TextFormField(
                        decoration: InputDecoration(
                          hintText: "Email"
                        ),
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (value) {
                          email = value;
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text('Adicionar'),
              onPressed: () {
                PersonModel model = PersonModel(email: email, alias: alias);
                bloc.add(AddItem(item: model));
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}