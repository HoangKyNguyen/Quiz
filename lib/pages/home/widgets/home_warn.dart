import 'package:flutter/material.dart';
import '../../../apps/utils/const.dart';

Future<void> showModalNotify(context) => showDialog(
  context: context,
  builder: (BuildContext context) {
    return AlertDialog(
      title: const Text('Notify',style: TextStyle(color: Colors.black)),
      content: const Text(
        'Please choice a language to Start',
        style: TextStyle(color: Colors.black),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Close'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  },
);
