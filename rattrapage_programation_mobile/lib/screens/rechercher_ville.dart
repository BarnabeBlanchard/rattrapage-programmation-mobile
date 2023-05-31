import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:rattrapage_projet/screens/liste_ville.dart';
import '../models/api.dart';

class RechercherVille extends StatefulWidget {
  const RechercherVille({Key? key}) : super(key: key);

  @override
  State<RechercherVille> createState() => _RechercherVilleState();
}

class _RechercherVilleState extends State<RechercherVille> {

  Ville ville = Ville();

  void getApiVille(String nom) async {
    try {
      var response = await Dio().get(
          'https://geocoding-api.open-meteo.com/v1/search?name=$nom&count=10&language=fr&format=json');
      ville = Ville.fromJson(response.data);
      setState(() {});
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Erreur reseau')));
    }
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE5E3E2),
      body: SingleChildScrollView(
          child: Column(
        children: [
          ///HEADER
          Container(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top,
              left: 15,
              right: 25,
            ),
            height: 100,
            child: const Row(
              children: [
                Text(
                  'Ajouter une ville',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          ///SEARCH
          Container(
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
            child: Stack(
              children: [
                TextField(
                  decoration: InputDecoration(
                    fillColor: const Color(0xFFC8C8C8),
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    prefixIcon: const Icon(
                      Icons.search_outlined,
                      size: 30,
                      color: Colors.purple,
                    ),
                    hintText: "Saisissez le nom d'une ville",
                    hintStyle: const TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  onSubmitted: (String txt) {
                    getApiVille(txt);
                  },
                ),
              ],
            ),
          ),

          ///LISTE VILLES
          Container(
            width: 400,
            padding: const EdgeInsets.only(
              left: 8,
            ),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (int i = 0; i < ville.results.length; i++)
                  TextButton(
                    child: Text(
                      '${ville.results[i].name}, ${ville.results[i].country}',
                      style: const TextStyle(color: Colors.black),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: ((context) =>
                            ListeVille(results: ville.results[i])),
                      ));
                    },
                  ),

              ],
            ),
          ),
        ],
      )),
    );
  }
}
