import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rattrapage_projet/models/api.dart';
import 'package:dio/dio.dart';
import 'detail_ville.dart';


class ListeVille extends StatefulWidget {

  final Results results;

  const ListeVille({
    Key? key,
    required this.results,
  }) : super(key: key);

  @override
  State<ListeVille> createState() => _ListeVilleState();
}

class _ListeVilleState extends State<ListeVille> {
  Meteo meteo = Meteo();
  String? _city;
  String? _country;
  double? _temp;
  String _tempcom = '';
  String _temppic = '';

  void getApiMeteo(double lat, double lon) async {
    try {
      var response = await Dio().get(
          'https://api.open-meteo.com/v1/forecast?latitude=$lat&longitude=$lon&hourly=temperature_2m,relativehumidity_2m,apparent_temperature,precipitation_probability&daily=weathercode,temperature_2m_max,temperature_2m_min,windspeed_10m_max,winddirection_10m_dominant&timezone=Europe%2FBerlin');
      meteo = Meteo.fromJson(response.data);
      setState(() {});
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Erreur reseau meteo')));
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _city = widget.results.name;
    _country = widget.results.country;
    _temp = 0.0;
  }

  @override
  Widget build(BuildContext context) {
    getApiMeteo(widget.results.latitude, widget.results.longitude);
    if(meteo.hourly!.temperature_2m?[9] != null) {
      _temp = meteo.hourly!.temperature_2m?[9];
    }
    ///Différents temps
    if(meteo.daily!.weathercode?[0] != null){
      if(meteo.daily!.weathercode![0] >= 0 &&  meteo.daily!.weathercode![0] <= 2){
        _tempcom = 'Ensoleillé';
        _temppic = 'assets/images/sunlight.svg';
      }
      else if (meteo.daily!.weathercode![0] >= 3 &&  meteo.daily!.weathercode![0] <= 4){
        _tempcom = 'Eclaircies';
        _temppic = 'assets/images/sun-cloud.svg';
      }
      else if (meteo.daily!.weathercode![0] ==5){
        _tempcom = 'Brumeux';
        _temppic = 'assets/images/haze.svg';
      }
      else if (meteo.daily!.weathercode![0] >= 6 &&  meteo.daily!.weathercode![0] <= 19){
        _tempcom = 'Mitigé';
        _temppic = 'assets/images/cloud.svg';
      }
      else if (meteo.daily!.weathercode![0] >= 20 &&  meteo.daily!.weathercode![0] <= 29){
        _tempcom = 'Pluvieux';
        _temppic = 'assets/images/rain-4.svg';
      }
      else if (meteo.daily!.weathercode![0] >= 30 &&  meteo.daily!.weathercode![0] <= 39){
        _tempcom = 'Venteux';
        _temppic = 'assets/images/wind-1.svg';
      }
      else if (meteo.daily!.weathercode![0] >= 40 &&  meteo.daily!.weathercode![0] <= 49){
        _tempcom = 'Nuageux';
        _temppic = 'assets/images/overcast.svg';
      }
      else if (meteo.daily!.weathercode![0] >= 50 &&  meteo.daily!.weathercode![0] <= 59){
        _tempcom = 'Bruine';
        _temppic = 'assets/images/rain.svg';
      }
      else if (meteo.daily!.weathercode![0] >= 60 &&  meteo.daily!.weathercode![0] <= 69){
        _tempcom = 'Gouttelé';
        _temppic = 'assets/images/rain-drops-1.svg';
      }
      else if (meteo.daily!.weathercode![0] >= 70 &&  meteo.daily!.weathercode![0] <= 79){
        _tempcom = 'Enneigé';
        _temppic = 'assets/images/snow-2.svg';
      }
      else if (meteo.daily!.weathercode![0] >= 80 &&  meteo.daily!.weathercode![0] <= 99){
        _tempcom = 'Orageux';
        _temppic = 'assets/images/rain-3.svg';
      }
    }

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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Mes villes',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Positioned(
                  right: 35,
                  child: IconButton(
                      icon: const Icon(
                        Icons.add,
                        size: 30,
                        color: Colors.black,
                      ),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
              ],
            ),
          ),

          ///Liste ville
          TextButton(
          onPressed: () {
               _city = widget.results.name;
               _country = widget.results.country;
               Navigator.of(context).push(MaterialPageRoute(
                 builder: ((context) =>
                     DetailVille(city: _city,country: _country, meteo: meteo,)),
               ));
             },
              child: Container(
                height: 150,
                padding: const EdgeInsets.all(20),
                margin:
                const EdgeInsets.only(left: 15, right: 15, bottom: 50, top: 0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade400,
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '$_city, $_country',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 10,),
                            Text(
                              '$_temp°C',
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 40,
                              ),
                            ),
                            Text(
                              _tempcom,
                              style: const TextStyle(
                                color: Color(0xFF383838),
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SvgPicture.asset(
                      _temppic,
                      color: const Color(0xFF5656E0),
                      width: 60,
                      height: 60,
                    ),
                  ],
                ),
              ),
          ),
        ],
      )),
    );
  }
}
