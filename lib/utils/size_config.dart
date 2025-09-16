import 'package:flutter/material.dart';

class SizeConfig {
  // class MediaQuery adalah class yang berfungsi untuk membuat aplikasi menjadi responsive
  // dengan cara mengambil ukuran aktual pada layar platform
  static MediaQueryData _mediaQueryData = 
  MediaQueryData.fromView(
    // ignore: deprecated_member_use
    WidgetsBinding.instance.window
  );
  // variabel untuk menampung default size dari aplikasi 
  // sebelum di deploy ke platform yang spesifik dan 
  // mendapatkan ukuran aktual dari platform tersebut 
  // (misal: di deploy dari android)
  static double screenWidth = 0.0;
  static double screenHeight = 0.0;
  static double defaultSize = 0.0;

  // fungsi dari function ini adalah untuk pemanggilan awal ketika aplikasi dijalankan
  // dan untuk mendapatkan ukuran dari layar platform
  void init(BuildContext context) {
    // untuk mengambil ukuran aktual (sesuai device)
    // karena didalam varable _mediaQueryData
    // didalamnya memanggil class media query
    // yang class media query itu sendiri berfungsi untk membuat untuk mengambil ukuran aktual dari platform (sesuai device)
    _mediaQueryData= MediaQuery.of(context);
    // data ukuran widht saja
    screenWidth = _mediaQueryData.size.width;
    // data ukuran height saja
    screenHeight = _mediaQueryData.size.height;
  }
}

// menggunakan size standar dari hp ip X ukuran (812 X 375)
double getProporsionateScreenHeight(double inputHeight) {
  double screenHeight = SizeConfig.screenHeight;
  // ini adalah perhitungan untuk mengahasilkan nilai dan ukuran Objek yang responsif dengan platform
  return (inputHeight / 812.0) * screenHeight;
}

double getProporsionateScreenWidht(double inputWidht) {
  double screenWidth = SizeConfig.screenWidth;
  return (inputWidht / 375.0) * screenWidth;
}