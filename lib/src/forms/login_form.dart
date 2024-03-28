import 'package:ionicons/ionicons.dart';

final loginForm = [
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
    "name": "password",
    "hidden": true,
    "required": true,
    "multiline": false,
    "hint": "Password",
    "icon": Ionicons.lock_closed_outline,
  },
  {
    "type": "button",
    "name": null,
    "hidden": null,
    "required": null,
    "multiline": null,
    "icon": null,
    "hint": "Log In",
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
