import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RotatingDropdownForm(),
    );
  }
}

class RotatingDropdownForm extends StatefulWidget {
  @override
  _RotatingDropdownFormState createState() => _RotatingDropdownFormState();
}

class _RotatingDropdownFormState extends State<RotatingDropdownForm>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  String? dropdownValue;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
  }

  void _handleSubmit() {
    if (_formKey.currentState!.validate()) {
      _animationController.repeat();
      Future.delayed(const Duration(seconds: 2), () {
        _animationController.stop();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Form Submitted: $dropdownValue")),
        );
      });
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Rotating Button Form"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: "Choose an Option",
                  border: OutlineInputBorder(),
                ),
                value: dropdownValue,
                items: ["Option 1", "Option 2", "Option 3"]
                    .map((option) => DropdownMenuItem<String>(
                          value: option,
                          child: Text(option),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    dropdownValue = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please select an option.";
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  return Transform.rotate(
                    angle: _animationController.value * 6.28, // 360 degrees
                    child: ElevatedButton(
                      onPressed: _handleSubmit,
                      child: Text("Submit"),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
  