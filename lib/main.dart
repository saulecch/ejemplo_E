import 'package:ejemplo/add.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'firebase_options.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF41818A),
        textTheme: const TextTheme(bodyLarge: TextStyle(color: Colors.white)),
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.network(
                    "https://firebasestorage.googleapis.com/v0/b/tellega-app.appspot.com/o/logoGucu.png?alt=media&token=16177560-b0e0-4bdc-aac7-0de202e023bb"),
              ),
              // Text(
              //   'Gucumatz',
              //   style: Theme.of(context).textTheme.headlineLarge,
              // ),
              AddCliente('Ernesto', '1234', '12341234'),
              const Menu(),
              const Carrousel(
                title: "CURSOS MÁS BUSCADOS",
              ),
              const Carrousel(
                title: "CURSOS TEÓRICOS",
              ),
              const Carrousel(
                title: "CURSOS PRÁCTICOS",
              ),
              Container(
                height: 80,
                color: Colors.teal[600],
                child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 250,
                        child: Text(
                          "INSERTE PUBLICIDAD NO TAN INTRUSIVA",
                          maxLines: 2,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Image(
                          width: 65,
                          image: NetworkImage(
                              "https://firebasestorage.googleapis.com/v0/b/tellega-app.appspot.com/o/icons8-crossy-road-logo-144.png?alt=media&token=a93d864e-ae7e-49df-bc96-69503d11f440")),
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Menu extends StatelessWidget {
  const Menu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 344,
      decoration: BoxDecoration(
        color: const Color(0xFF8CBC70),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.person)),
          const VerticalDivider(
            width: 3,
            thickness: 3,
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          const VerticalDivider(
            width: 3,
            thickness: 3,
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.bubble_chart)),
          const VerticalDivider(
            width: 3,
            thickness: 3,
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
        ],
      ),
    );
  }
}

class Carrousel extends StatelessWidget {
  final String title;
  const Carrousel({
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            title,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        SizedBox(
          height: 118,
          child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              scrollDirection: Axis.horizontal,
              itemBuilder: ((context, index) => const Card()),
              separatorBuilder: (context, index) => const SizedBox(
                    width: 12,
                  ),
              itemCount: 4),
        ),
      ],
    );
  }
}

class Card extends StatelessWidget {
  const Card({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 118,
          width: 239,
          color: const Color(0xFFDDE3E8),
          // color: Colors.red,
        ),
        Positioned(
          bottom: 0,
          child: Container(
            height: 26,
            width: 239,
            color: Colors.white,
            child: const Center(child: Text("Literatura")),
          ),
        ),
        const Positioned(
          left: 92,
          top: 26,
          child: Icon(
            Icons.book,
            size: 50,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
