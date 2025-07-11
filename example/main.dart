import 'package:flutter/material.dart';
import 'package:styled_drop_down/styled_drop_down.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomePage());
  }
}
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selected = 'Option 1';
  final List<String> items = ['Option 1', 'Option 2', 'Option 3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Styled Dropdown Example'),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          
           Padding(
            padding: const EdgeInsets.all(16.0),
            child: StyledDropDown(
              dropDownBodyColor: Colors.pink.shade100,
              itemContainerColor: Colors.white,
              isRequired: true,
              requiredErrorText: "This field is required ",
              //customize row
              itemBuilder: (context, item, selected) {
                return Row(
                  children: [
                    SizedBox(width: 8),
                    Text(item.toString()),
                    Spacer(),
                    selected ? Icon(Icons.check) : SizedBox(),
                  ],
                );
              },
              label: 'Select an option', 
              value: selected,
              items: items,
              onChanged: (value) {
                setState(() {
                  selected = value;
                });
              },
              maxHeight: 200, 
              menuRightPadding: 1.0,
            ),
          ),
        ],
      ),
    );
  }
}
