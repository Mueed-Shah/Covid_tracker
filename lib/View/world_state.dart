import 'package:covid_tracker/Model/world_states_model.dart';
import 'package:covid_tracker/Services/state_services.dart';
import 'package:covid_tracker/View/countries_list.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class WorldStateScreen extends StatefulWidget {
  const WorldStateScreen({super.key});

  @override
  State<WorldStateScreen> createState() => _WorldStateScreenState();
}

class _WorldStateScreenState extends State<WorldStateScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 5),
    vsync: this,
  )..repeat();
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }



  List<Color> colorList = [
    const Color(0xffD95AF3),
    const Color(0xff3EE094),
    const Color(0xff3398F6),
  ];
  @override
  Widget build(BuildContext context) {
    StateServices stateServices =StateServices();
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          FutureBuilder(future: stateServices.fetchWorldStateRecord(),
              builder: (context,AsyncSnapshot<WorldStatesModel> snapshot) {
            if(!snapshot.hasData){
              return const  Expanded(
                  flex: 1,
                  child:
                  SpinKitCircle(
                    color: Colors.white,
                    size: 50.0,
                  ),
              );
            }else{
              return PieChart(
                dataMap: {
                  "Total" : double.parse(snapshot.data!.cases!.toString()),
                  "Recovered": double.parse(snapshot.data!.recovered.toString()),
                  "Deaths" : double.parse(snapshot.data!.deaths.toString())
                },
                colorList: colorList,
                chartType: ChartType.ring,
                chartRadius: MediaQuery.of(context).size.width / 3.2,
                animationDuration: const Duration(seconds: 3),
                chartValuesOptions: const ChartValuesOptions(

                  showChartValuesInPercentage: true,

                ),
                legendOptions: const LegendOptions(
                  legendTextStyle: TextStyle(fontSize: 15),
                  legendPosition: LegendPosition.left,
                ),
              );
            }

              },),

          Padding(
            padding: EdgeInsets.symmetric(vertical :MediaQuery.of(context).size.height * 0.06),
            child: const Card(
              child: Column(
                children: [
                  ReUsableRow(title: 'title', value: 'value'),
                  ReUsableRow(title: 'title', value: 'value'),
                  ReUsableRow(title: 'title', value: 'value'),
                ],
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: TextButton(onPressed: (){
              Navigator.push(context,
              MaterialPageRoute(builder: (context)=>const CountriesList()));
            },
              style: ButtonStyle(
                backgroundColor:
                MaterialStateProperty.all<Color>(
                    Colors.green),
                shape:
                MaterialStateProperty.all<OutlinedBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ), child: const Text("Track Countries"),
            ),
          )
        ],
      ),
    )));
  }
}

class ReUsableRow extends StatelessWidget {
  const ReUsableRow({required this.title, required this.value, super.key});
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5, top: 5),
      child: Column(
        children :[ Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text(title), Text(value)],
        ),
        const Divider()
        ]
      ),
    );
  }
}
