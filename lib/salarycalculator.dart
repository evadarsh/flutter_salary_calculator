import 'package:flutter/material.dart';
import 'package:flutter_salary_calculator/displayresult.dart';

class SalaryCalculator extends StatefulWidget {
  const SalaryCalculator({super.key});

  @override
  State<SalaryCalculator> createState() => _SalaryCalculatorState();
}

class _SalaryCalculatorState extends State<SalaryCalculator> {
final TextEditingController _fnamecontroller=TextEditingController();
final TextEditingController _lnamecontroller=TextEditingController();
final TextEditingController _basicsalarycontroller=TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? Department;
  String? Gender;
  List<String> departments = ['Accounts', 'Sales', 'Manager', 'Clerk'];
   void submit(){
    var name = "${_fnamecontroller.text} ${_lnamecontroller.text}";
    double salary = double.parse(_basicsalarycontroller.text);
    Navigator.push(context, MaterialPageRoute(builder: (context) => DisplayResult(Name: name, Gender: Gender,  Dept: Department, BasicSalary: salary),));
  }
  
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Basic Salary Calculator')),
      ),
      body: Form(
        child: ListView(
          children: [
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text('First Name'),
                ),
                const SizedBox(width: 20),
                Expanded(
                    child: TextFormField(
                      controller: _fnamecontroller,
                      decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                )),
              ],
            ),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text('Last Name'),
                ),
                const SizedBox(width: 20),
                Expanded(
                    child: TextFormField(
                  controller: _lnamecontroller,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                )),
              ],
            ),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text('Gender'),
                ),
                const SizedBox(width: 20),
                Row(
                  children: [
                    Title(color: Colors.black, child: const Text('Male')),
                    Radio(
                      value: 'Male',
                      groupValue: Gender,
                      onChanged: (value) {
                        setState(() {
                          Gender = value!;
                        });
                      },
                    ),
                    Title(color: Colors.black, child: const Text('Female')),
                    Radio(
                      value: 'Female',
                      groupValue: Gender,
                      onChanged: (value) {
                        setState(() {
                          Gender = value!;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text('Basic Salary'),
                ),
                const SizedBox(width: 20),
                Expanded(
                    child: TextFormField(
                      controller: _basicsalarycontroller,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                )),
              ],
            ),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text('Department'),
                ),
                Expanded(
                  child: DropdownButtonFormField(
                  items: departments.map((String department) {
                    return DropdownMenuItem(
                      value: department,
                      child: Text(department),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      Department = value;
                    });
                  },
                  value: Department,
                 ),
                ),
              ],
            ),
            Row( 
              children: [
                ElevatedButton(onPressed: (){
                  submit();
                }, child: const Text('Submit')),
                ElevatedButton(onPressed: (){
                  _formKey.currentState?.reset();
                      _fnamecontroller.clear();
                      _lnamecontroller.clear();
                      _basicsalarycontroller.clear();
                      setState(() {
                        Gender = null;
                        Department = null;
                      });
                }, child: const Text('Clear')),
              ]
            ),
          ],
        ),
      ),
    ));
  }
}
