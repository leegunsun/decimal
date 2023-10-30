import 'dart:math';

import 'package:dcm/cal.dart';
import 'package:dcm/addcon.dart';
import 'package:dcm/fmhelper.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'customInput.dart';

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

  Color getRandomColor() {
    final Random _random = Random();
    return Color.fromRGBO(
      _random.nextInt(256), // Red
      _random.nextInt(256), // Green
      _random.nextInt(256), // Blue
      1, // Alpha (opacity)
    );
  }


  final TextEditingController tc1 = TextEditingController();
  final TextEditingController tc2 = TextEditingController();

  final c = Get.find<TestController>();


  final lineNum = 4;
  final String nin = '999999999999999999.999999999999999999';
  final String attk =
      '999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999.999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999';

  Text showText (String name,String text) {
    return Text('$name => $text', maxLines: lineNum, overflow: TextOverflow.ellipsis);
  }

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
              showText('T1',c.findT1.value),
              showText('T1 count', '${c.findT1.value.length}'),
              SizedBox(
                height: 30,
              ),
              showText('T2',c.findT2.value),
              Flexible(
                child: Column(
                  children: [
                    Flexible(
                        child: TextField(
                          keyboardType: TextInputType.numberWithOptions(decimal: true),
                          inputFormatters: <TextInputFormatter>[
                            CustomNumberInputFormatter(),
                          ],
                          onChanged: (value){
                            c.findT1.value = value;
                          },
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
              Center(
                  child: showText('raw_result',c.rawResult.value)
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                child: showText('user_result',c.result.value)
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
                          String rawresult =
                          DecimalHelper.decimalDecode(result);
                          c.rawResult.value = rawresult;
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
                          String rawresult =
                          DecimalHelper.decimalDecode(result);
                          c.rawResult.value = rawresult;
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
                          String rawresult =
                          DecimalHelper.decimalDecode(result);
                          c.rawResult.value = rawresult;
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
                          String rawresult =
                          DecimalHelper.decimalDecode(result);
                          c.rawResult.value = rawresult;
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
