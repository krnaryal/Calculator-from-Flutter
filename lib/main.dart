import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      title: "Flutter Calculator",
      theme: ThemeData(primaryColor: Colors.orangeAccent),
      debugShowCheckedModeBanner: false,
      home: MyCalc(),
    ));

class MyCalc extends StatefulWidget {
  @override
  _MyCalcState createState() => _MyCalcState();
}

class _MyCalcState extends State<MyCalc> {
  var _operation = ['addition', 'subtraction', 'multiplication', 'division'];
  var _values="addition";
  var _displayText="";
  TextEditingController textBox1 =TextEditingController();
  TextEditingController textbox2=TextEditingController();
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle=Theme.of(context).textTheme.headline1;
    return Scaffold(
        appBar: AppBar(
          title: Text('Saurab ko Calculator'),
        ),
        body: Container(
          child: ListView(
            padding: EdgeInsets.all(17),
            children: <Widget>[
              // Drod down menu code section
              DropdownButton<String>(value: _values,
                style: textStyle,
                items: _operation.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _values = value;

                    print("value chnged to $value");
                  });
                  value = _values;
                },
              ),
            Padding(padding: EdgeInsets.only(bottom: 7)),

              //Second item
              TextField(
                controller: textBox1,
                style: textStyle,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Enter First number",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
              ),
              Padding(padding: EdgeInsets.only(bottom: 10)),

              // Third item
              TextField(
                controller: textbox2,
                style: textStyle,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Enter Second number",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
              ),
               Padding(padding: EdgeInsets.only(bottom: 20)),

              //Fourth Item
              Text(_displayText,style: TextStyle(fontSize: 25,color: Colors.deepPurple),),
              //Text("The result is"),
               Padding(padding: EdgeInsets.only(bottom: 15)),


              //fifth item
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      child: Text('Calculate'),
                      onPressed: () {
                        setState(() {
                          double first = double.parse(textBox1.text);
                          double second = double.parse(textbox2.text);
                          switch (_values) {
                            case "addition":
                            var sum=first+second;
                            _displayText="the sum is"+sum.toStringAsFixed(0);
                            break;
                            
                            case "subtraction":
                            var dif=first-second;
                            _displayText="the diffrence is"+dif.toStringAsFixed(0);
                            break;

                            case"multiplication":
                            var mul = first*second;
                            _displayText="the multiplication is"+mul.toStringAsFixed(0);
                            break;
                            case"division":
                            var div=first/second;
                            _displayText="the division is"+div.toStringAsFixed(0);

                              
                              break;
                            default:
                            _displayText="input error";
                          }
                          
                          
                        });

                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(onPressed: () {
                      setState(() {
                        _clearAll();
                      });
                    }, child: Text('Clear')),
                  )
                ],
              )
            ],
          ),
        ));
  }
  void _clearAll(){
    textBox1.text="";
    textbox2.text="";
    

  }
}
