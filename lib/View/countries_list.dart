import 'package:covid_tracker/Services/state_services.dart';
import 'package:covid_tracker/View/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CountriesList extends StatefulWidget {
  const CountriesList({super.key});

  @override
  State<CountriesList> createState() => _CountriesListState();
}

class _CountriesListState extends State<CountriesList> {
  TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    StateServices stateServices = StateServices();



    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: textController,
                onChanged: (value){
                  setState(() {

                  });
                },

                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                    hintText: 'Search with county name',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0))),
              ),
            ),
            FutureBuilder(
              future: stateServices.fetchCountriesRecord(),
              builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                if (!snapshot.hasData) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Shimmer.fromColors(
                          baseColor: Colors.grey.shade700,
                          highlightColor: Colors.grey.shade100,
                          child: Column(children: [
                            ListTile(
                              leading: Container(
                                width: 50,
                                height: 50,
                                color: Colors.white,
                              ),
                              title: Container(
                                width: 89,
                                height: 10,
                                color: Colors.white,
                              ),
                              subtitle: Container(
                                width: 89,
                                height: 10,
                                color: Colors.white,
                              ),
                            ),
                          ]),
                        );
                      },
                    ),
                  );
                }
                else {
                  return Expanded(
                      child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          String name = snapshot.data![index]['country'];
                          if (textController.text.isEmpty) {
                            return ListTile(
                              leading: Image(
                                height: 30,
                                width: 30,
                                image: NetworkImage(
                                    snapshot
                                        .data![index]['countryInfo']['flag']),
                              ),
                              title: Text(snapshot.data![index]['country']),
                              subtitle:
                              Text(snapshot.data![index]['cases'].toString()),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          DetailScreen(
                                            name: snapshot
                                                .data![index]['country'],
                                            image: snapshot
                                                .data![index]['countryInfo']
                                            ['flag'],
                                            active: snapshot
                                                .data![index]['active'],
                                            critical: snapshot
                                                .data![index]['critical'],
                                            test: snapshot
                                                .data![index]['tests'],
                                            totalCases: snapshot
                                                .data![index]['cases'],
                                            totalDeaths: snapshot
                                                .data![index]['deaths'],
                                            totalRecovered: snapshot
                                                .data![index]
                                            ['recovered'],
                                          ),
                                    ));
                              },
                            );
                          } else if (name.toLowerCase().contains(textController.text.toLowerCase())) {
                            return ListTile(
                              leading: Image(
                                height: 30,
                                width: 30,
                                image: NetworkImage(
                                    snapshot
                                        .data![index]['countryInfo']['flag']),
                              ),
                              title: Text(snapshot.data![index]['country']),
                              subtitle:
                              Text(snapshot.data![index]['cases'].toString()),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          DetailScreen(
                                            name: snapshot
                                                .data![index]['country'],
                                            image: snapshot
                                                .data![index]['countryInfo']
                                            ['flag'],
                                            active: snapshot
                                                .data![index]['active'],
                                            critical: snapshot
                                                .data![index]['critical'],
                                            test: snapshot
                                                .data![index]['tests'],
                                            totalCases: snapshot
                                                .data![index]['cases'],
                                            totalDeaths: snapshot
                                                .data![index]['deaths'],
                                            totalRecovered: snapshot
                                                .data![index]
                                            ['recovered'],
                                          ),
                                    ));
                              },
                            );
                          }
                          else{
                            return Container();
                          }

                        },
                      ));
                }
                },
            )
          ],
        ),
      ),
    );
  }
}
