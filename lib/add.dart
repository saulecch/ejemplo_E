import 'package:flutter/material.dart';

// Import the firebase_core and cloud_firestore plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddCliente extends StatelessWidget {
  final String nombre;
  final String nit;
  final String telefono;

  AddCliente(this.nombre, this.nit, this.telefono);

  @override
  Widget build(BuildContext context) {
    // Create a CollectionReference called users that references the firestore collection
    CollectionReference clientes = FirebaseFirestore.instance.collection('clientes');

    Future<void> addCliente() {
      // Call the user's CollectionReference to add a new user
      return clientes
          .add({
            'nombre': nombre,
            'nit': nit,
            'telefono': telefono
          })
          .then((value) => print("Cliente añadido"))
          .catchError((error) => print("Failed to add cliente: $error"));
    }

    return TextButton(
      onPressed: addCliente,
      child: Text(
        "Add Cliente",
      ),
    );
  }
}