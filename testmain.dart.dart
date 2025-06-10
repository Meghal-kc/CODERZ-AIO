import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const BaseApp());
}

class BaseApp extends StatelessWidget {
  const BaseApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Base App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
        primaryColor: Colors.black,
        textTheme: TextTheme(
          headline1: GoogleFonts.poppins(
            fontSize: 48,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
          headline6: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.grey.shade800,
          ),
          bodyText1: GoogleFonts.poppins(
            fontSize: 16,
            color: Colors.grey.shade600,
          ),
          bodyText2: GoogleFonts.poppins(
            fontSize: 14,
            color: Colors.grey.shade600,
          ),
          button: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: Colors.black,
            onPrimary: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            textStyle: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
            elevation: 4,
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static const double maxContentWidth = 1200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(64),
        child: _CustomAppBar(),
      ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: maxContentWidth),
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                SizedBox(height: 40),
                HeroSection(),
                SizedBox(height: 60),
                FeaturesSection(),
                SizedBox(height: 60),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      elevation: 2,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Row(
          children: [
            // Logo on the left
            Text(
              'BaseApp',
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            const Spacer(),
            // Navigation items on the right
            _NavButton(label: 'Home', onPressed: () {}),
            _NavButton(label: 'Features', onPressed: () {}),
            _NavButton(label: 'Pricing', onPressed: () {}),
            _NavButton(label: 'Docs', onPressed: () {}),
            const SizedBox(width: 20),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Get Started'),
            ),
          ],
        ),
      ),
    );
  }
}

class _NavButton extends StatefulWidget {
  final String label;
  final VoidCallback onPressed;

  const _NavButton({required this.label, required this.onPressed, Key? key})
      : super(key: key);

  @override
  State<_NavButton> createState() => _NavButtonState();
}

class _NavButtonState extends State<_NavButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final color = _isHovered ? Colors.black : Colors.grey.shade700;

    return MouseRegion(
      onEnter: (_) => setState(() {
        _isHovered = true;
      }),
      onExit: (_) => setState(() {
        _isHovered = false;
      }),
      child: TextButton(
        style: TextButton.styleFrom(
          primary: color,
          textStyle: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        onPressed: widget.onPressed,
        child: Text(widget.label),
      ),
    );
  }
}

class HeroSection extends StatelessWidget {
  const HeroSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final headlineStyle = Theme.of(context).textTheme.headline1!;
    final bodyStyle = Theme.of(context).textTheme.bodyText1!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Build your Component Library',
          style: headlineStyle,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        Text(
          'Create elegant, customizable components with ease and speed. Build interfaces that developers love.',
          style: bodyStyle,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 32),
        ElevatedButton(
          onPressed: () {},
          child: const Text('Get Started'),
        ),
      ],
    );
  }
}

class FeaturesSection extends StatelessWidget {
  const FeaturesSection({Key? key}) : super(key: key);

  static const double cardRadius = 12;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final features = [
      Feature(
        icon: Icons.palette_outlined,
        title: 'Customizable Themes',
        description:
            'Easily create themes that fit your brand with flexible color palettes.',
      ),
      Feature(
        icon: Icons.build_outlined,
        title: 'Reusable Components',
        description: 'Build components that can be reused across your projects.',
      ),
      Feature(
        icon: Icons.speed_outlined,
        title: 'Performance Optimized',
        description: 'Components designed with performance in mind.',
      ),
      Feature(
        icon: Icons.code_outlined,
        title: 'Developer Friendly',
        description: 'Clean API and great documentation to help you get started.',
      ),
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        int crossAxisCount = 1;
        if (constraints.maxWidth > 900) {
          crossAxisCount = 4;
        } else if (constraints.maxWidth > 600) {
          crossAxisCount = 2;
        }

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: features.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            mainAxisExtent: 220,
            crossAxisSpacing: 24,
            mainAxisSpacing: 24,
          ),
          itemBuilder: (context, index) {
            final feature = features[index];
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(cardRadius),
              ),
              elevation: 4,
              shadowColor: Colors.black.withOpacity(0.1),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      feature.icon,
                      size: 36,
                      color: Colors.black87,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      feature.title,
                      style: textTheme.headline6,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      feature.description,
                      style: textTheme.bodyText2,
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class Feature {
  final IconData icon;
  final String title;
  final String description;

  Feature({
    required this.icon,
    required this.title,
    required this.description,
  });
}
