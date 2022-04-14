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
  bool? isValidation,
  bool? isLogin,
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

              if(isValidation == true) {
                Navigator.of(context).pop();  
                return;
              }

              if(isLogin == true) {
                if(status == StatusAlert.Success){
                  Navigator.pushNamed(context, 'home');
                  return;
                } else {
                  Navigator.of(context).pop();
                  return;
                }
              }

              if(status == StatusAlert.Success){
                Navigator.of(context).pop();
                return;
              } else {
                Navigator.of(context).pop();
                return;
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
