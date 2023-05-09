import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp/weatherdata.dart';

var dayInfo = DateTime.now();
var dateFormat = DateFormat('EEEE,d MMM, yyy').format(dayInfo);

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //HomePage({super.key});
  var client = WeatherData();

  //var data;
  String query = '';

  TextEditingController searchContrller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: FutureBuilder(
            future: client.getData(query.isEmpty ? 'Calicut' : query),
            //future: info(),
            builder: ((context, snapshot) {
              return SingleChildScrollView(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: size.height * 0.75,
                        width: size.width,
                        padding: const EdgeInsets.only(top: 20),
                        margin: const EdgeInsets.only(
                          right: 10,
                          left: 10,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          gradient: const LinearGradient(
                            colors: [Color(0xff955cd1), Color(0xff3fa2fa)],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            stops: [0.2, 0.85],
                          ),
                        ),
                        child: Column(
                          children: [
                            AnimSearchBar(
                              textFieldColor: Colors.white38,
                              textFieldIconColor: Colors.white,
                              helpText: "Search City",
                              color: Colors.grey,
                              width: 250,
                              textController: searchContrller,
                              onSuffixTap: () {
                                searchContrller.clear();
                              },
                              onSubmitted: (p0) {
                                setState(() {
                                  query = p0;
                                });
                              },
                            ),
                            Text(
                              '${snapshot.data?.cityName}',
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 35),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              dateFormat,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 15),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            /* Image.asset(
                              'assets/img/sunny.png',
                              width: size.width * 0.4,
                            ), */
                            Image.network(
                              'https:${snapshot.data?.icon}',
                              width: size.width * 0.3,
                              fit: BoxFit.fill,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              '${snapshot.data?.condition}',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              '${snapshot.data?.temp}°',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 40,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            Row(
                              children: [
                                Expanded(
                                    child: Column(
                                  children: [
                                    Image.asset(
                                      'assets/img/20281002651600621780-128.png',
                                      width: size.width * 0.15,
                                    ),
                                    Text(
                                      '${snapshot.data?.wind} km/h',
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Text(
                                      'wind',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w300),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    )
                                  ],
                                )),
                                Expanded(
                                    child: Column(
                                  children: [
                                    Image.asset(
                                      'assets/img/14685899441640177352-128.png',
                                      width: size.width * 0.15,
                                    ),
                                    Text(
                                      '${snapshot.data?.wind_dir}',
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Text(
                                      'Wind direction',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w300),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    )
                                  ],
                                )),
                                Expanded(
                                    child: Column(
                                  children: [
                                    Image.asset(
                                      'assets/img/7503652861678529412-128.png',
                                      width: size.width * 0.15,
                                    ),
                                    Text(
                                      '${snapshot.data?.humidity}',
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Text(
                                      'humidity',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w300),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    )
                                  ],
                                ))
                              ],
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: Column(
                            children: [
                              Text(
                                'Gust',
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.5),
                                    fontSize: 17),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                '${snapshot.data?.gust} kp/h',
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.5),
                                    fontSize: 23),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                'pressure',
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.5),
                                    fontSize: 17),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                '${snapshot.data?.pressure} hpa',
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.5),
                                    fontSize: 23),
                              ),
                            ],
                          )),
                          Expanded(
                              child: Column(
                            children: [
                              Text(
                                'UV',
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.5),
                                    fontSize: 17),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                '${snapshot.data?.uv}',
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.5),
                                    fontSize: 23),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Precipitation',
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.5),
                                    fontSize: 17),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                '${snapshot.data?.precipe} mm',
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.5),
                                    fontSize: 23),
                              ),
                            ],
                          )),
                          Expanded(
                              child: Column(
                            children: [
                              Text(
                                'wind',
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.5),
                                    fontSize: 17),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                '${snapshot.data?.wind} km/h',
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.5),
                                    fontSize: 23),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                'LastUpdate',
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.5),
                                    fontSize: 17),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                '${snapshot.data?.last_update}',
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.5),
                                    fontSize: 15),
                              ),
                            ],
                          ))
                        ],
                      )
                    ],
                  ),
                ),
              );
            })));
  }
}
