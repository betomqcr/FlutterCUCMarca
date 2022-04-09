import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// Create a enum for get status of dialogAlert
enum StatusAlert {
  Success,
  Error
}

showAlert({
  required BuildContext context, 
  required String title,
  required String subTitle,
  required StatusAlert status,
  String? pageOk,
  String? pageCancel,
}) {

  Color color;

  if(status == StatusAlert.Success) {
    color = Colors.green.shade500;
  } else {
    color = Colors.red.shade500;
  }

  if(Platform.isAndroid){
    return showDialog(
    context: context, 
      builder: (_) => AlertDialog(
        title: Text(title, style: TextStyle(color: color)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(subTitle),
          ],
        ),
        actions: [
          MaterialButton(
            child: const Text('Ok'),
            elevation: 5,
            textColor: Colors.blue,
            onPressed: () {
              if(status == StatusAlert.Success){
                Navigator.pushNamed(context, pageOk ?? 'home');
              } else {
                Navigator.pushNamed(context, pageCancel ?? 'home');
              }
            },
          )
        ],
      )
    );
  }

  showCupertinoDialog(
    context: context, 
    builder: (_) => CupertinoAlertDialog(
      title: Text(title, style: TextStyle(color: color)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(subTitle),
        ],
      ),
      actions: [
        CupertinoDialogAction(
          isDefaultAction: true,
          child: const Text('Ok'),
          onPressed: () {
            if(status == StatusAlert.Success){
                Navigator.pushReplacementNamed(context, pageOk ?? 'home');
              } else {
                Navigator.pushReplacementNamed(context, pageCancel ?? 'home');
              }
          }
        )
      ],
    )
  );
}
