import 'package:flutter/material.dart';
import 'package:quote_app/Models/quotes_model.dart';

class QuotePage extends StatefulWidget {
  const QuotePage({super.key});

  @override
  State<QuotePage> createState() => _QuotePageState();
}

class _QuotePageState extends State<QuotePage> {
  List<String> fontFamilies = ['Roboto', 'Arial', 'Courier', 'Times New Roman'];
  List<Color> colors = [
    Colors.white,
    Colors.black,
    ...Colors.primaries,
  ];
  List<String> backgroundImages = [
    'assets/background1.jpg', // Example asset images
    'assets/background2.jpg',
    'https://example.com/image1.jpg', // Example network images
    'https://example.com/image2.jpg',
  ];
  List img = [
    'assets/images/1.jpeg',
    'assets/images/2.jpeg',
    'assets/images/3.jpeg',
    'assets/images/4.jpeg',
    'assets/images/5.jpeg',
    'assets/images/6.jpeg',
    'assets/images/7.jpeg',
    'assets/images/8.jpeg',
    'assets/images/9.jpeg',
    'assets/images/10.jpeg',
    'assets/images/11jpeg',
    'assets/images/12.jpeg',
    'assets/images/13.jpeg',
    'assets/images/14.jpeg',
    'assets/images/15.jpeg',
    'assets/images/16.jpeg',
    'assets/images/17.jpeg',
    'assets/images/18.jpeg',
    'assets/images/19.jpeg',
    'assets/images/20.jpeg',
    'assets/images/21.jpeg',
    'assets/images/22.jpeg',
  ];
  String? _selectedImage;
  double _fontSize = 16.0;
  String _fontFamily = 'Roboto';
  Color _bgColor = Colors.grey; // Default background color
  Color _fontColor = Colors.black;
  double _bgOpacity = 1;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    QuoteModel quote = ModalRoute.of(context)!.settings.arguments as QuoteModel;
    TextEditingController _controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios)),
        title: const Text(
          "👀 Can Edit 👀",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        titleSpacing: 1,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // controller: screenshotController,
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                height: size.height * 0.4,
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: _selectedImage == null
                      ? _bgColor.withOpacity(_bgOpacity)
                      : null,
                  image: _selectedImage != null
                      ? DecorationImage(
                          image: _selectedImage!.startsWith('assets')
                              ? AssetImage(_selectedImage!) as ImageProvider
                              : NetworkImage(_selectedImage!),
                          fit: BoxFit.cover,
                        )
                      : null,
                ),
                child: Text(
                  quote.quote,
                  style: TextStyle(
                    fontSize: _fontSize,
                    fontFamily: _fontFamily,
                    color: _fontColor,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              // Background color palette
              Text('Select Background Color:'),
              SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: colors.map((color) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedImage = null;
                          _bgColor = color; // Update background color
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 4),
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: color,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.black,
                            width: _bgColor == color ? 3 : 1,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: size.height * 0.02),

              // Font color palette
              Text('Select Font Color:'),
              SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: colors.map((color) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _fontColor = color; // Update font color
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 4),
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: color,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.black,
                            width: _fontColor == color ? 3 : 1,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: size.height * 0.02),

              // Background image selection
              Text('Select Background Image:'),
              SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: img.map((image) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedImage = image; // Update background image
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 4),
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: image.startsWith('assets')
                                ? AssetImage(image)
                                : NetworkImage(image) as ImageProvider,
                            fit: BoxFit.cover,
                          ),
                          shape: BoxShape.rectangle,
                          border: Border.all(
                            color: Colors.black,
                            width: _selectedImage == image ? 3 : 1,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: size.height * 0.02),

              // Opacity slider for background color
              Text('Adjust Background Opacity:'),
              Slider(
                value: _bgOpacity,
                // min: 0.0,
                // max: 1.0,
                divisions: 10,
                label: (_bgOpacity * 100).toStringAsFixed(0) + '%',
                onChanged: (double value) {
                  setState(() {
                    _bgOpacity = value; // Update opacity
                  });
                },
              ),
              // Font size slider
              Text('Adjust Font Size:'),
              Slider(
                value: _fontSize,
                min: 10.0,
                max: 50.0,
                divisions: 8,
                label: _fontSize.toStringAsFixed(0),
                onChanged: (double value) {
                  setState(() {
                    _fontSize = value; // Update font size
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
