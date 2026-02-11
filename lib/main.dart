import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// Entry point of the application
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Define the main theme and home widget of the app
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Helvetica Neue'),
      home: const MyBusinessCardApp(),
    );
  }
}

class MyBusinessCardApp extends StatelessWidget {
  const MyBusinessCardApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold provides the basic structure for the app
    return const Scaffold(
      body: SafeArea(child: MyBusinessCard()),
      backgroundColor: Colors.transparent,
    );
  }
}

class MyBusinessCard extends StatefulWidget {
  const MyBusinessCard({super.key});

  @override
  State<MyBusinessCard> createState() => _MyBusinessCardState();
}

class _MyBusinessCardState extends State<MyBusinessCard>
    with SingleTickerProviderStateMixin {
  // Animation controller for background gradient animation
  late final AnimationController _controller;
  // Scroll controller for the scrollable content
  late final ScrollController _scrollController;

  // List of gradient color pairs for the background
  final List<List<Color>> gradients = [
    [Color(0xFFff9a9e), Color(0xFFfad0c4)],
    [Color(0xFFa18cd1), Color(0xFFfbc2eb)],
    [Color(0xFF89f7fe), Color(0xFF66a6ff)],
    [Color(0xFFf6d365), Color(0xFFfda085)],
  ];

  // Index to track the current gradient
  int index = 0;

  // About section text
  final String about =
      "I’m a builder & researcher focused on AI systems, reinforcement learning, multi‑agent dynamics, and full‑stack engineering. My work spans theoretical ML → production deployment. I care about robustness, strategy discovery, and turning research into products people actually use.";

  // List of interests
  final List<String> interests = [
    'Reinforcement Learning',
    'Multi-Agent RL',
    'Game Theory',
    'Robust ML',
    'RAG + Agents',
    'Graph / Topological ML',
    'Vision AI',
    'Full-stack ML apps',
    'Automation',
  ];

  // Portfolio URL
  final Uri portfolioUri = Uri.parse('https://nimajafaricomp.github.io');

  // Function to launch a URL in an external application
  Future<void> _launchUrl(Uri uri) async {
    try {
      if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
        throw 'Could not launch $uri';
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Could not open link')));
      }
    }
  }

  @override
  void initState() {
    super.initState();
    // Initialize scroll controller
    _scrollController = ScrollController();
    // Initialize animation controller
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 6))
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              // Update gradient index and restart animation
              setState(() => index = (index + 1) % gradients.length);
              _controller.forward(from: 0);
            }
          })
          ..forward();
  }

  @override
  void dispose() {
    // Dispose controllers to free resources
    _scrollController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Get the current and next gradient colors
    final colorsBegin = gradients[index];
    final colorsEnd = gradients[(index + 1) % gradients.length];

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final t = _controller.value;
        // Function to interpolate between two colors
        Color lerp(Color a, Color b) => Color.lerp(a, b, t)!;
        final bg = LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            lerp(colorsBegin[0], colorsEnd[0]),
            lerp(colorsBegin[1], colorsEnd[1]),
          ],
        );

        return Container(
          decoration: BoxDecoration(gradient: bg),
          child: Center(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 12,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 900),
                  child: Scrollbar(
                    controller: _scrollController,
                    thumbVisibility: true,
                    thickness: 8,
                    radius: Radius.circular(8),
                    child: SingleChildScrollView(
                      controller: _scrollController,
                      padding: const EdgeInsets.only(right: 16),
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          final isWide = constraints.maxWidth >= 720;

                          // Left column with profile picture and details
                          final leftColumn = Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: LinearGradient(
                                    colors: [
                                      const Color.fromARGB(255, 255, 255, 255).withValues(),
                                      const Color.fromARGB(255, 255, 255, 255).withValues(),
                                    ],
                                  ),
                                ),
                                child: ClipOval(
                                  child: Image.network(
                                    'https://nimajafaricomp.github.io/assets/headshot.png',
                                    width: 120,
                                    height: 120,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return CircleAvatar(
                                        radius: 60,
                                        backgroundColor: Colors.deepPurple.shade300,
                                        child: const Text(
                                          'NJ',
                                          style: TextStyle(
                                            fontSize: 28,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ShaderMask(
                                      blendMode: BlendMode.srcIn,
                                      shaderCallback: (bounds) =>
                                          const LinearGradient(
                                            colors: [
                                              Colors.deepPurple,
                                              Colors.blue,
                                            ],
                                          ).createShader(bounds),
                                      child: Text(
                                        'Nima Jafari',
                                        style: const TextStyle(
                                          fontSize: 34,
                                          fontWeight: FontWeight.w800,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      'New-grad • Full-Stack Developer',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey.shade700,
                                      ),
                                    ),
                                    const SizedBox(height: 6),
                                    Wrap(
                                      spacing: 8,
                                      runSpacing: 6,
                                      children: const [
                                        Chip(label: Text('Python'), backgroundColor: Color(0xFFE6F0FA)),
                                        Chip(label: Text('React'), backgroundColor: Color(0xFFEFF7FF)),
                                        Chip(label: Text('JS'), backgroundColor: Color(0xFFFFF4E6)),
                                        Chip(label: Text('SQL'), backgroundColor: Color(0xFFEFFFEF)),
                                        Chip(label: Text('ML'), backgroundColor: Color(0xFFFFF0F6)),
                                        Chip(label: Text('C#'), backgroundColor: Color(0xFFEFEFFB)),
                                      ],
                                    ),
                                    const SizedBox(height: 12),
                                    const Text(
                                      'Builder & researcher focused on RL, Robust ML, and full‑stack ML apps.',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Row(
                                      children: [
                                        const Icon(Icons.location_on, size: 16, color: Colors.grey),
                                        const SizedBox(width: 6),
                                        Expanded(
                                          child: Text(
                                            'Nordhoff St, Northridge, CA 91325',
                                            style: TextStyle(color: Colors.grey.shade800),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                  ],
                                ),
                              ),
                            ],
                          );

                          // Right column with contact details and links
                          final rightColumn = Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      IconButton(
                                        onPressed: () => _launchUrl(Uri(scheme: 'tel', path: '7475550198')),
                                        icon: const Icon(Icons.phone, color: Colors.blue),
                                        iconSize: 20,
                                        padding: const EdgeInsets.all(6),
                                        constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
                                      ),
                                      const SizedBox(width: 4),
                                      const Text(
                                        '(747) 555-0198',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ],
                                  ),

                                  TextButton.icon(
                                    onPressed: () => _launchUrl(Uri.parse('mailto:nima.mona82@gmail.com')),
                                    icon: const Icon(Icons.email_outlined, size: 18),
                                    label: const Text('nima.mona82@gmail.com'),
                                  ),

                                  TextButton(
                                    onPressed: () => _launchUrl(portfolioUri),
                                    child: Text(
                                      portfolioUri.toString(),
                                      style: const TextStyle(
                                        decoration: TextDecoration.underline,
                                        color: Colors.blue,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          );

                          // Layout based on screen width
                          return isWide
                              ? Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(flex: 4, child: leftColumn),
                                    const SizedBox(width: 24),
                                    Expanded(flex: 6, child: rightColumn),
                                  ],
                                )
                              : Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    leftColumn,
                                    const SizedBox(height: 16),
                                    rightColumn,
                                  ],
                                );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
