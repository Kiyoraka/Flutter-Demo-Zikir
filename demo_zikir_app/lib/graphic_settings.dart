import 'package:flutter/material.dart';
import 'dart:ui';
import 'themes.dart';

class GraphicSettings extends StatelessWidget {
  final ThemeNotifier themeNotifier;

  const GraphicSettings({
    Key? key,
    required this.themeNotifier,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.all(20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.6,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.15),
              borderRadius: BorderRadius.circular(25),
              border: Border.all(
                color: Colors.white.withOpacity(0.3),
                width: 1,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Choose Theme',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    itemCount: AppThemes.allThemes.length,
                    itemBuilder: (context, index) {
                      final theme = AppThemes.allThemes[index];
                      final isSelected = 
                          themeNotifier.currentTheme.name == theme.name;
                      
                      return Padding(
                        padding: EdgeInsets.only(bottom: 15),
                        child: GestureDetector(
                          onTap: () {
                            themeNotifier.setTheme(theme);
                            Navigator.pop(context);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: isSelected
                                  ? Border.all(
                                      color: Colors.white,
                                      width: 2,
                                    )
                                  : null,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: BackdropFilter(
                                filter: ImageFilter.blur(
                                  sigmaX: 8,
                                  sigmaY: 8,
                                ),
                                child: Container(
                                  padding: EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                    color: isSelected
                                        ? Colors.white.withOpacity(0.3)
                                        : Colors.white.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Row(
                                    children: [
                                      // Theme Preview
                                      Container(
                                        width: 50,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          borderRadius: 
                                              BorderRadius.circular(12),
                                          gradient: LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            colors: theme.gradientColors,
                                          ),
                                          border: Border.all(
                                            color: Colors.white
                                                .withOpacity(0.3),
                                            width: 1,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 15),
                                      // Theme Name
                                      Expanded(
                                        child: Text(
                                          theme.name,
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: isSelected
                                                ? FontWeight.bold
                                                : FontWeight.w500,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      // Selection Indicator
                                      if (isSelected)
                                        Icon(
                                          Icons.check_circle,
                                          color: Colors.white,
                                          size: 24,
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Helper function to show the graphic settings overlay
void showGraphicSettings({
  required BuildContext context,
  required ThemeNotifier themeNotifier,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return GraphicSettings(
        themeNotifier: themeNotifier,
      );
    },
  );
}