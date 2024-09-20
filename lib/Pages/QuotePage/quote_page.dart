import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:quote_app/Models/quotes_model.dart';

enum QuoteFeature {
  alignment,
  fontColor,
  fontFamily,
  backgroundImage,
  backgroundOpacity,
  quoteOpacity,
}

class QuotePage extends StatefulWidget {
  const QuotePage({super.key});

  @override
  State<QuotePage> createState() => _QuotePageState();
}

//
// class _QuotePageState extends State<QuotePage> {
//   List<String> fontFamilies = ['Roboto', 'Arial', 'Courier', 'Times New Roman'];
//   List<Color> colors = [
//     Colors.white,
//     Colors.black,
//     ...Colors.primaries,
//   ];
//   List img = [
//     'assets/images/1.jpeg',
//     'assets/images/2.jpeg',
//     'assets/images/3.jpeg',
//     'assets/images/4.jpeg',
//     'assets/images/5.jpeg',
//     'assets/images/6.jpeg',
//     'assets/images/7.jpeg',
//     'assets/images/8.jpeg',
//     'assets/images/9.jpeg',
//     'assets/images/10.jpeg',
//     'assets/images/11jpeg',
//     'assets/images/12.jpeg',
//     'assets/images/13.jpeg',
//     'assets/images/14.jpeg',
//     'assets/images/15.jpeg',
//     'assets/images/16.jpeg',
//     'assets/images/17.jpeg',
//     'assets/images/18.jpeg',
//     'assets/images/19.jpeg',
//     'assets/images/20.jpeg',
//     'assets/images/21.jpeg',
//     'assets/images/22.jpeg',
//   ];
//   String? _selectedImage;
//   double _fontSize = 16.0;
//   String _fontFamily = 'Roboto';
//   Color _bgColor = Colors.grey; // Default background color
//   Color _fontColor = Colors.black;
//   double _bgOpacity = 1;
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     QuoteModel quote = ModalRoute.of(context)!.settings.arguments as QuoteModel;
//     TextEditingController _controller = TextEditingController();
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             icon: Icon(Icons.arrow_back_ios)),
//         title: const Text(
//           "👀 Can Edit 👀",
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//         titleSpacing: 1,
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               // controller: screenshotController,
//               Container(
//                 margin: EdgeInsets.symmetric(horizontal: 5),
//                 height: size.height * 0.4,
//                 padding: const EdgeInsets.all(16.0),
//                 decoration: BoxDecoration(
//                   color: _selectedImage == null
//                       ? _bgColor.withOpacity(_bgOpacity)
//                       : null,
//                   image: _selectedImage != null
//                       ? DecorationImage(
//                           image: _selectedImage!.startsWith('assets')
//                               ? AssetImage(_selectedImage!) as ImageProvider
//                               : NetworkImage(_selectedImage!),
//                           fit: BoxFit.cover,
//                         )
//                       : null,
//                 ),
//                 child: Text(
//                   quote.quote,
//                   style: TextStyle(
//                     fontSize: _fontSize,
//                     fontFamily: _fontFamily,
//                     color: _fontColor,
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: size.height * 0.01,
//               ),
//               // Background color palette
//               Text('Select Background Color:'),
//               SizedBox(height: 10),
//               SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: Row(
//                   children: colors.map((color) {
//                     return GestureDetector(
//                       onTap: () {
//                         setState(() {
//                           _selectedImage = null;
//                           _bgColor = color; // Update background color
//                         });
//                       },
//                       child: Container(
//                         margin: EdgeInsets.symmetric(horizontal: 4),
//                         width: 40,
//                         height: 40,
//                         decoration: BoxDecoration(
//                           color: color,
//                           shape: BoxShape.circle,
//                           border: Border.all(
//                             color: Colors.black,
//                             width: _bgColor == color ? 3 : 1,
//                           ),
//                         ),
//                       ),
//                     );
//                   }).toList(),
//                 ),
//               ),
//               SizedBox(height: size.height * 0.02),
//
//               // Font color palette
//               Text('Select Font Color:'),
//               SizedBox(height: 10),
//               SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: Row(
//                   children: colors.map((color) {
//                     return GestureDetector(
//                       onTap: () {
//                         setState(() {
//                           _fontColor = color; // Update font color
//                         });
//                       },
//                       child: Container(
//                         margin: EdgeInsets.symmetric(horizontal: 4),
//                         width: 40,
//                         height: 40,
//                         decoration: BoxDecoration(
//                           color: color,
//                           shape: BoxShape.circle,
//                           border: Border.all(
//                             color: Colors.black,
//                             width: _fontColor == color ? 3 : 1,
//                           ),
//                         ),
//                       ),
//                     );
//                   }).toList(),
//                 ),
//               ),
//               SizedBox(height: size.height * 0.02),
//
//               // Background image selection
//               Text('Select Background Image:'),
//               SizedBox(height: 10),
//               SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: Row(
//                   children: img.map((image) {
//                     return GestureDetector(
//                       onTap: () {
//                         setState(() {
//                           _selectedImage = image; // Update background image
//                         });
//                       },
//                       child: Container(
//                         margin: EdgeInsets.symmetric(horizontal: 4),
//                         width: 60,
//                         height: 60,
//                         decoration: BoxDecoration(
//                           image: DecorationImage(
//                             image: image.startsWith('assets')
//                                 ? AssetImage(image)
//                                 : NetworkImage(image) as ImageProvider,
//                             fit: BoxFit.cover,
//                           ),
//                           shape: BoxShape.rectangle,
//                           border: Border.all(
//                             color: Colors.black,
//                             width: _selectedImage == image ? 3 : 1,
//                           ),
//                         ),
//                       ),
//                     );
//                   }).toList(),
//                 ),
//               ),
//               SizedBox(height: size.height * 0.02),
//
//               // Opacity slider for background color
//               Text('Adjust Background Opacity:'),
//               Slider(
//                 value: _bgOpacity,
//                 // min: 0.0,
//                 // max: 1.0,
//                 divisions: 10,
//                 label: (_bgOpacity * 100).toStringAsFixed(0) + '%',
//                 onChanged: (double value) {
//                   setState(() {
//                     _bgOpacity = value; // Update opacity
//                   });
//                 },
//               ),
//               // Font size slider
//               Text('Adjust Font Size:'),
//               Slider(
//                 value: _fontSize,
//                 min: 10.0,
//                 max: 50.0,
//                 divisions: 8,
//                 label: _fontSize.toStringAsFixed(0),
//                 onChanged: (double value) {
//                   setState(() {
//                     _fontSize = value; // Update font size
//                   });
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
class _QuotePageState extends State<QuotePage> {
  List<String> fontFamilies = [
    'Roboto',
    'Arial',
    'Courier',
    'Times New Roman',
    'Oswald',
    'Helvetica Neue',
    'Lobster',
    'Poppins',
    'Playfair',
    'Raleway',
  ];
  List<Color> colors = [
    Colors.white,
    Colors.black,
    ...Colors.primaries,
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
    'assets/images/11.jpeg',
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
  TextAlign _textAlign = TextAlign.center; // Text alignment
  double _bgOpacity = 1;
  double _quoteOpacity = 1.0; // Opacity for the quote text

  // Variables for transformations
  Offset _offset = Offset.zero; // Position of the text
  double _scale = 1.0; // Scale of the text (resize)
  double _rotation = 0.0; // Rotation of the text

  // Gesture tracking
  Offset _initialFocalPoint = Offset.zero;
  Offset _initialOffset = Offset.zero;
  double _initialScale = 1.0;
  double _initialRotation = 0.0;

  List<IconData> iconsList = [
    Icons.format_align_center, // Alignment
    Icons.color_lens, // Font color
    Icons.text_fields_sharp, // Font family
    Icons.image, // Background image
    Icons.opacity, // Background opacity
  ];

  List<QuoteFeature> featuresList = [
    QuoteFeature.alignment,
    QuoteFeature.fontColor,
    QuoteFeature.fontFamily,
    QuoteFeature.backgroundImage,
    QuoteFeature.backgroundOpacity,
  ];
  QuoteFeature? _selectedFeature;

  bool forAlignment = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    QuoteModel quote = ModalRoute.of(context)!.settings.arguments as QuoteModel;
    // TextEditingController _controller = TextEditingController();
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
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Display the editable quote with image background
                  GestureDetector(
                    onScaleStart: (ScaleStartDetails details) {
                      _initialFocalPoint = details.focalPoint;
                      _initialOffset = _offset; // Fix assignment here
                      _initialScale = _scale;
                      _initialRotation = _rotation;
                    },
                    onScaleUpdate: (ScaleUpdateDetails details) {
                      setState(() {
                        // Update position, scale, and rotation
                        _offset = _initialOffset +
                            (details.focalPoint - _initialFocalPoint);
                        _scale = _initialScale * details.scale;
                        _rotation = _initialRotation + details.rotation;
                      });
                    },
                    child: Stack(
                      children: [
                        // Background container with image or color
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
                                    image: AssetImage(_selectedImage!)
                                        as ImageProvider,
                                    fit: BoxFit.cover,
                                  )
                                : null,
                          ),
                        ),
                        Positioned.fill(
                          child: Transform.translate(
                            offset: _offset,
                            child: Transform.rotate(
                              angle: _rotation,
                              child: Transform.scale(
                                scale: _scale,
                                child: Opacity(
                                  opacity:
                                      _quoteOpacity, // Allow text opacity adjustment
                                  child: Text(
                                    quote.quote,
                                    style: TextStyle(
                                      fontSize: _fontSize,
                                      fontFamily: _fontFamily,
                                      color: _fontColor,
                                    ),
                                    textAlign: _textAlign,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: size.height * 0.01),
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        // Text alignment options
                        if (_selectedFeature == QuoteFeature.alignment)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              IconButton(
                                icon: Icon(Icons.format_align_left),
                                onPressed: () {
                                  setState(() {
                                    _textAlign = TextAlign.left;
                                  });
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.format_align_center),
                                onPressed: () {
                                  setState(() {
                                    _textAlign = TextAlign.center;
                                  });
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.format_align_right),
                                onPressed: () {
                                  setState(() {
                                    _textAlign = TextAlign.right;
                                  });
                                },
                              ),
                            ],
                          ),

                        SizedBox(height: size.height * 0.01),

                        // Font family selection
                        Text('Select Font Family:'),
                        SizedBox(height: 10),
                        if (_selectedFeature == QuoteFeature.fontFamily)
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: fontFamilies.map((font) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _fontFamily = font;
                                    });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    child: Text(
                                      font,
                                      style: TextStyle(
                                        fontFamily: font,
                                        fontSize: 20,
                                        color: _fontFamily == font
                                            ? Colors.blue
                                            : Colors.black,
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
                        if (_selectedFeature == QuoteFeature.fontColor)
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
                        if (_selectedFeature == QuoteFeature.backgroundImage)
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: img.map((image) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _selectedImage =
                                          image; // Update background image
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
                                            : NetworkImage(image)
                                                as ImageProvider,
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
                        if (_selectedFeature == QuoteFeature.backgroundOpacity)
                          Slider(
                            value: _bgOpacity,
                            onChanged: (value) {
                              setState(() {
                                _bgOpacity = value;
                              });
                            },
                            min: 0.0,
                            max: 1.0,
                            divisions: 10,
                          ),

                        // Opacity slider for quote text
                        Text('Adjust Quote Text Opacity:'),
                        Slider(
                          value: _quoteOpacity,
                          onChanged: (value) {
                            setState(() {
                              _quoteOpacity = value;
                            });
                          },
                          min: 0.0,
                          max: 1.0,
                          divisions: 10,
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
                  SizedBox(
                    height: size.height * 0.1,
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            height: size.height * 0.09,
            color: Colors.black,
            child: ListView.separated(
              itemCount: iconsList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, i) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      _selectedFeature = featuresList[i];
                    });
                  },
                  child: Icon(
                    iconsList[i],
                    color: Colors.white,
                  ),
                );
              },
              separatorBuilder: (context, index) => SizedBox(
                width: size.width * 0.08,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
