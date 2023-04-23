import 'dart:io';

import 'package:device_info/services/device_info_service.dart';
import 'package:device_info/widget/info_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map<String, dynamic> deviceInfo = {};
  @override
  void initState() {
    init();
    super.initState();
  }

  Future init() async {
    final deviceInfo = await DeviceInfoApi.getInfo();
    if (!mounted) return;
    setState(() => this.deviceInfo = deviceInfo);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Platform.isAndroid
              ? "Android Device Info"
              : Platform.isIOS
                  ? "iOS Device Info"
                  : "",
        ),
      ),
      body: InfoWidget(map: deviceInfo),
    );
  }
}
