import 'package:flutter/material.dart';

class SalaryCalculator extends StatefulWidget {
  const SalaryCalculator({super.key});

  @override
  State<SalaryCalculator> createState() => _SalaryCalculatorState();
}

class _SalaryCalculatorState extends State<SalaryCalculator> {
  @override
  Widget build(BuildContext context) {
    return(Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Basic Salary Calculator')),
      ) ,
      body: ListView(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text('First Name'),
              ),
              SizedBox(width:20),
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)
                    )
                  ),
                )
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text('Last Name'),
              ),
              SizedBox(width:20),
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)
                    )
                  ),
                )
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text('Gender'),
              ),
              SizedBox(width:20),
              Row(
                children: [
                  Title(color: Colors.black, child:Text('Male')),
                  Radio(value: 'Male', groupValue: 'Gender', onChanged: (String? value) {  },
                      ),
                  Title(color: Colors.black, child:Text('Female')),
                  Radio(value: 'Female', groupValue: 'Gender', onChanged: (String? value) {  },
                      ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text('Basic Salary'),
              ),
              SizedBox(width:20),
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)
                    )
                  ),
                )
              ),
            ],
          ),
         ],
      ),
    ));
}
}