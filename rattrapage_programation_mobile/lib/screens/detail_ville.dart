import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../models/api.dart';

class DetailVille extends StatefulWidget {
  //const DetailVille({Key? key}) : super(key: key);
  final String? city;
  final String? country;
  final Meteo meteo;

  const DetailVille({
    Key? key,
    required this.city,
    required this.country,
    required this.meteo,
  }) : super(key: key);

  @override
  State<DetailVille> createState() => _DetailVilleState();
}

class _DetailVilleState extends State<DetailVille> {
  ///variables API
  String? _city;
  String? _country;
  int? _humidity;
  double? _windspeed;
  int? _winddirection;
  double? _feeltemp;
  double? _temp;
  int? _rainproba;
  List<double>? _maxtemp;
  List<double>? _mintemp;
  String _tempcom = '';
  String _temppic = '';
  String _temppic2 = '';
  String _temppic3 = '';
  String _temppic4 = '';
  String _temppic5 = '';

  ///variables calcul
  String? direction;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _city = widget.city;
    _country = widget.country;
    _humidity = widget.meteo.hourly!.relativehumidity_2m?[9];
    _windspeed = widget.meteo.daily!.windspeed_10m_max?[0];
    _winddirection = widget.meteo.daily!.winddirection_10m_dominant?[0];
    _feeltemp = widget.meteo.hourly!.apparent_temperature?[9];
    _temp = widget.meteo.hourly!.temperature_2m?[9];
    _rainproba = widget.meteo.hourly!.precipitation_probability?[9];
    _maxtemp = [
      widget.meteo.daily!.temperature_2m_max![0],
      widget.meteo.daily!.temperature_2m_max![1],
      widget.meteo.daily!.temperature_2m_max![2],
      widget.meteo.daily!.temperature_2m_max![3],
      widget.meteo.daily!.temperature_2m_max![4],
    ];
    _mintemp = [
      widget.meteo.daily!.temperature_2m_min![0],
      widget.meteo.daily!.temperature_2m_min![1],
      widget.meteo.daily!.temperature_2m_min![2],
      widget.meteo.daily!.temperature_2m_min![3],
      widget.meteo.daily!.temperature_2m_min![4],
    ];

    if(_winddirection! >= 0 && _winddirection! <= 90) {
      direction = 'NE';
    }
    else if(_winddirection! >= 90 && _winddirection! <= 180) {
      direction = 'SE';
    }
    else if(_winddirection! >= 180 && _winddirection! <= 270) {
      direction = 'SO';
    }
    else if(_winddirection! >= 270 && _winddirection! <= 360) {
      direction = 'NO';
    }
    ///Les différents temps
    ///JOUR 1
    if(widget.meteo.daily!.weathercode?[0] != null){
      if(widget.meteo.daily!.weathercode![0] >= 0 &&  widget.meteo.daily!.weathercode![0] <= 2){
        _tempcom = 'Ensoleillé';
        _temppic = 'assets/images/sunlight.svg';
      }
      else if (widget.meteo.daily!.weathercode![0] >= 3 &&  widget.meteo.daily!.weathercode![0] <= 4){
        _tempcom = 'Eclaircies';
        _temppic = 'assets/images/sun-cloud.svg';
      }
      else if (widget.meteo.daily!.weathercode![0] ==5){
        _tempcom = 'Brumeux';
        _temppic = 'assets/images/haze.svg';
      }
      else if (widget.meteo.daily!.weathercode![0] >= 6 &&  widget.meteo.daily!.weathercode![0] <= 19){
        _tempcom = 'Mitigé';
        _temppic = 'assets/images/cloud.svg';
      }
      else if (widget.meteo.daily!.weathercode![0] >= 20 &&  widget.meteo.daily!.weathercode![0] <= 29){
        _tempcom = 'Pluvieux';
        _temppic = 'assets/images/rain-4.svg';
      }
      else if (widget.meteo.daily!.weathercode![0] >= 30 &&  widget.meteo.daily!.weathercode![0] <= 39){
        _tempcom = 'Venteux';
        _temppic = 'assets/images/wind-1.svg';
      }
      else if (widget.meteo.daily!.weathercode![0] >= 40 &&  widget.meteo.daily!.weathercode![0] <= 49){
        _tempcom = 'Nuageux';
        _temppic = 'assets/images/overcast.svg';
      }
      else if (widget.meteo.daily!.weathercode![0] >= 50 &&  widget.meteo.daily!.weathercode![0] <= 59){
        _tempcom = 'Bruine';
        _temppic = 'assets/images/rain.svg';
      }
      else if (widget.meteo.daily!.weathercode![0] >= 60 &&  widget.meteo.daily!.weathercode![0] <= 69){
        _tempcom = 'Gouttelé';
        _temppic = 'assets/images/rain-drops-1.svg';
      }
      else if (widget.meteo.daily!.weathercode![0] >= 70 &&  widget.meteo.daily!.weathercode![0] <= 79){
        _tempcom = 'Enneigé';
        _temppic = 'assets/images/snow-2.svg';
      }
      else if (widget.meteo.daily!.weathercode![0] >= 80 &&  widget.meteo.daily!.weathercode![0] <= 99){
        _tempcom = 'Orageux';
        _temppic = 'assets/images/rain-3.svg';
      }
    }
    ///JOUR 2
    if(widget.meteo.daily!.weathercode?[1] != null){
      if(widget.meteo.daily!.weathercode![1] >= 0 &&  widget.meteo.daily!.weathercode![1] <= 2){
        _temppic2 = 'assets/images/sunlight.svg';
      }
      else if (widget.meteo.daily!.weathercode![1] >= 3 &&  widget.meteo.daily!.weathercode![1] <= 4){
        _temppic2 = 'assets/images/sun-cloud.svg';
      }
      else if (widget.meteo.daily!.weathercode![1] ==5){
        _temppic2 = 'assets/images/haze.svg';
      }
      else if (widget.meteo.daily!.weathercode![1] >= 6 &&  widget.meteo.daily!.weathercode![1] <= 19){
        _temppic2 = 'assets/images/cloud.svg';
      }
      else if (widget.meteo.daily!.weathercode![1] >= 20 &&  widget.meteo.daily!.weathercode![1] <= 29){
        _temppic2 = 'assets/images/rain-4.svg';
      }
      else if (widget.meteo.daily!.weathercode![1] >= 30 &&  widget.meteo.daily!.weathercode![1] <= 39){
        _temppic2 = 'assets/images/wind-1.svg';
      }
      else if (widget.meteo.daily!.weathercode![1] >= 40 &&  widget.meteo.daily!.weathercode![1] <= 49){
        _temppic2 = 'assets/images/overcast.svg';
      }
      else if (widget.meteo.daily!.weathercode![1] >= 50 &&  widget.meteo.daily!.weathercode![1] <= 59){
        _temppic2 = 'assets/images/rain.svg';
      }
      else if (widget.meteo.daily!.weathercode![1] >= 60 &&  widget.meteo.daily!.weathercode![1] <= 69){
        _temppic2 = 'assets/images/rain-drops-1.svg';
      }
      else if (widget.meteo.daily!.weathercode![1] >= 70 &&  widget.meteo.daily!.weathercode![1] <= 79){
        _temppic2 = 'assets/images/snow-2.svg';
      }
      else if (widget.meteo.daily!.weathercode![1] >= 80 &&  widget.meteo.daily!.weathercode![1] <= 99){
        _temppic2 = 'assets/images/rain-3.svg';
      }
    }
    ///JOUR 3
    if(widget.meteo.daily!.weathercode?[2] != null){
      if(widget.meteo.daily!.weathercode![2] >= 0 &&  widget.meteo.daily!.weathercode![2] <= 2){
        _temppic3 = 'assets/images/sunlight.svg';
      }
      else if (widget.meteo.daily!.weathercode![2] >= 3 &&  widget.meteo.daily!.weathercode![2] <= 4){
        _temppic3 = 'assets/images/sun-cloud.svg';
      }
      else if (widget.meteo.daily!.weathercode![2] ==5){
        _temppic3 = 'assets/images/haze.svg';
      }
      else if (widget.meteo.daily!.weathercode![2] >= 6 &&  widget.meteo.daily!.weathercode![2] <= 19){
        _temppic3 = 'assets/images/cloud.svg';
      }
      else if (widget.meteo.daily!.weathercode![2] >= 20 &&  widget.meteo.daily!.weathercode![2] <= 29){
        _temppic3 = 'assets/images/rain-4.svg';
      }
      else if (widget.meteo.daily!.weathercode![2] >= 30 &&  widget.meteo.daily!.weathercode![2] <= 39){
        _temppic3 = 'assets/images/wind-1.svg';
      }
      else if (widget.meteo.daily!.weathercode![2] >= 40 &&  widget.meteo.daily!.weathercode![2] <= 49){
        _temppic3 = 'assets/images/overcast.svg';
      }
      else if (widget.meteo.daily!.weathercode![2] >= 50 &&  widget.meteo.daily!.weathercode![2] <= 59){
        _temppic3 = 'assets/images/rain.svg';
      }
      else if (widget.meteo.daily!.weathercode![2] >= 60 &&  widget.meteo.daily!.weathercode![2] <= 69){
        _temppic3 = 'assets/images/rain-drops-1.svg';
      }
      else if (widget.meteo.daily!.weathercode![2] >= 70 &&  widget.meteo.daily!.weathercode![2] <= 79){
        _temppic3 = 'assets/images/snow-2.svg';
      }
      else if (widget.meteo.daily!.weathercode![2] >= 80 &&  widget.meteo.daily!.weathercode![2] <= 99){
        _temppic3 = 'assets/images/rain-3.svg';
      }
    }
    ///JOUR 4
    if(widget.meteo.daily!.weathercode?[3] != null){
      if(widget.meteo.daily!.weathercode![3] >= 0 &&  widget.meteo.daily!.weathercode![3] <= 2){
        _temppic4 = 'assets/images/sunlight.svg';
      }
      else if (widget.meteo.daily!.weathercode![3] >= 3 &&  widget.meteo.daily!.weathercode![3] <= 4){
        _temppic4 = 'assets/images/sun-cloud.svg';
      }
      else if (widget.meteo.daily!.weathercode![3] ==5){
        _temppic4 = 'assets/images/haze.svg';
      }
      else if (widget.meteo.daily!.weathercode![3] >= 6 &&  widget.meteo.daily!.weathercode![3] <= 19){
        _temppic4 = 'assets/images/cloud.svg';
      }
      else if (widget.meteo.daily!.weathercode![3] >= 20 &&  widget.meteo.daily!.weathercode![3] <= 29){
        _temppic4 = 'assets/images/rain-4.svg';
      }
      else if (widget.meteo.daily!.weathercode![3] >= 30 &&  widget.meteo.daily!.weathercode![3] <= 39){
        _temppic4 = 'assets/images/wind-1.svg';
      }
      else if (widget.meteo.daily!.weathercode![3] >= 40 &&  widget.meteo.daily!.weathercode![3] <= 49){
        _temppic4 = 'assets/images/overcast.svg';
      }
      else if (widget.meteo.daily!.weathercode![3] >= 50 &&  widget.meteo.daily!.weathercode![3] <= 59){
        _temppic4 = 'assets/images/rain.svg';
      }
      else if (widget.meteo.daily!.weathercode![3] >= 60 &&  widget.meteo.daily!.weathercode![3] <= 69){
        _temppic4 = 'assets/images/rain-drops-1.svg';
      }
      else if (widget.meteo.daily!.weathercode![3] >= 70 &&  widget.meteo.daily!.weathercode![3] <= 79){
        _temppic4 = 'assets/images/snow-2.svg';
      }
      else if (widget.meteo.daily!.weathercode![3] >= 80 &&  widget.meteo.daily!.weathercode![3] <= 99){
        _temppic4 = 'assets/images/rain-3.svg';
      }
    }
    ///JOUR 5
    if(widget.meteo.daily!.weathercode?[4] != null){
      if(widget.meteo.daily!.weathercode![4] >= 0 &&  widget.meteo.daily!.weathercode![4] <= 2){
        _temppic5 = 'assets/images/sunlight.svg';
      }
      else if (widget.meteo.daily!.weathercode![4] >= 3 &&  widget.meteo.daily!.weathercode![4] <= 4){
        _temppic5 = 'assets/images/sun-cloud.svg';
      }
      else if (widget.meteo.daily!.weathercode![4] ==5){
        _temppic5 = 'assets/images/haze.svg';
      }
      else if (widget.meteo.daily!.weathercode![4] >= 6 &&  widget.meteo.daily!.weathercode![4] <= 19){
        _temppic5 = 'assets/images/cloud.svg';
      }
      else if (widget.meteo.daily!.weathercode![4] >= 20 &&  widget.meteo.daily!.weathercode![4] <= 29){
        _temppic5 = 'assets/images/rain-4.svg';
      }
      else if (widget.meteo.daily!.weathercode![4] >= 30 &&  widget.meteo.daily!.weathercode![4] <= 39){
        _temppic5 = 'assets/images/wind-1.svg';
      }
      else if (widget.meteo.daily!.weathercode![4] >= 40 &&  widget.meteo.daily!.weathercode![4] <= 49){
        _temppic5 = 'assets/images/overcast.svg';
      }
      else if (widget.meteo.daily!.weathercode![4] >= 50 &&  widget.meteo.daily!.weathercode![4] <= 59){
        _temppic5 = 'assets/images/rain.svg';
      }
      else if (widget.meteo.daily!.weathercode![4] >= 60 &&  widget.meteo.daily!.weathercode![4] <= 69){
        _temppic5 = 'assets/images/rain-drops-1.svg';
      }
      else if (widget.meteo.daily!.weathercode![4] >= 70 &&  widget.meteo.daily!.weathercode![4] <= 79){
        _temppic5 = 'assets/images/snow-2.svg';
      }
      else if (widget.meteo.daily!.weathercode![4] >= 80 &&  widget.meteo.daily!.weathercode![4] <= 99){
        _temppic5 = 'assets/images/rain-3.svg';
      }
    }

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
            //color: Colors.blue, //COULEUR POUR VOIR LA TAILLE
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.black,
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back_rounded,
                      color: Colors.white,
                      size: 30,
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  '$_city, $_country',
                  style: const TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          ///INFOS PRINCIPALES
          Container(
            height: 200,
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
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _tempcom,
                          style: const TextStyle(
                            color: Color(0xFF383838),
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          '$_temp°C',
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                          ),
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
                const SizedBox(height: 20),
                SizedBox(
                  height: 50,
                  child: Text(
                    "Aujourd'hui le temps est $_tempcom. Il y aura une minimale de ${_mintemp?[0]}°C et un maximum de ${_maxtemp?[0]}°C",
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),

          ///Jour1
          Container(
            height: 50,
            padding: const EdgeInsets.only(left: 20, right: 20),
            //color: Colors.red,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Mercredi',
                  style: TextStyle(
                    color: Color(0xFF5C5C5E),
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      '${_mintemp?[0]}°C',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      '${_maxtemp?[0]}°C',
                      style: const TextStyle(
                        color: Color(0xFF5C5C5E),
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          ///Heure
          ///Jour2
          Container(
            height: 50,
            padding: const EdgeInsets.only(left: 20, right: 20),
            //color: Colors.red,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Jeudi',
                  style: TextStyle(
                    color: Color(0xFF5C5C5E),
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      _temppic2,
                      color: Colors.black,
                      width: 14,
                      height: 14,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      '${_mintemp?[1]}°C',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      '${_maxtemp?[1]}°C',
                      style: const TextStyle(
                        color: Color(0xFF5C5C5E),
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          ///Jour3
          Container(
            height: 50,
            padding: const EdgeInsets.only(left: 20, right: 20),
            //color: Colors.red,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Vendredi',
                  style: TextStyle(
                    color: Color(0xFF5C5C5E),
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      _temppic3,
                      color: Colors.black,
                      width: 14,
                      height: 14,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      '${_mintemp?[2]}°C',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      '${_maxtemp?[2]}°C',
                      style: const TextStyle(
                        color: Color(0xFF5C5C5E),
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          ///Jour4
          Container(
            height: 50,
            padding: const EdgeInsets.only(left: 20, right: 20),
            //color: Colors.red,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Samedi',
                  style: TextStyle(
                    color: Color(0xFF5C5C5E),
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      _temppic4,
                      color: Colors.black,
                      width: 14,
                      height: 14,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      '${_mintemp?[3]}°C',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      '${_maxtemp?[3]}°C',
                      style: const TextStyle(
                        color: Color(0xFF5C5C5E),
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          ///Jour5
          Container(
            height: 50,
            padding: const EdgeInsets.only(left: 20, right: 20),
            //color: Colors.red,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Dimanche',
                  style: TextStyle(
                    color: Color(0xFF5C5C5E),
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      _temppic5,
                      color: Colors.black,
                      width: 14,
                      height: 14,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      '${_mintemp?[4]}°C',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      '${_maxtemp?[4]}°C',
                      style: const TextStyle(
                        color: Color(0xFF5C5C5E),
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          ///Plus d'infos
          Column(
            children: [
              Container(
                height: 100,
                padding: const EdgeInsets.only(left: 15),
                alignment: Alignment.center,

                child: const Text(
                  "Plus d'infos",
                  style: TextStyle(
                    color: Color(0xFF5C5C5E),
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 140,
                    width: 120,
                      alignment: Alignment.center,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Chances de pluie',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,

                            ),
                          ),
                          SvgPicture.asset(
                            'assets/images/umbrella-1.svg',
                            color: Colors.black,
                            width: 60,
                            height: 60,
                          ),
                          Text(
                            '$_rainproba %',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 15,
                              color: Color(0xFF5656E0),
                            ),
                          ),
                        ],
                      ),
                  ),
                  Container(
                    height: 140,
                    width: 120,
                    alignment: Alignment.center,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Taux d'humidité",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,

                          ),
                        ),
                        SvgPicture.asset(
                          'assets/images/rain.svg',
                          color: Colors.black,
                          width: 60,
                          height: 60,
                        ),
                        Text(
                          '$_humidity %',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 15,
                            color: Color(0xFF5656E0),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 50,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 140,
                    width: 120,
                    alignment: Alignment.center,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Vent',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,

                          ),
                        ),
                        SvgPicture.asset(
                          'assets/images/windy-1.svg',
                          color: Colors.black,
                          width: 60,
                          height: 60,
                        ),
                        Text(
                          '$direction $_windspeed km/h',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 15,
                            color: Color(0xFF5656E0),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 140,
                    width: 120,
                    alignment: Alignment.center,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Température ressentie",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,

                          ),
                        ),
                        SvgPicture.asset(
                          'assets/images/direction-1.svg',
                          color: Colors.black,
                          width: 60,
                          height: 60,
                        ),
                        Text(
                          '$_feeltemp °C',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 15,
                            color: Color(0xFF5656E0),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50,),
            ],
          ),
        ],
      )),
    );
  }
}
