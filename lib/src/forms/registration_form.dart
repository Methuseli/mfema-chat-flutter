import 'package:ionicons/ionicons.dart';

final registrationForm = [
  {
    "type": "innerDivider",
    "name": null,
    "hidden": null,
    "required": null,
    "multiline": null,
    "icon": null,
    "hint": null,
  },
  {
    "type": "text",
    "name": "firstname",
    "hidden": false,
    "required": true,
    "multiline": false,
    "hint": "First Name",
    "icon": Ionicons.person_outline,
  },
  {
    "type": "text",
    "name": "middlename",
    "hidden": false,
    "required": false,
    "multiline": false,
    "hint": "Middle Name",
    "icon": Ionicons.person_outline,
  },
  {
    "type": "text",
    "name": "lastname",
    "hidden": false,
    "required": true,
    "multiline": false,
    "hint": "Last Name",
    "icon": Ionicons.person_outline,
  },
  {
    "type": "text",
    "name": "email",
    "hidden": false,
    "required": true,
    "multiline": false,
    "hint": "Email",
    "icon": Ionicons.mail_outline,
  },
  {
    "type": "text",
    "name": "phoneNumber",
    "hidden": false,
    "required": true,
    "multiline": false,
    "hint": "Phone Number",
    "icon": Ionicons.cellular_outline,
  },
  {
    "type": "innerDivider",
    "name": null,
    "hidden": null,
    "required": null,
    "multiline": null,
    "icon": null,
    "hint": null,
  },
  {
    "type": "text",
    "name": "description",
    "hidden": false,
    "required": false,
    "multiline": true,
    "hint": "Your Bio...",
    "icon": Ionicons.book_outline,
  },
  {
    "type": "file",
    "name": "profileImageUrl",
    "hidden": false,
    "required": false,
    "multiline": false,
    "hint": "Profile Image",
    "icon": Ionicons.cloud_upload_outline,
  },
  {
    "type": "innerDivider",
    "name": null,
    "hidden": null,
    "required": null,
    "multiline": null,
    "icon": null,
    "hint": null,
  },
  {
    "type": "text",
    "name": "username",
    "hidden": false,
    "required": true,
    "multiline": false,
    "icon": Ionicons.person_outline,
    "hint": "Username",
  },
  {
    "type": "text",
    "name": "password",
    "hidden": true,
    "required": true,
    "multiline": false,
    "icon": Ionicons.lock_closed_outline,
    "hint": "Password",
    "validator": (value) {
      if (value.isEmpty) {
        return 'Please enter a password';
      }
      final hasUppercase = RegExp(r'[A-Z]');
      final hasLowercase = RegExp(r'[a-z]');
      final hasNumber = RegExp(r'[0-9]');
      final hasSpecialCharacters = RegExp(r'[!@#$%^&*(),.?":{}|<>]');
      if (!(hasUppercase.hasMatch(value) ||
          hasLowercase.hasMatch(value) ||
          hasNumber.hasMatch(value) ||
          hasSpecialCharacters.hasMatch(value) ||
          value.length >= 8)) {
        return "Password must have at least one uppercase\n, one lower case\n, one number\n, one special character (!@#\$%^&*(),.?\":{}|<>), \nand must be at least 8 characters!!!";
      }
      return null;
    },
  },
  {
    "type": "text",
    "name": "confirmPassword",
    "hidden": true,
    "required": true,
    "multiline": false,
    "icon": Ionicons.lock_closed_outline,
    "hint": "Confirm Password",
  },
  {
    "type": "button",
    "name": null,
    "hidden": null,
    "required": null,
    "multiline": null,
    "icon": null,
    "hint": "Register",
  },
  {
    "type": "divider",
    "name": null,
    "hidden": null,
    "required": null,
    "multiline": null,
    "icon": null,
    "hint": null,
  }
];
