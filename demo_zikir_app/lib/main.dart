import 'package:flutter/material.dart';
import 'dart:ui';
import 'settings/theme/themes.dart';
import 'settings/settings.dart';
import 'settings/application_settings.dart';
import 'settings/graphic_settings.dart';

void main() {
  runApp(ZikirApp());
}

class ZikirApp extends StatefulWidget {
  @override
  _ZikirAppState createState() => _ZikirAppState();
}

class _ZikirAppState extends State<ZikirApp> {
  final ThemeNotifier themeNotifier = ThemeNotifier();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: themeNotifier,
      builder: (context, child) {
        return MaterialApp(
          title: 'Zikir Counter',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            fontFamily: 'Roboto',
          ),
          home: ZikirCounter(themeNotifier: themeNotifier),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}

class ZikirCounter extends StatefulWidget {
  final ThemeNotifier themeNotifier;
  
  const ZikirCounter({Key? key, required this.themeNotifier}) : super(key: key);

  @override
  _ZikirCounterState createState() => _ZikirCounterState();
}

class _ZikirCounterState extends State<ZikirCounter>
    with TickerProviderStateMixin {
  int _counter = 0;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(milliseconds: 150),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.95,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
    _animationController.forward().then((_) {
      _animationController.reverse();
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }
  
  // Application settings state
  bool _vibrationEnabled = true;
  bool _soundEnabled = true;
  bool _confirmReset = true;
  bool _autoSaveCount = true;
  int _targetCount = 33;

  @override
  Widget build(BuildContext context) {
    final currentTheme = widget.themeNotifier.currentTheme;
    
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: currentTheme.gradientColors,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Header
              Padding(
                padding: EdgeInsets.all(20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.3),
                          width: 1,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Zikir Counter',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: currentTheme.primaryTextColor,
                            ),
                          ),
                          Row(
                            children: [
                              // Application Settings
                              GestureDetector(
                                onTap: () {
                                  showApplicationSettings(
                                    context: context,
                                    themeNotifier: widget.themeNotifier,
                                    vibrationEnabled: _vibrationEnabled,
                                    soundEnabled: _soundEnabled,
                                    confirmReset: _confirmReset,
                                    autoSaveCount: _autoSaveCount,
                                    targetCount: _targetCount,
                                    onVibrationChanged: (value) {
                                      setState(() {
                                        _vibrationEnabled = value;
                                      });
                                    },
                                    onSoundChanged: (value) {
                                      setState(() {
                                        _soundEnabled = value;
                                      });
                                    },
                                    onConfirmResetChanged: (value) {
                                      setState(() {
                                        _confirmReset = value;
                                      });
                                    },
                                    onAutoSaveChanged: (value) {
                                      setState(() {
                                        _autoSaveCount = value;
                                      });
                                    },
                                    onTargetCountChanged: (value) {
                                      setState(() {
                                        _targetCount = value;
                                      });
                                    },
                                  );
                                },
                                child: Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Icon(
                                    Icons.tune,
                                    color: currentTheme.primaryTextColor,
                                    size: 20,
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              // Graphic Settings (Theme Selection)
                              GestureDetector(
                                onTap: () {
                                  showGraphicSettings(
                                    context: context,
                                    themeNotifier: widget.themeNotifier,
                                  );
                                },
                                child: Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Icon(
                                    Icons.palette,
                                    color: currentTheme.primaryTextColor,
                                    size: 20,
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              GestureDetector(
                                onTap: _resetCounter,
                                child: Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Icon(
                                    Icons.refresh,
                                    color: currentTheme.primaryTextColor,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              
              // Arabic Text
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.3),
                          width: 1,
                        ),
                      ),
                      child: Text(
                        'سُبْحَانَ اللَّهِ وَبِحَمْدِهِ',
                        style: TextStyle(
                          fontSize: 24,
                          color: currentTheme.primaryTextColor,
                          fontWeight: FontWeight.w600,
                          height: 1.5,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
              
              Spacer(),
              
              // Counter Display (Middle)
              ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 30, horizontal: 50),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.25),
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.4),
                        width: 2,
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Count',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white.withOpacity(0.9),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          '$_counter',
                          style: TextStyle(
                            fontSize: 64,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              
              Spacer(),
              
              // Tap Button (Bottom for easy reach)
              Padding(
                padding: EdgeInsets.only(bottom: 40),
                child: AnimatedBuilder(
                  animation: _scaleAnimation,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: _scaleAnimation.value,
                      child: GestureDetector(
                        onTap: _incrementCounter,
                        child: Container(
                          width: 180,
                          height: 180,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                blurRadius: 20,
                                offset: Offset(0, 10),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(90),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.3),
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.white.withOpacity(0.5),
                                    width: 3,
                                  ),
                                ),
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.touch_app,
                                        size: 45,
                                        color: currentTheme.primaryTextColor,
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        'TAP',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: currentTheme.primaryTextColor,
                                          letterSpacing: 2,
                                        ),
                                      ),
                                    ],
                                  ),
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
    );
  }
}

// SettingsPage class removed - no longer needed as we now use popup overlays