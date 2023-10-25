import 'package:dcm/cal.dart';
import 'package:dcm/con.dart';
import 'package:dcm/fmhelper.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  Get.put(TestController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController tc1 = TextEditingController();
  final TextEditingController tc2 = TextEditingController();

  final c = Get.find<TestController>();

  final String nin = '999999999999999999.999999999999999999';
  final String attk =
      '999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999.999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(c.findT1.value),
              SizedBox(
                height: 10,
              ),
              Text(c.findT2.value),
              Flexible(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: Column(
                        children: [
                          Flexible(
                              child: TextField(
                            controller: tc1,
                          )),
                          SizedBox(
                            height: 10,
                          ),
                          Flexible(
                              child: TextField(
                            controller: tc2,
                          )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: Text(c.result.value),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        tc1.text = nin;
                        tc2.text = nin;
                      },
                      child: Text('nin')),
                  ElevatedButton(
                      onPressed: () {
                        tc1.text = attk;
                        tc2.text = attk;
                      },
                      child: Text('attk')),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        c.findT1.value = tc1.text;
                        c.findT2.value = tc2.text;
                        Decimal? result = DecimalCalculator.add(
                            c.findT1.value, c.findT2.value);
                        if (result != null) {
                          String resultfinal =
                              DecimalHelper.displayFormat(result);
                          c.result.value = resultfinal;
                          print(resultfinal);
                        }
                        tc1.clear();
                        tc2.clear();
                      },
                      child: Text('+')),
                  ElevatedButton(
                      onPressed: () {
                        c.findT1.value = tc1.text;
                        c.findT2.value = tc2.text;
                        Decimal? result = DecimalCalculator.subtract(
                            c.findT1.value, c.findT2.value);
                        if (result != null) {
                          String resultfinal =
                              DecimalHelper.displayFormat(result);
                          c.result.value = resultfinal;
                          print(resultfinal);
                        }
                        tc1.clear();
                        tc2.clear();
                      },
                      child: Text('-')),
                  ElevatedButton(
                      onPressed: () {
                        c.findT1.value = tc1.text;
                        c.findT2.value = tc2.text;
                        Decimal? result = DecimalCalculator.multiply(
                            c.findT1.value, c.findT2.value);
                        if (result != null) {
                          String resultfinal =
                              DecimalHelper.displayFormat(result);
                          c.result.value = resultfinal;
                          print(resultfinal);
                        }
                        tc1.clear();
                        tc2.clear();
                      },
                      child: Text('*')),
                  ElevatedButton(
                      onPressed: () {
                        c.findT1.value = tc1.text;
                        c.findT2.value = tc2.text;
                        Decimal? result = DecimalCalculator.divide(
                            c.findT1.value, c.findT2.value);
                        if (result != null) {
                          String resultfinal =
                              DecimalHelper.displayFormat(result);
                          c.result.value = resultfinal;
                          print(resultfinal);
                        }
                        tc1.clear();
                        tc2.clear();
                      },
                      child: Text('/')),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        c.findT1.value = tc1.text;
                        c.findT2.value = tc2.text;
                        double? result = double.parse(c.findT1.value) +
                            double.parse(c.findT2.value);
                        if (result != null) {
                          String resultfinal = result.toString();
                          c.result.value = resultfinal;
                          print(resultfinal);
                        }
                        tc1.clear();
                        tc2.clear();
                      },
                      child: Text('not +')),
                  ElevatedButton(
                      onPressed: () {
                        c.findT1.value = tc1.text;
                        c.findT2.value = tc2.text;
                        double? result = double.parse(c.findT1.value) -
                            double.parse(c.findT2.value);
                        if (result != null) {
                          String resultfinal = result.toString();
                          c.result.value = resultfinal;
                          print(resultfinal);
                        }
                        tc1.clear();
                        tc2.clear();
                      },
                      child: Text('not -')),
                  ElevatedButton(
                      onPressed: () {
                        c.findT1.value = tc1.text;
                        c.findT2.value = tc2.text;
                        double? result = double.parse(c.findT1.value) *
                            double.parse(c.findT2.value);
                        if (result != null) {
                          String resultfinal = result.toString();
                          c.result.value = resultfinal;
                          print(resultfinal);
                        }
                        tc1.clear();
                        tc2.clear();
                      },
                      child: Text('not *')),
                  ElevatedButton(
                      onPressed: () {
                        c.findT1.value = tc1.text;
                        c.findT2.value = tc2.text;
                        double? result = double.parse(c.findT1.value) /
                            double.parse(c.findT2.value);
                        if (result != null) {
                          String resultfinal = result.toString();
                          c.result.value = resultfinal;
                          print(resultfinal);
                        }
                        tc1.clear();
                        tc2.clear();
                      },
                      child: Text('not /')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
