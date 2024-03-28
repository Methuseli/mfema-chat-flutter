import 'package:flutter/material.dart';
import 'package:mfema_chat/src/util/constants.dart';

class FormController extends StatefulWidget {
  final List<Map<String, dynamic>> widgets;
  final Function(bool isValid) onValidate; // Callback for validation result
  final Function(Map<String, dynamic> formData)
      onSubmit; // Callback for form data

  const FormController(
      {super.key,
      required this.widgets,
      required this.onValidate,
      required this.onSubmit});

  @override
  State<FormController> createState() => _FormControllerState();
}

class _FormControllerState extends State<FormController> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  void validateForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      widget.onSubmit(_formData); // Pass data to onSubmit callback
    } else {
      widget.onValidate(false); // Pass validation result to onValidate callback
    }
  }

  @override
  Widget build(BuildContext context) {

    return Form(
      key: _formKey,
      child: Column(
        // shrinkWrap: true,
        children: widget.widgets.map((widget) {
          if (widget['type']! == "text") {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 8),
              child: widget['multiline'] ?
              Material(
                elevation: 8,
                shadowColor: Colors.black87,
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(30),
                child: TextFormField(
                  maxLines: null,
                  minLines: 3,
                  keyboardType: TextInputType.multiline,
                  validator: (value) {
                        if (widget["required"]! &&
                            (value == null || value.isEmpty)) {
                          return 'Field cannot be empty!';
                        }
                        return null;
                      },
                  onSaved: (value) {
                    _formData[widget['name']!] = value!;
                  },
                  obscureText: widget['hidden']!,
                  textAlignVertical: TextAlignVertical.bottom,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: widget['hint']!,
                    prefixIcon: Icon(widget['icon']!),
                  ),
                ),
              )

              : SizedBox(
                height: 50,
                child: Material(
                  elevation: 8,
                  shadowColor: Colors.black87,
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(30),
                  child: TextFormField(
                    validator: widget['name']! == 'confirmPassword'
                        ? (value) {
                            if (value != _formData['password']) {
                              return "Password do not match";
                            }
                            return null;
                          }
                        : widget['validator'] ??
                            (value) {
                              if (widget["required"]! &&
                                  (value == null || value.isEmpty)) {
                                return 'Field cannot be empty!';
                              }
                              return null;
                            },
                    onSaved: (value) {
                      _formData[widget['name']!] = value!;
                    },
                    obscureText: widget['hidden']!,
                    textAlignVertical: TextAlignVertical.bottom,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: widget['hint']!,
                      prefixIcon: Icon(widget['icon']!),
                    ),
                  ),
                ),
              ),
            );
          } else if (widget['type']! == 'button') {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 36, vertical: 8),
              child: ElevatedButton(
                onPressed: () {
                  validateForm();
                },
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 50),
                    shape: const StadiumBorder(),
                    backgroundColor: kSecondaryColor,
                    elevation: 8,
                    shadowColor: Colors.black87),
                child: Text(
                  widget['hint'],
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ); // Return other widgets (e.g., buttons) as-is
          } else if (widget['type']! == 'file') {
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 36,
                vertical: 8,
              ),
              child: SizedBox(
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 50),
                    shape: const StadiumBorder(),
                    backgroundColor: kContentColorDarkTheme,
                    elevation: 8,
                    shadowColor: Colors.black87,
                  ),
                  child: Wrap(
                    children: <Widget>[
                      Icon(
                        widget['icon']!,
                        color: Colors.black38,
                        size: 24.0,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(widget['hint'],
                          style: const TextStyle(
                              fontSize: 17, color: Colors.black38))
                    ],
                  ),
                ),
              ),
            );
          } else if (widget['type'] == 'innerDivider') {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 130, vertical: 8),
              child: Row(
                children: [
                  Flexible(
                    child: Container(
                      height: 1,
                      color: kPrimaryColor,
                    ),
                  ),
                ],
              ),
            );
          }

          else {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 130, vertical: 8),
              child: Row(
                children: [
                  Flexible(
                    child: Container(
                      height: 1,
                      color: kPrimaryColor,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'or',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      height: 1,
                      color: kPrimaryColor,
                    ),
                  ),
                ],
              ),
            );
          }
        }).toList(),
      ),
    );
  }
}
