import 'package:flutter/material.dart';

class FormController extends StatefulWidget {
  final List<Widget> widgets;
  final Function(bool isValid) onValidate; // Callback for validation result
  final Function(Map<String, dynamic> formData) onSubmit; // Callback for form data

  const FormController({super.key, required this.widgets, required this.onValidate, required this.onSubmit});

  @override
  State<FormController> createState() => _FormControllerState();
}

class _FormControllerState extends State<FormController> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // Map<String, dynamic> formData = {};

  void validateForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Get form data
      // widget.onSubmit(formData); // Pass data to onSubmit callback
    } else {
      widget.onValidate(false); // Pass validation result to onValidate callback
    }
  }


  @override
  Widget build(BuildContext context) {
    return Form(
        child: ListView(
      children: widget.widgets,
    ));
  }
}
