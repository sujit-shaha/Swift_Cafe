import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final String title;
  final String imagePath;
  final String rating;
  final String description;
  final String numberOfRatingsGiven;
  final cupFillingOptions = const ['Full', '1/2 Full', '3/4 Full', '1/4 Full'];
  final milkOptions = const ['Skim Milk', 'Full Cream Milk', 'Almond Milk', 'Soy Milk', 'Lactose Free Milk', 'Oat Milk'];
  final sugarOptions = const ['Sugar X1', 'Sugar X2', '½ Sugar', 'No Sugar'];

  DetailPage({
    required this.title,
    required this.imagePath,
    required this.rating,
    required this.description,
    required this.numberOfRatingsGiven
  });

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  Set<String> selectedCupFilling = {};
  Set<String> selectedMilkChoice = {};
  Set<String> selectedSugarChoice = {};
  bool highPriority = false;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Image.asset(
            'assets/background.png',
            fit: BoxFit.cover,
            height: screenSize.height,
            width: screenSize.width,
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(screenSize.width * 0.03),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.4)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Coffee Image
                      ClipRRect(
                        borderRadius: BorderRadius.circular(screenSize.width * 0.05),
                        child: Image.asset(
                          widget.imagePath,
                          height: screenSize.height * 0.5,
                          width: screenSize.width,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: screenSize.height * 0.02),
                      // Coffee Title and Rating
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.title,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24 * textScaleFactor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(Icons.favorite_border, color: Colors.white, size: 24 * textScaleFactor),
                              SizedBox(width: screenSize.width * 0.02),
                              Icon(Icons.share, color: Colors.white, size: 24 * textScaleFactor),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: screenSize.height * 0.01),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.yellow, size: 20 * textScaleFactor),
                          SizedBox(width: screenSize.width * 0.01),
                          Text(widget.rating, style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold, fontSize: 16 * textScaleFactor)),
                          SizedBox(width: screenSize.width * 0.01),
                          Text(widget.numberOfRatingsGiven, style: TextStyle(color: Colors.grey, fontSize: 14 * textScaleFactor)),
                          SizedBox(width: screenSize.width * 0.02),
                          Image.asset('assets/veg.png'),
                        ],
                      ),
                      SizedBox(height: screenSize.height * 0.02),
                      Text(
                        widget.description,
                        style: TextStyle(color: Colors.white70, fontSize: 14 * textScaleFactor),
                      ),
                      SizedBox(height: screenSize.height * 0.03),
                      // Customization Options
                      buildCustomizationSection('Choice of Cup Filling', widget.cupFillingOptions, selectedCupFilling, (selected) {
                        setState(() => selectedCupFilling = selected);
                      }),
                      buildCustomizationSection('Choice of Milk', widget.milkOptions, selectedMilkChoice, (selected) {
                        setState(() => selectedMilkChoice = selected);
                      }),
                      buildCustomizationSection('Choice of Sugar', widget.sugarOptions, selectedSugarChoice, (selected) {
                        setState(() => selectedSugarChoice = selected);
                      }),
                      SizedBox(height: screenSize.height * 0.02),
                      // High Priority Checkbox
                      Row(
                        children: [
                          SizedBox(
                            height: 24 * textScaleFactor,
                            width: 24 * textScaleFactor,
                            child: Checkbox(
                              value: highPriority,
                              onChanged: (value) {
                                setState(() => highPriority = value!);
                              },
                              fillColor: MaterialStateProperty.resolveWith((states) => Colors.red),
                            ),
                          ),
                          SizedBox(width: screenSize.width * 0.02),
                          Text('High Priority', style: TextStyle(color: Colors.white, fontSize: 16 * textScaleFactor)),
                        ],
                      ),
                      SizedBox(height: screenSize.height * 0.03),
                      // Submit Button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            // Handle submission
                          },
                          child: Text('Submit', style: TextStyle(fontSize: 18 * textScaleFactor)),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            padding: EdgeInsets.symmetric(vertical: screenSize.height * 0.02),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }


  Widget buildCustomizationSection(String title, List<String> options, Set<String> selectedOptions, Function(Set<String>) onSelected) {
    final screenSize = MediaQuery.of(context).size;
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16 * textScaleFactor)),
        SizedBox(height: screenSize.height * 0.01),
        Wrap(
          spacing: screenSize.width * 0.02,
          runSpacing: screenSize.height * 0.01,
          children: options.map((option) {
            final isSelected = selectedOptions.contains(option);
            return ChoiceChip(
              label: Text(option, style: TextStyle(fontSize: 14 * textScaleFactor, color: Colors.white)),
              selected: isSelected,
              onSelected: (selected) {
                setState(() {
                  if (selected) {
                    selectedOptions.add(option);
                  } else {
                    selectedOptions.remove(option);
                  }
                  onSelected(selectedOptions);
                });
              },
              backgroundColor: Colors.grey[800],
              selectedColor: Colors.green,
            );
          }).toList(),
        ),
        SizedBox(height: screenSize.height * 0.02),
      ],
    );
  }
}

