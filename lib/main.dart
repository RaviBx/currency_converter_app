import 'package:currency_converter_app/services/api_client.dart';
import 'package:currency_converter_app/widgets/drop_down.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  //const ({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Creating instance of the API Client
  ApiClient client = ApiClient();

  //Setting up the main colors.
  Color mainColor = Color(0xFF212936);
  Color secondColor = Color(0xFF2849E5);

  //Setting the variables
  List<String> currencies;
  String from;
  String to;

  //Exchange Rating Varibles
  double rate;
  String result = "";

  //Function to call the API
  //Future<List<String>> getCurrencyList() async {
    //return await client
        //.getCurrencies(); //Getting getCurrencies function from api_client
  //}

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // ignore: unnecessary_statements
    (() async {
      List<String> list = await client.getCurrencies();
      setState(() {
        currencies = list;
      });
    })();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 200.0,
                child: Text(
                  'Currency Converter',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                  child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //Text Field
                    TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        labelText: "Input value to convert",
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 18.0,
                          color: secondColor,
                        ),
                      ),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: 20.0),
                    Row(
                      children: [
                        //Creating custom widget for the currencies drop down button
                        customDropDown(currencies, from, (val) {
                          setState(() {
                            from = val;
                          });

                        })

                        //currencies from the API
                      ],
                    ),
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
