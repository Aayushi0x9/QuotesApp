import 'package:quote_app/headers.dart';
import 'package:quote_app/utils/quotes_utils.dart';

Widget Categories({required Size size, required BuildContext context}) {
  return SingleChildScrollView(
    child: Column(
      children: [
        ...allCategories
            .map(
              (e) => GestureDetector(
                onTap: () {
                  // Handle category tap
                },
                child: Container(
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.only(
                      left: 5, top: 2, bottom: 5, right: 5),
                  width: size.width * 0.2, // Adjusted width for better layout
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                      colors: [
                        Color(0xff066782), // Dark Teal
                        Color(0xff39d5ff)
                            .withOpacity(0.3), // Light Blue with opacity
                      ],
                    ),
                  ),
                  child: Text(
                    e,
                    style: TextStyle(
                      color: Colors.white, // Text color for contrast
                      fontWeight: FontWeight.bold, // Make text bold
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      ],
    ),
  );
}
