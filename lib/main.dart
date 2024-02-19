import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_banergy/product/information.dart';
import 'package:flutter_tesseract_ocr/flutter_tesseract_ocr.dart';
import '../appbar/menu.dart';
import 'appbar/search.dart';
import '../mypage/mypage.dart';
//import 'package:qr_bar_code_scanner_dialog/qr_bar_code_scanner_dialog.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter_banergy/main_category/Fastfood.dart';
import 'package:flutter_banergy/main_category/Dessert.dart';
import 'package:flutter_banergy/main_category/Sandwich.dart';
import 'package:flutter_banergy/main_category/Food.dart';
import 'package:flutter_banergy/main_category/cake.dart';
import 'package:flutter_banergy/main_category/Drink.dart';
import 'package:flutter_banergy/main_category/Mealkit.dart';

void main() {
  runApp(const MainpageApp());
}

class MainpageApp extends StatelessWidget {
  final File? image;
  const MainpageApp({super.key, this.image});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '식품 알레르기 관리 앱',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 255, 255, 255)),
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          backgroundColor: Color.fromARGB(255, 50, 160, 107),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('식품 알레르기 관리 앱'),
        actions: [
          InkWell(
            onTap: () {
              // 검색 페이지로 이동
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SearchScreen()),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.search),
            ),
          ),
          InkWell(
            onTap: () {
              // 메뉴 페이지로 이동
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MenuScreen()),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.menu),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // 여기에 아이콘 슬라이드를 넣어줍니다.
          IconSlider(),
          const SizedBox(height: 16),
          Expanded(
            child: const ProductGrid(),
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}

class IconSlider extends StatelessWidget {
  const IconSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          IconItem(icon: Icons.fastfood, label: 'Fast Food'),
          IconItem(icon: Icons.cookie, label: 'Dessert'),
          IconItem(icon: Icons.bakery_dining, label: 'Sandwich'),
          IconItem(icon: Icons.lunch_dining, label: 'Food'),
          IconItem(icon: Icons.cake, label: 'Cake'),
          IconItem(icon: Icons.local_cafe, label: 'Drink'),
          IconItem(icon: Icons.food_bank, label: 'MealKit'),
        ],
      ),
    );
  }
}

class IconItem extends StatefulWidget {
  final IconData icon;
  final String label;

  const IconItem({Key? key, required this.icon, required this.label})
      : super(key: key);

  @override
  _IconItemState createState() => _IconItemState();
}

class _IconItemState extends State<IconItem> {
  bool isHovered = false; // 아이콘 위에 마우스 커서가 올려졌는지 여부를 관리하는 변수

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          isHovered = true; // 아이콘이 마우스 커서 위에 있을 때 상태를 변경합니다.
        });
      },
      onExit: (_) {
        setState(() {
          isHovered = false; // 아이콘이 마우스 커서 밖으로 나갈 때 상태를 변경합니다.
        });
      },
      child: GestureDetector(
        onTap: () {
          // 아이콘을 탭했을 때의 동작
          _handleIconTap(context);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                widget.icon,
                size: 36,
                color: isHovered
                    ? Colors.grey
                    : Colors.black, // 마우스 커서 상태에 따라 색상을 변경합니다.
              ),
              const SizedBox(height: 4),
              Text(widget.label),
            ],
          ),
        ),
      ),
    );
  }

  void _handleIconTap(BuildContext context) {
    switch (widget.label) {
      case 'Fast Food':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => FastfoodScreen()),
        );
        break;
      case 'Dessert':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DessertScreen()),
        );
        break;
      case 'Sandwich':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SandwichScreen()),
        );
        break;
      case 'Food':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => FoodScreenn()),
        );
        break;
      case 'Cake':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CakeScreenn()),
        );
        break;
      case 'Drink':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DrinkScreenn()),
        );
        break;
      case 'MealKit':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Mealkitcreenn()),
        );
        break;
    }
  }
}

class ProductGrid extends StatelessWidget {
  const ProductGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        // 상품 아이콘을 가져오거나 사용하는 코드 작성
        return Card(
          child: InkWell(
              onTap: () {
                //아이콘 클릭 시 실행할 동작 추가
                _handleProductClick(context, index);
              },
              child: Column(
                children: [
                  const Icon(Icons.fastfood, size: 48), // 아이콘 예시 (음식 아이콘)
                  Text('Product $index'),
                  Text('Description of Product $index'),
                ],
              )),
        );
      },
    );
  }
}

void _handleProductClick(BuildContext context, int index) {
  // 아이콘 클릭 시 실행할 동작을 여기에 추가
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('상품 정보'),
        content: Text('Product $index의 상세 정보를 표시합니다.'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('닫기'),
          ),
        ],
      );
    },
  );
}

//바텀 바 내용 구현
class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final ImagePicker _imagePicker = ImagePicker();
  String? code;
  String parsedText = '';

  late File? pickedImage; // 수정: 이미지 파일을 저장할 변수
  late File? _image;
  // getImage 함수 안에서 사용될 변수들을 함수 밖으로 이동
  late XFile? pickedFile;
  late String img64;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.adjust),
          label: "Lens",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'My',
        ),
      ],
      onTap: (index) {
        if (index == 0) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const MainpageApp()),
          );
        } else if (index == 1) {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return SingleChildScrollView(
                  child: Container(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // 카메라 부분
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () async {
                          Navigator.pop(context);

                          final pickedFile = await _imagePicker.pickImage(
                            source: ImageSource.camera,
                          );

                          if (pickedFile != null) {
                            // OCR 수행
                            var ocrText = await FlutterTesseractOcr.extractText(
                              pickedFile.path,
                              language: 'kor',
                            );

                            // Information 화면으로 이동하여 OCR 결과값 전달
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Information(
                                  image: File(pickedFile.path),
                                  parsedText: ocrText,
                                ),
                              ),
                            );
                          }
                        },
                        child: Text('Camera'),
                      ),
                    ),
                    // 갤러리 부분
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () async {
                          Navigator.pop(context);

                          final pickedFile = await _imagePicker.pickImage(
                              source: ImageSource.gallery);

                          if (pickedFile != null) {
                            // OCR 수행
                            var ocrText = await FlutterTesseractOcr.extractText(
                              pickedFile.path,
                              language: 'kor',
                            );

                            // Information 화면으로 이동하여 OCR 결과값 전달
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Information(
                                  image: File(pickedFile.path),
                                  parsedText: ocrText,
                                ),
                              ),
                            );
                          }
                        },
                        child: Text('Gallery'),
                      ),
                    ),

                    /* qr 코드 부분
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          _qrBarCodeScannerDialogPlugin.getScannedQrBarCode(
                            context: context,
                            onCode: (code) {
                              setState(() {
                                this.code = code;
                              });
                            },
                          );
                          Navigator.pop(context);
                        },
                        child: Text('QR code'),
                      ),
                    ),*/
                    // 바코드 부분
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Barcode'),
                      ),
                    ),
                  ],
                ),
              ));
            },
          );
        } else if (index == 2) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MypageApp()),
          );
        }
      },
    );
  }
}
