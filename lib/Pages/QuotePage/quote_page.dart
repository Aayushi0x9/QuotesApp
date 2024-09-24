import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quote_app/Models/quotes_model.dart';
import 'package:quote_app/utils/Globals/globals.dart';
import 'package:share_extend/share_extend.dart';

import 'Component/bg_colors.dart';
import 'Component/heading.dart';

enum QuoteFeature {
  backgroundImage,
  alignment,
  backgroundColor,
  fontFamily,
  backgroundOpacity,
}

class QuotePage extends StatefulWidget {
  const QuotePage({super.key});

  @override
  State<QuotePage> createState() => _QuotePageState();
}

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
  List<QuoteFeature> featuresList = [
    QuoteFeature.backgroundImage,
    QuoteFeature.alignment,
    QuoteFeature.backgroundColor,
    QuoteFeature.fontFamily,
    QuoteFeature.backgroundOpacity,
  ];
  List<IconData> iconsList = [
    Icons.image,
    Icons.format_align_center,
    Icons.color_lens,
    Icons.text_fields_sharp,
    Icons.opacity,
  ];
  List<Color> colors = [
    Colors.white,
    Colors.black,
    ...Colors.primaries,
  ];

  int? _selectedFeatureIndex;
  QuoteFeature? _selectedFeature;
  String _quoteText = '';
  String? selectedImage;
  double _fontSize = 16.0;
  String _fontFamily = 'Roboto';
  Color _bgColor = Colors.yellow; // Default background color
  Color _fontColor = Colors.black;
  TextAlign _textAlign = TextAlign.center; // Text alignment
  double _bgOpacity = 1;
  double _quoteOpacity = 1.0;

  bool fontOpacity = false;
  bool fontdamily = false;
  bool fontColor = false;
  bool text = true;
  // Variables for transformations
  Offset _offset = Offset.zero; // Position of the text
  double _scale = 1.0; // Scale of the text (resize)
  double _rotation = 0.0; // Rotation of the text

  // Gesture tracking
  Offset _initialFocalPoint = Offset.zero;
  Offset _initialOffset = Offset.zero;
  double _initialScale = 1.0;
  double _initialRotation = 0.0;
  void getsetState() {
    setState(() {});
  }

  GlobalKey widgetKey = GlobalKey();

  Future<File> getFileFromWidget() async {
    RenderRepaintBoundary boundary =
        widgetKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage(
      pixelRatio: 2,
    );
    ByteData? data = await image.toByteData(
      format: ui.ImageByteFormat.png,
    );
    Uint8List list = data!.buffer.asUint8List();

    Directory directory = await getTemporaryDirectory();
    File file = await File(
            "${directory.path}/QA${DateTime.now().millisecondsSinceEpoch}.png")
        .create();
    file.writeAsBytesSync(list);

    return file;
  }

  Future<void> shareWidget() async {
    try {
      RenderRepaintBoundary boundary =
          widgetKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
      var image = await boundary.toImage(pixelRatio: 3.0);
      ByteData? byteData = await image.toByteData(format: ImageByteFormat.png);
      if (byteData != null) {
        final Uint8List pngBytes = byteData.buffer.asUint8List();
        final directory = (await getTemporaryDirectory()).path;
        final file = File('$directory/widget.png');
        await file.writeAsBytes(pngBytes);

        // Share the file
        ShareExtend.share(file.path, 'image').then(
          (value) => ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Shared successfully'),
            ),
          ),
        );
      }
    } catch (e) {
      print(e);
    }
  }

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
            icon: const Icon(Icons.arrow_back_ios)),
        title: const Text(
          "👀 Can Edit 👀",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        titleSpacing: 1,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () async {
              ImageGallerySaver.saveFile((await getFileFromWidget()).path).then(
                (value) => ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    backgroundColor: Colors.green,
                    duration: Duration(seconds: 1),
                    content: Text('Image Save in Gallery'),
                  ),
                ),
              );
            },
            icon: const Icon(
              Icons.save,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () async {
              await shareWidget();
            },
            icon: const Icon(
              Icons.share,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
        ],
      ),
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        // alignment: Alignment.bottomCenter,
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
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          height: size.height * 0.4,
                          padding: const EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            color: selectedImage == null
                                ? _bgColor.withOpacity(_bgOpacity)
                                : null,
                            image: selectedImage != null
                                ? DecorationImage(
                                    image: AssetImage(selectedImage!)
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
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      // alignment: Alignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (_selectedFeature == QuoteFeature.alignment)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(height: size.height * 0.05),
                              heading(heading: 'Font Alignment'),
                              SizedBox(height: size.height * 0.05),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  IconButton(
                                    icon: Icon(
                                      Icons.format_align_left,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      _textAlign = TextAlign.left;
                                      getsetState();
                                    },
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      Icons.format_align_center,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      _textAlign = TextAlign.center;
                                      getsetState();
                                    },
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      Icons.format_align_right,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      _textAlign = TextAlign.right;
                                      getsetState();
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),

                        if (_selectedFeature == QuoteFeature.backgroundColor)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: size.height * 0.05),
                              heading(heading: 'BackGround Colour'),
                              SizedBox(height: size.height * 0.05),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: Globals.colors.map((color) {
                                    return GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selectedImage = null;
                                          _bgColor = color;
                                        });
                                        // Update background color
                                      },
                                      child: Container(
                                        margin:
                                            EdgeInsets.symmetric(horizontal: 4),
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          color: color,
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: Colors.white,
                                            width: bgColor == color ? 3 : 1,
                                          ),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              )
                            ],
                          ),

                        ////FontFamily

                        if (_selectedFeature == QuoteFeature.fontFamily)
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        fontColor = false;
                                        fontdamily = false;
                                        fontOpacity = false;
                                        text = !text; // Toggle the text state
                                      });
                                    },
                                    icon: Icon(
                                      Icons.text_snippet,
                                      color:
                                          text ? Colors.white : Colors.white70,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        text = false;
                                        fontOpacity = false;
                                        fontColor = false;
                                        fontdamily =
                                            !fontdamily; // Toggle the fontdamily state
                                      });
                                    },
                                    icon: Icon(
                                      Icons.font_download_rounded,
                                      color: fontdamily
                                          ? Colors.white
                                          : Colors.white70,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        text = false;
                                        fontdamily = false;
                                        fontColor = !fontColor;
                                        fontOpacity =
                                            false; // Toggle the fontColor state
                                      });
                                    },
                                    icon: Icon(
                                      Icons.format_color_fill,
                                      color: fontColor
                                          ? Colors.white
                                          : Colors.white70,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        text = false;
                                        fontdamily = false;
                                        fontColor = false;
                                        fontOpacity =
                                            !fontOpacity; // Toggle the fontColor state
                                      });
                                    },
                                    icon: Icon(
                                      Icons.opacity,
                                      color: fontColor
                                          ? Colors.white
                                          : Colors.white70,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: size.height * 0.02,
                              ),
                              Visibility(
                                visible: text,
                                child: TextField(
                                  style: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  onChanged: (text) {
                                    setState(() {
                                      _quoteText =
                                          text; // Update the text dynamically
                                    });
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'Enter your text here',
                                    border: OutlineInputBorder(),
                                    // filled: true,
                                    fillColor: Colors.white,
                                    filled: true,
                                  ),
                                ),
                              ),
                              Visibility(
                                visible: fontdamily,
                                child: SizedBox(
                                  height: size.height *
                                      0.2, // Set a fixed height for the ListView
                                  child: ListView.separated(
                                    shrinkWrap:
                                        true, // Ensures ListView does not take infinite height
                                    itemBuilder: (context, index) {
                                      final font = fontFamilies[index];
                                      return GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            _fontFamily = font
                                                as String; // Make sure 'font' is a String
                                          });
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8),
                                          child: Text(
                                            font.toString(), // Convert to String to avoid casting issues
                                            style: TextStyle(
                                              fontFamily: font
                                                  .toString(), // Ensure it's a String here too
                                              fontSize: 20,
                                              color: _fontFamily == font
                                                  ? Colors.blue
                                                  : Colors.white,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                    separatorBuilder: (context, index) =>
                                        const SizedBox(
                                      height: 10,
                                    ),
                                    itemCount: fontFamilies.length,
                                  ),
                                ),
                              ),
                              Visibility(
                                  visible: fontColor,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: size.height * 0.05,
                                      ),
                                      heading(heading: 'Font Color'),
                                      SizedBox(
                                        height: size.height * 0.05,
                                      ),
                                      SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          children: Globals.colors.map((color) {
                                            return GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  _fontColor = color;
                                                });
                                              },
                                              child: Container(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 4),
                                                width: 40,
                                                height: 40,
                                                decoration: BoxDecoration(
                                                  color: color,
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                    color: Colors.white,
                                                    width: fontColor == color
                                                        ? 3
                                                        : 1,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    ],
                                  )),
                            ],
                          ),

                        ////FontColor
                        //                         if (_selectedFeature == QuoteFeature.backgroundColor)

                        //// Background image selection
                        if (_selectedFeature == QuoteFeature.backgroundImage)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              heading(heading: 'Background Image'),
                              SizedBox(
                                height: size.height * 0.02,
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: Globals.img.map((image) {
                                    return GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selectedImage = image;
                                        });
                                        // Change the image
                                        // Trigger parent rebuild
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 4),
                                        width: size.width * 0.4,
                                        height: size.height * 0.2,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(image),
                                            fit: BoxFit.cover,
                                          ),
                                          shape: BoxShape.rectangle,
                                          border: Border.all(
                                            color: Colors.white,
                                            width: selectedImage == image
                                                ? 3
                                                : 1, // Highlight selected image
                                          ),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ],
                          ),
                        ////bg Opacity
                        if (_selectedFeature == QuoteFeature.backgroundOpacity)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: size.height * 0.05),
                              heading(heading: 'Background Opacity'),
                              SizedBox(height: size.height * 0.05),
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
                            ],
                          ),
                        ////font Opacity
                        // Opacity slider for quote text
                        // Text('Adjust Quote Text Opacity:'),
                        // Slider(
                        //   value: _quoteOpacity,
                        //   onChanged: (value) {
                        //     setState(() {
                        //       _quoteOpacity = value;
                        //     });
                        //   },
                        //   min: 0.0,
                        //   max: 1.0,
                        //   divisions: 10,
                        // ),
                        // // Font size slider
                        // // Text('Adjust Font Size:'),
                        // Slider(
                        //   value: _fontSize,
                        //   min: 10.0,
                        //   max: 50.0,
                        //   divisions: 8,
                        //   label: _fontSize.toStringAsFixed(0),
                        //   onChanged: (double value) {
                        //     setState(() {
                        //       _fontSize = value; // Update font size
                        //     });
                        //   },
                        // ),
                      ],
                    ),
                  ),
                  // SizedBox(
                  //   height: size.height * 0.1,
                  // ),
                ],
              ),
            ),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            height: size.height * 0.09,
            color: Colors.black26,
            child: ListView.separated(
              itemCount: iconsList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, i) {
                return IconButton(
                  onPressed: () {
                    setState(() {
                      // Update _selectedFeature if needed on button press
                      _selectedFeatureIndex = i;
                      _selectedFeature = featuresList[i];
                    });
                  },
                  icon: Icon(iconsList[i]), // Ensure icon uses Icon widget
                  color: (_selectedFeatureIndex == i)
                      ? Colors.white // Active color for the selected icon
                      : Colors
                          .white60, // Ensure featuresList[i] is treated as bool
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
