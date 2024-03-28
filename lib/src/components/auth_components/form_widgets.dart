import 'package:flutter/material.dart';
import 'package:mfema_chat/src/util/constants.dart';

Widget inputField(String hint, IconData iconData, hidden, validator, onSave) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 8),
    child: SizedBox(
      height: 50,
      child: Material(
        elevation: 8,
        shadowColor: Colors.black87,
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(30),
        child: TextFormField(
          validator: validator ,
          onSaved: onSave,
          obscureText: hidden,
          textAlignVertical: TextAlignVertical.bottom,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Colors.white,
            hintText: hint,
            prefixIcon: Icon(iconData),
          ),
        ),
      ),
    ),
  );
}

Widget multipleLineInputField(String hint, IconData iconData) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 8),
    child: SizedBox(
      height: 50,
      child: Material(
        elevation: 8,
        shadowColor: Colors.black87,
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(30),
        child: TextFormField(
          textAlignVertical: TextAlignVertical.bottom,
          maxLines: null,
          minLines: 3,
          keyboardType: TextInputType.multiline,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Colors.white,
            hintText: hint,
            prefixIcon: Icon(iconData),
          ),
        ),
      ),
    ),
  );
}

Widget fileInput(String hint, IconData iconData, bool multiple) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 8),
    child: SizedBox(
      height: 50,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: const StadiumBorder(),
          backgroundColor: kContentColorDarkTheme,
          elevation: 8,
          shadowColor: Colors.black87,
        ),
        child: Wrap(
          children: <Widget>[
            Icon(
              iconData,
              color: Colors.black38,
              size: 24.0,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(hint,
                style: const TextStyle(fontSize: 17, color: Colors.black38))
          ],
        ),
      ),
    ),
  );
}

// Widget actionButton(String title, Function(Map<String, String> formData) onPressed) {
//   return Padding(
//     padding: const EdgeInsets.symmetric(horizontal: 135, vertical: 16),
//     child: ElevatedButton(
//       onPressed: () {onPressed(formData);},
//       style: ElevatedButton.styleFrom(
//         padding: const EdgeInsets.symmetric(vertical: 14),
//         shape: const StadiumBorder(),
//         backgroundColor: kSecondaryColor,
//         elevation: 8,
//         shadowColor: Colors.black87,
//       ),
//       child: Text(
//         title,
//         style: const TextStyle(
//           fontSize: 18,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//     ),
//   );
// }

Widget orDivider() {
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

Widget logos() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 16),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/images/facebook.png'),
        const SizedBox(width: 24),
        Image.asset('assets/images/google.png'),
      ],
    ),
  );
}

// Widget forgotPassword() {
//   return Padding(
//     padding: const EdgeInsets.symmetric(horizontal: 110),
//     child: TextButton(
//       onPressed: () {},
//       child: const Text(
//         'Forgot Password?',
//         style: TextStyle(
//           fontSize: 16,
//           fontWeight: FontWeight.w600,
//           color: kSecondaryColor,
//         ),
//       ),
//     ),
//   );
// }
