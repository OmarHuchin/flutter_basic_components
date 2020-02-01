import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'app.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized(); 
  ByteData data = await rootBundle.load('assets/certificate/pa_5220_cedis.pem');
  SecurityContext context = SecurityContext.defaultContext;
  context.setTrustedCertificatesBytes(data.buffer.asUint8List());
  runApp(App());
}

