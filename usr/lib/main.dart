import "package:flutter/material.dart";

void main() {
  runApp(const MusicPlayerApp());
}

class MusicPlayerApp extends StatelessWidget {
  const MusicPlayerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Music Player",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF5F5F5),
        fontFamily: "Poppins",
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: Color(0xFF333333)),
        ),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xFF4169E1), // Royal Blue
          secondary: const Color(0xFF333333), // Charcoal Gray
        ),
      ),
      home: const MusicPlayerScreen(),
    );
  }
}

class MusicPlayerScreen extends StatefulWidget {
  const MusicPlayerScreen({super.key});

  @override
  State<MusicPlayerScreen> createState() => _MusicPlayerScreenState();
}

class _MusicPlayerScreenState extends State<MusicPlayerScreen> {
  double _sliderValue = 0.3;
  bool _isPlaying = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {},
        ),
        title: const Text(
          "NOW PLAYING",
          style: TextStyle(
            color: Color(0xFF333333),
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            // Album Art
            Container(
              width: MediaQuery.of(context).size.width * 0.7,
              height: MediaQuery.of(context).size.width * 0.7,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 5,
                    blurRadius: 15,
                    offset: const Offset(0, 10),
                  ),
                ],
                image: const DecorationImage(
                  image: NetworkImage("https://picsum.photos/500"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 40),

            // Song Title and Artist
            const Text(
              "Lost in the Echo",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF333333),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            const Text(
              "Linkin Park",
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF666666),
              ),
              textAlign: TextAlign.center,
            ),
            const Spacer(),

            // Progress Bar
            Column(
              children: [
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    trackHeight: 6,
                    thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8),
                    overlayShape: const RoundSliderOverlayShape(overlayRadius: 16),
                    activeTrackColor: const Color(0xFF4169E1),
                    inactiveTrackColor: Colors.grey.shade300,
                    thumbColor: const Color(0xFF4169E1),
                    overlayColor: const Color(0xFF4169E1).withOpacity(0.2),
                  ),
                  child: Slider(
                    value: _sliderValue,
                    onChanged: (value) {
                      setState(() {
                        _sliderValue = value;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 8),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "1:02",
                        style: TextStyle(color: Color(0xFF666666)),
                      ),
                      Text(
                        "3:25",
                        style: TextStyle(color: Color(0xFF666666)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Playback Controls
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: const Icon(Icons.shuffle, color: Color(0xFF666666)),
                  onPressed: () {},
                  iconSize: 28,
                ),
                IconButton(
                  icon: const Icon(Icons.skip_previous, color: Color(0xFF333333)),
                  onPressed: () {},
                  iconSize: 36,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF4169E1),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF4169E1).withOpacity(0.4),
                        spreadRadius: 2,
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: IconButton(
                    icon: Icon(
                      _isPlaying ? Icons.pause : Icons.play_arrow,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPlaying = !_isPlaying;
                      });
                    },
                    iconSize: 48,
                    padding: const EdgeInsets.all(16),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.skip_next, color: Color(0xFF333333)),
                  onPressed: () {},
                  iconSize: 36,
                ),
                IconButton(
                  icon: const Icon(Icons.repeat, color: Color(0xFF666666)),
                  onPressed: () {},
                  iconSize: 28,
                ),
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
