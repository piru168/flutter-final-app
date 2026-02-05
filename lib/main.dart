import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Minecraft Color Palette
class MinecraftColors {
  static const Color grassGreen = Color(0xFF5D8C3E);
  static const Color darkGreen = Color(0xFF3B5323);
  static const Color dirt = Color(0xFF8B5A2B);
  static const Color darkDirt = Color(0xFF5C3317);
  static const Color stone = Color(0xFF7F7F7F);
  static const Color darkStone = Color(0xFF4A4A4A);
  static const Color cobblestone = Color(0xFF6B6B6B);
  static const Color bedrock = Color(0xFF1A1A1A);
  static const Color coal = Color(0xFF2F2F2F);
  static const Color diamond = Color(0xFF4AEDD9);
  static const Color gold = Color(0xFFFFD700);
  static const Color iron = Color(0xFFD4D4D4);
  static const Color redstone = Color(0xFFFF0000);
  static const Color lava = Color(0xFFFF6600);
  static const Color water = Color(0xFF3366FF);
  static const Color wood = Color(0xFF8B6914);
  static const Color plank = Color(0xFFBC9458);
  static const Color sand = Color(0xFFE5D5A0);
  static const Color creeper = Color(0xFF00AA00);
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: MinecraftColors.dirt,
        colorScheme: ColorScheme.dark(
          primary: MinecraftColors.grassGreen,
          secondary: MinecraftColors.diamond,
          surface: MinecraftColors.darkDirt,
          error: MinecraftColors.redstone,
        ),
        textTheme: GoogleFonts.pressStart2pTextTheme(
          ThemeData.dark().textTheme,
        ),
        appBarTheme: AppBarTheme(
          elevation: 0,
          centerTitle: true,
          backgroundColor: MinecraftColors.darkGreen,
          foregroundColor: Colors.white,
          titleTextStyle: GoogleFonts.pressStart2p(
            fontSize: 14,
            color: Colors.white,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: MinecraftColors.grassGreen,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.zero, // Blocky!
            ),
            textStyle: GoogleFonts.pressStart2p(fontSize: 10),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          ),
        ),
        cardTheme: CardThemeData(
          elevation: 0,
          color: MinecraftColors.darkDirt,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.zero, // Blocky!
            side: BorderSide(color: MinecraftColors.coal, width: 3),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: MinecraftColors.coal,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide(color: MinecraftColors.stone, width: 3),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide(color: MinecraftColors.stone, width: 3),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide(color: MinecraftColors.grassGreen, width: 3),
          ),
          labelStyle: GoogleFonts.pressStart2p(
            fontSize: 10,
            color: MinecraftColors.sand,
          ),
          hintStyle: GoogleFonts.pressStart2p(
            fontSize: 8,
            color: MinecraftColors.stone,
          ),
        ),
        iconTheme: IconThemeData(color: MinecraftColors.sand),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: MinecraftColors.bedrock,
          selectedItemColor: MinecraftColors.grassGreen,
          unselectedItemColor: MinecraftColors.stone,
          selectedLabelStyle: GoogleFonts.pressStart2p(fontSize: 8),
          unselectedLabelStyle: GoogleFonts.pressStart2p(fontSize: 8),
        ),
        drawerTheme: DrawerThemeData(backgroundColor: MinecraftColors.darkDirt),
        dialogTheme: DialogThemeData(
          backgroundColor: MinecraftColors.darkDirt,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
            side: BorderSide(color: MinecraftColors.stone, width: 4),
          ),
        ),
      ),
      home: SplashScreen(),
    );
  }
}

// ==================== SPLASH SCREEN ====================
class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: Duration(milliseconds: 1500),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    _controller.forward();

    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => LoginPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
          transitionDuration: Duration(milliseconds: 500),
        ),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: MinecraftColors.bedrock),
        child: Center(
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Minecraft-style block container
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    color: MinecraftColors.grassGreen,
                    border: Border.all(
                      color: MinecraftColors.darkGreen,
                      width: 4,
                    ),
                  ),
                  child: Stack(
                    children: [
                      // Dirt bottom
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        height: 100,
                        child: Container(color: MinecraftColors.dirt),
                      ),
                      // Network image
                      Center(
                        child: Image.network(
                          'https://picsum.photos/100/100',
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return SizedBox(
                              width: 80,
                              height: 80,
                              child: Center(
                                child: CircularProgressIndicator(
                                  color: MinecraftColors.diamond,
                                  strokeWidth: 4,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40),
                // App Name
                Text(
                  'MINECRAFT',
                  style: GoogleFonts.pressStart2p(
                    fontSize: 24,
                    color: MinecraftColors.sand,
                    shadows: [
                      Shadow(
                        color: MinecraftColors.darkGreen,
                        offset: Offset(3, 3),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'STYLE APP',
                  style: GoogleFonts.pressStart2p(
                    fontSize: 16,
                    color: MinecraftColors.grassGreen,
                  ),
                ),
                SizedBox(height: 60),
                // Loading bar (Minecraft style)
                Container(
                  width: 200,
                  height: 20,
                  decoration: BoxDecoration(
                    color: MinecraftColors.coal,
                    border: Border.all(color: MinecraftColors.stone, width: 3),
                  ),
                  child: _MinecraftLoadingBar(),
                ),
                SizedBox(height: 16),
                Text(
                  'LOADING...',
                  style: GoogleFonts.pressStart2p(
                    fontSize: 10,
                    color: MinecraftColors.stone,
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

class _MinecraftLoadingBar extends StatefulWidget {
  @override
  State<_MinecraftLoadingBar> createState() => _MinecraftLoadingBarState();
}

class _MinecraftLoadingBarState extends State<_MinecraftLoadingBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 4),
      vsync: this,
    )..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return FractionallySizedBox(
          alignment: Alignment.centerLeft,
          widthFactor: _controller.value,
          child: Container(color: MinecraftColors.grassGreen),
        );
      },
    );
  }
}

// ==================== LOGIN PAGE ====================
class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isLoading = false;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() async {
    setState(() => _isLoading = true);
    await Future.delayed(Duration(seconds: 1));
    setState(() => _isLoading = false);

    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            DashboardPage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
        transitionDuration: Duration(milliseconds: 400),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              MinecraftColors.darkGreen,
              MinecraftColors.dirt,
              MinecraftColors.darkDirt,
            ],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Minecraft Sword/Shield Icon
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: MinecraftColors.stone,
                      border: Border.all(
                        color: MinecraftColors.darkStone,
                        width: 4,
                      ),
                    ),
                    child: Icon(
                      Icons.shield,
                      size: 60,
                      color: MinecraftColors.diamond,
                    ),
                  ),
                  SizedBox(height: 30),
                  Text(
                    'WELCOME BACK',
                    style: GoogleFonts.pressStart2p(
                      fontSize: 14,
                      color: MinecraftColors.sand,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Enter your realm',
                    style: GoogleFonts.pressStart2p(
                      fontSize: 8,
                      color: MinecraftColors.stone,
                    ),
                  ),
                  SizedBox(height: 40),
                  // Login Container
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: MinecraftColors.darkDirt,
                      border: Border.all(color: MinecraftColors.coal, width: 4),
                    ),
                    child: Column(
                      children: [
                        // Username
                        TextField(
                          controller: _usernameController,
                          style: GoogleFonts.pressStart2p(
                            fontSize: 10,
                            color: Colors.white,
                          ),
                          decoration: InputDecoration(
                            labelText: 'USERNAME',
                            prefixIcon: Icon(
                              Icons.person,
                              color: MinecraftColors.grassGreen,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        // Password
                        TextField(
                          controller: _passwordController,
                          obscureText: !_isPasswordVisible,
                          style: GoogleFonts.pressStart2p(
                            fontSize: 10,
                            color: Colors.white,
                          ),
                          decoration: InputDecoration(
                            labelText: 'PASSWORD',
                            prefixIcon: Icon(
                              Icons.lock,
                              color: MinecraftColors.grassGreen,
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isPasswordVisible
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: MinecraftColors.stone,
                              ),
                              onPressed: () {
                                setState(
                                  () =>
                                      _isPasswordVisible = !_isPasswordVisible,
                                );
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        // Login Button
                        SizedBox(
                          width: double.infinity,
                          height: 55,
                          child: ElevatedButton(
                            onPressed: _isLoading ? null : _handleLogin,
                            child: _isLoading
                                ? SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                      strokeWidth: 3,
                                    ),
                                  )
                                : Text('PLAY'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  // Register link
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'NEW PLAYER? REGISTER',
                      style: GoogleFonts.pressStart2p(
                        fontSize: 8,
                        color: MinecraftColors.diamond,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ==================== DASHBOARD PAGE ====================
class DashboardPage extends StatefulWidget {
  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [_HomePage(), _ProfilePage()];

  void _onItemTapped(int index) {
    if (index == 2) {
      _showLogoutDialog();
    } else {
      setState(() => _selectedIndex = index);
    }
  }

  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'LOGOUT?',
          style: GoogleFonts.pressStart2p(
            fontSize: 12,
            color: MinecraftColors.redstone,
          ),
        ),
        content: Text(
          'Leave this world?',
          style: GoogleFonts.pressStart2p(
            fontSize: 10,
            color: MinecraftColors.sand,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'STAY',
              style: GoogleFonts.pressStart2p(
                fontSize: 10,
                color: MinecraftColors.grassGreen,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      LoginPage(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                        return FadeTransition(opacity: animation, child: child);
                      },
                  transitionDuration: Duration(milliseconds: 400),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: MinecraftColors.redstone,
            ),
            child: Text('LEAVE'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_selectedIndex == 0 ? 'HOME' : 'PROFILE'),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: MinecraftColors.gold),
            onPressed: () {},
          ),
        ],
      ),
      drawer: _buildDrawer(),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'HOME'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'PLAYER'),
          BottomNavigationBarItem(
            icon: Icon(Icons.exit_to_app, color: MinecraftColors.redstone),
            label: 'EXIT',
          ),
        ],
      ),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      child: Container(
        color: MinecraftColors.darkDirt,
        child: Column(
          children: [
            // Header
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(top: 50, bottom: 20),
              decoration: BoxDecoration(
                color: MinecraftColors.grassGreen,
                border: Border(
                  bottom: BorderSide(
                    color: MinecraftColors.darkGreen,
                    width: 4,
                  ),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: MinecraftColors.stone,
                      border: Border.all(
                        color: MinecraftColors.darkStone,
                        width: 3,
                      ),
                    ),
                    child: Image.network(
                      'https://picsum.photos/80/80',
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    'STEVE',
                    style: GoogleFonts.pressStart2p(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Level 42',
                    style: GoogleFonts.pressStart2p(
                      fontSize: 10,
                      color: MinecraftColors.gold,
                    ),
                  ),
                ],
              ),
            ),
            // Menu Items
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  _buildDrawerItem(
                    Icons.home,
                    'HOME',
                    () => Navigator.pop(context),
                  ),
                  _buildDrawerItem(
                    Icons.inventory,
                    'INVENTORY',
                    () => Navigator.pop(context),
                  ),
                  _buildDrawerItem(
                    Icons.map,
                    'MAP',
                    () => Navigator.pop(context),
                  ),
                  _buildDrawerItem(
                    Icons.settings,
                    'SETTINGS',
                    () => Navigator.pop(context),
                  ),
                  _buildDrawerItem(
                    Icons.help,
                    'HELP',
                    () => Navigator.pop(context),
                  ),
                  Divider(color: MinecraftColors.stone, thickness: 2),
                  _buildDrawerItem(Icons.exit_to_app, 'QUIT GAME', () {
                    Navigator.pop(context);
                    _showLogoutDialog();
                  }, isLogout: true),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'v1.0.0',
                style: GoogleFonts.pressStart2p(
                  fontSize: 8,
                  color: MinecraftColors.stone,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem(
    IconData icon,
    String title,
    VoidCallback onTap, {
    bool isLogout = false,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        border: Border.all(
          color: isLogout ? MinecraftColors.redstone : MinecraftColors.coal,
          width: 2,
        ),
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: isLogout
              ? MinecraftColors.redstone
              : MinecraftColors.grassGreen,
        ),
        title: Text(
          title,
          style: GoogleFonts.pressStart2p(
            fontSize: 10,
            color: isLogout ? MinecraftColors.redstone : MinecraftColors.sand,
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}

// ==================== HOME PAGE CONTENT ====================
class _HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Welcome Banner
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: MinecraftColors.grassGreen,
              border: Border.all(color: MinecraftColors.darkGreen, width: 4),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'WELCOME BACK',
                  style: GoogleFonts.pressStart2p(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Ready to mine?',
                  style: GoogleFonts.pressStart2p(
                    fontSize: 10,
                    color: MinecraftColors.sand,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          // Stats
          Row(
            children: [
              Expanded(
                child: _buildStatBlock(
                  '128',
                  'DIAMONDS',
                  MinecraftColors.diamond,
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: _buildStatBlock('64', 'GOLD', MinecraftColors.gold),
              ),
              SizedBox(width: 12),
              Expanded(
                child: _buildStatBlock('256', 'IRON', MinecraftColors.iron),
              ),
            ],
          ),
          SizedBox(height: 20),
          // Featured
          Text(
            'FEATURED',
            style: GoogleFonts.pressStart2p(
              fontSize: 12,
              color: MinecraftColors.sand,
            ),
          ),
          SizedBox(height: 12),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: MinecraftColors.coal, width: 4),
            ),
            child: Image.network(
              'https://picsum.photos/400/200',
              width: double.infinity,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 20),
          // Activities
          Text(
            'RECENT',
            style: GoogleFonts.pressStart2p(
              fontSize: 12,
              color: MinecraftColors.sand,
            ),
          ),
          SizedBox(height: 12),
          _buildActivityItem(
            Icons.star,
            MinecraftColors.gold,
            'Achievement!',
            'Mined 1000 blocks',
          ),
          _buildActivityItem(
            Icons.person_add,
            MinecraftColors.diamond,
            'New Friend',
            'Alex joined',
          ),
          _buildActivityItem(
            Icons.dangerous,
            MinecraftColors.redstone,
            'Mob Defeated',
            'Creeper down!',
          ),
        ],
      ),
    );
  }

  Widget _buildStatBlock(String value, String label, Color color) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: MinecraftColors.darkDirt,
        border: Border.all(color: MinecraftColors.coal, width: 3),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: GoogleFonts.pressStart2p(fontSize: 16, color: color),
          ),
          SizedBox(height: 8),
          Text(
            label,
            style: GoogleFonts.pressStart2p(
              fontSize: 6,
              color: MinecraftColors.stone,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActivityItem(
    IconData icon,
    Color color,
    String title,
    String subtitle,
  ) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: MinecraftColors.darkDirt,
        border: Border.all(color: MinecraftColors.coal, width: 2),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              border: Border.all(color: color, width: 2),
            ),
            child: Icon(icon, color: color, size: 20),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.pressStart2p(
                    fontSize: 8,
                    color: MinecraftColors.sand,
                  ),
                ),
                Text(
                  subtitle,
                  style: GoogleFonts.pressStart2p(
                    fontSize: 6,
                    color: MinecraftColors.stone,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ==================== PROFILE PAGE CONTENT ====================
class _ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          SizedBox(height: 20),
          // Avatar Block
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: MinecraftColors.stone,
              border: Border.all(color: MinecraftColors.darkStone, width: 4),
            ),
            child: Image.network(
              'https://picsum.photos/120/120',
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 16),
          Text(
            'STEVE',
            style: GoogleFonts.pressStart2p(
              fontSize: 18,
              color: MinecraftColors.sand,
            ),
          ),
          Text(
            'Master Builder',
            style: GoogleFonts.pressStart2p(
              fontSize: 10,
              color: MinecraftColors.grassGreen,
            ),
          ),
          SizedBox(height: 24),
          // Stats Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildProfileStat('BLOCKS', '9,999'),
              _buildProfileStat('MOBS', '142'),
              _buildProfileStat('DAYS', '365'),
            ],
          ),
          SizedBox(height: 24),
          // Edit Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.edit),
              label: Text('EDIT SKIN'),
              style: ElevatedButton.styleFrom(
                backgroundColor: MinecraftColors.diamond,
              ),
            ),
          ),
          SizedBox(height: 24),
          // Settings
          _buildSettingsTile(Icons.inventory_2, 'INVENTORY'),
          _buildSettingsTile(Icons.emoji_events, 'ACHIEVEMENTS'),
          _buildSettingsTile(Icons.leaderboard, 'LEADERBOARD'),
          _buildSettingsTile(Icons.settings, 'SETTINGS'),
        ],
      ),
    );
  }

  Widget _buildProfileStat(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: GoogleFonts.pressStart2p(
            fontSize: 12,
            color: MinecraftColors.gold,
          ),
        ),
        SizedBox(height: 4),
        Text(
          label,
          style: GoogleFonts.pressStart2p(
            fontSize: 8,
            color: MinecraftColors.stone,
          ),
        ),
      ],
    );
  }

  Widget _buildSettingsTile(IconData icon, String title) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: MinecraftColors.darkDirt,
        border: Border.all(color: MinecraftColors.coal, width: 2),
      ),
      child: ListTile(
        leading: Icon(icon, color: MinecraftColors.grassGreen),
        title: Text(
          title,
          style: GoogleFonts.pressStart2p(
            fontSize: 10,
            color: MinecraftColors.sand,
          ),
        ),
        trailing: Icon(Icons.chevron_right, color: MinecraftColors.stone),
        onTap: () {},
      ),
    );
  }
}
