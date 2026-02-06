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
                    ],
                  ),
                ),
                SizedBox(height: 40),
                // App Name
                Text(
                  'PIXEL SHOP',
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
                  'E-COMMERCE',
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
                    'Shop with us',
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
                                : Text('LOGIN'),
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
                      'NEW USER? REGISTER',
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

  final List<Widget> _pages = [_HomePage(), _CartPage(), _ProfilePage()];

  void _onItemTapped(int index) {
    if (index == 3) {
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
          'Exit shop?',
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
        title: Text(
          _selectedIndex == 0
              ? 'SHOP'
              : _selectedIndex == 1
              ? 'CART'
              : 'PROFILE',
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: MinecraftColors.gold),
            onPressed: () {},
          ),
        ],
      ),
      drawer: _buildDrawer(),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.shop), label: 'SHOP'),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'CART',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'PROFILE'),
          BottomNavigationBarItem(
            icon: Icon(Icons.exit_to_app, color: MinecraftColors.redstone),
            label: 'LOGOUT',
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
                      'https://i.pravatar.cc/80',
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    'CUSTOMER',
                    style: GoogleFonts.pressStart2p(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Premium',
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
                  _buildDrawerItem(Icons.shop, 'SHOP', () {
                    Navigator.pop(context);
                    setState(() => _selectedIndex = 0);
                  }),
                  _buildDrawerItem(Icons.shopping_cart, 'CART', () {
                    Navigator.pop(context);
                    setState(() => _selectedIndex = 1);
                  }),
                  _buildDrawerItem(Icons.favorite, 'WISHLIST', () {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Wishlist coming soon!',
                          style: GoogleFonts.pressStart2p(fontSize: 8),
                        ),
                        backgroundColor: MinecraftColors.grassGreen,
                        duration: Duration(seconds: 2),
                      ),
                    );
                  }),
                  _buildDrawerItem(Icons.receipt, 'ORDERS', () {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Orders coming soon!',
                          style: GoogleFonts.pressStart2p(fontSize: 8),
                        ),
                        backgroundColor: MinecraftColors.grassGreen,
                        duration: Duration(seconds: 2),
                      ),
                    );
                  }),
                  _buildDrawerItem(Icons.settings, 'SETTINGS', () {
                    Navigator.pop(context);
                    setState(() => _selectedIndex = 2);
                  }),
                  Divider(color: MinecraftColors.stone, thickness: 2),
                  _buildDrawerItem(Icons.exit_to_app, 'LOGOUT', () {
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

// ==================== PRODUCT MODEL ====================
class Product {
  final String id;
  final String name;
  final double price;
  final String imageUrl;
  final String category;
  final String description;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.category,
    required this.description,
  });
}

// ==================== CART ITEM ====================
class CartItem {
  final Product product;
  int quantity;

  CartItem({required this.product, this.quantity = 1});
}

// ==================== CART SERVICE ====================
class CartService {
  static final CartService _instance = CartService._internal();
  factory CartService() => _instance;
  CartService._internal();

  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  void addToCart(Product product) {
    final existingIndex = _items.indexWhere(
      (item) => item.product.id == product.id,
    );
    if (existingIndex >= 0) {
      _items[existingIndex].quantity++;
    } else {
      _items.add(CartItem(product: product));
    }
  }

  void removeFromCart(String productId) {
    _items.removeWhere((item) => item.product.id == productId);
  }

  void updateQuantity(String productId, int quantity) {
    final index = _items.indexWhere((item) => item.product.id == productId);
    if (index >= 0) {
      if (quantity <= 0) {
        _items.removeAt(index);
      } else {
        _items[index].quantity = quantity;
      }
    }
  }

  double get total {
    return _items.fold(
      0,
      (sum, item) => sum + (item.product.price * item.quantity),
    );
  }

  int get itemCount {
    return _items.fold(0, (sum, item) => sum + item.quantity);
  }

  void clear() {
    _items.clear();
  }
}

// ==================== SAMPLE PRODUCTS ====================
final List<Product> sampleProducts = [
  Product(
    id: '1',
    name: 'Wireless Headphones',
    price: 89.99,
    imageUrl:
        'https://images.pexels.com/photos/3587478/pexels-photo-3587478.jpeg?auto=compress&cs=tinysrgb&w=400',
    category: 'Electronics',
    description: 'Premium sound quality',
  ),
  Product(
    id: '2',
    name: 'Smart Watch',
    price: 199.99,
    imageUrl:
        'https://images.pexels.com/photos/393047/pexels-photo-393047.jpeg?auto=compress&cs=tinysrgb&w=400',
    category: 'Electronics',
    description: 'Track your fitness',
  ),
  Product(
    id: '3',
    name: 'Laptop Stand',
    price: 49.99,
    imageUrl:
        'https://images.pexels.com/photos/7974/pexels-photo.jpg?auto=compress&cs=tinysrgb&w=400',
    category: 'Accessories',
    description: 'Ergonomic design',
  ),
  Product(
    id: '4',
    name: 'USB-C Cable',
    price: 19.99,
    imageUrl:
        'https://images.pexels.com/photos/4219861/pexels-photo-4219861.jpeg?auto=compress&cs=tinysrgb&w=400',
    category: 'Accessories',
    description: 'Fast charging',
  ),
  Product(
    id: '5',
    name: 'Keyboard',
    price: 129.99,
    imageUrl:
        'https://images.pexels.com/photos/1714208/pexels-photo-1714208.jpeg?auto=compress&cs=tinysrgb&w=400',
    category: 'Electronics',
    description: 'Mechanical switches',
  ),
  Product(
    id: '6',
    name: 'Mouse Pad',
    price: 24.99,
    imageUrl:
        'https://images.pexels.com/photos/2115256/pexels-photo-2115256.jpeg?auto=compress&cs=tinysrgb&w=400',
    category: 'Accessories',
    description: 'Extra large size',
  ),
];

// ==================== HOME PAGE CONTENT ====================
class _HomePage extends StatefulWidget {
  @override
  State<_HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<_HomePage> {
  final CartService _cartService = CartService();

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
                  'PIXEL SHOP',
                  style: GoogleFonts.pressStart2p(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Shop premium items',
                  style: GoogleFonts.pressStart2p(
                    fontSize: 8,
                    color: MinecraftColors.sand,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          // Categories
          Text(
            'CATEGORIES',
            style: GoogleFonts.pressStart2p(
              fontSize: 12,
              color: MinecraftColors.sand,
            ),
          ),
          SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _buildCategoryCard('Electronics', Icons.phone_android),
              ),
              SizedBox(width: 12),
              Expanded(child: _buildCategoryCard('Accessories', Icons.headset)),
            ],
          ),
          SizedBox(height: 20),
          // Featured Products
          Text(
            'FEATURED',
            style: GoogleFonts.pressStart2p(
              fontSize: 12,
              color: MinecraftColors.sand,
            ),
          ),
          SizedBox(height: 12),
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.75,
            ),
            itemCount: sampleProducts.length,
            itemBuilder: (context, index) {
              return _buildProductCard(sampleProducts[index]);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryCard(String title, IconData icon) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: MinecraftColors.darkDirt,
        border: Border.all(color: MinecraftColors.coal, width: 3),
      ),
      child: Column(
        children: [
          Icon(icon, color: MinecraftColors.grassGreen, size: 30),
          SizedBox(height: 8),
          Text(
            title,
            style: GoogleFonts.pressStart2p(
              fontSize: 8,
              color: MinecraftColors.sand,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildProductCard(Product product) {
    return Container(
      decoration: BoxDecoration(
        color: MinecraftColors.darkDirt,
        border: Border.all(color: MinecraftColors.coal, width: 3),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 120,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: MinecraftColors.coal, width: 3),
              ),
            ),
            child: Image.network(
              product.imageUrl,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: GoogleFonts.pressStart2p(
                    fontSize: 8,
                    color: MinecraftColors.sand,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4),
                Text(
                  '\$${product.price.toStringAsFixed(2)}',
                  style: GoogleFonts.pressStart2p(
                    fontSize: 10,
                    color: MinecraftColors.gold,
                  ),
                ),
                SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  height: 35,
                  child: ElevatedButton(
                    onPressed: () {
                      _cartService.addToCart(product);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Added to cart!',
                            style: GoogleFonts.pressStart2p(fontSize: 8),
                          ),
                          backgroundColor: MinecraftColors.grassGreen,
                          duration: Duration(seconds: 1),
                        ),
                      );
                      setState(() {});
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 8),
                    ),
                    child: Icon(Icons.add_shopping_cart, size: 16),
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

// ==================== CART PAGE CONTENT ====================
class _CartPage extends StatefulWidget {
  @override
  State<_CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<_CartPage> {
  final CartService _cartService = CartService();

  @override
  Widget build(BuildContext context) {
    final items = _cartService.items;

    if (items.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: MinecraftColors.darkDirt,
                border: Border.all(color: MinecraftColors.coal, width: 4),
              ),
              child: Icon(
                Icons.shopping_cart_outlined,
                size: 80,
                color: MinecraftColors.stone,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'CART EMPTY',
              style: GoogleFonts.pressStart2p(
                fontSize: 14,
                color: MinecraftColors.sand,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Add items to cart',
              style: GoogleFonts.pressStart2p(
                fontSize: 8,
                color: MinecraftColors.stone,
              ),
            ),
          ],
        ),
      );
    }

    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.all(16),
            itemCount: items.length,
            itemBuilder: (context, index) {
              return _buildCartItem(items[index]);
            },
          ),
        ),
        _buildCheckoutSection(),
      ],
    );
  }

  Widget _buildCartItem(CartItem item) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: MinecraftColors.darkDirt,
        border: Border.all(color: MinecraftColors.coal, width: 3),
      ),
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(color: MinecraftColors.coal, width: 3),
              ),
            ),
            child: Image.network(item.product.imageUrl, fit: BoxFit.cover),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.product.name,
                    style: GoogleFonts.pressStart2p(
                      fontSize: 8,
                      color: MinecraftColors.sand,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '\$${item.product.price.toStringAsFixed(2)}',
                    style: GoogleFonts.pressStart2p(
                      fontSize: 10,
                      color: MinecraftColors.gold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      _buildQuantityButton(Icons.remove, () {
                        setState(() {
                          _cartService.updateQuantity(
                            item.product.id,
                            item.quantity - 1,
                          );
                        });
                      }),
                      SizedBox(width: 8),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: MinecraftColors.coal,
                          border: Border.all(
                            color: MinecraftColors.stone,
                            width: 2,
                          ),
                        ),
                        child: Text(
                          '${item.quantity}',
                          style: GoogleFonts.pressStart2p(
                            fontSize: 10,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      _buildQuantityButton(Icons.add, () {
                        setState(() {
                          _cartService.updateQuantity(
                            item.product.id,
                            item.quantity + 1,
                          );
                        });
                      }),
                    ],
                  ),
                ],
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.delete, color: MinecraftColors.redstone),
            onPressed: () {
              setState(() {
                _cartService.removeFromCart(item.product.id);
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildQuantityButton(IconData icon, VoidCallback onPressed) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: MinecraftColors.grassGreen,
        border: Border.all(color: MinecraftColors.darkGreen, width: 2),
      ),
      child: IconButton(
        padding: EdgeInsets.zero,
        icon: Icon(icon, size: 16, color: Colors.white),
        onPressed: onPressed,
      ),
    );
  }

  Widget _buildCheckoutSection() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: MinecraftColors.darkDirt,
        border: Border(top: BorderSide(color: MinecraftColors.coal, width: 4)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'TOTAL',
                style: GoogleFonts.pressStart2p(
                  fontSize: 12,
                  color: MinecraftColors.sand,
                ),
              ),
              Text(
                '\$${_cartService.total.toStringAsFixed(2)}',
                style: GoogleFonts.pressStart2p(
                  fontSize: 14,
                  color: MinecraftColors.gold,
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                _showCheckoutDialog();
              },
              child: Text('CHECKOUT'),
            ),
          ),
        ],
      ),
    );
  }

  void _showCheckoutDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'CHECKOUT',
          style: GoogleFonts.pressStart2p(
            fontSize: 12,
            color: MinecraftColors.grassGreen,
          ),
        ),
        content: Text(
          'Order placed!\nTotal: \$${_cartService.total.toStringAsFixed(2)}',
          style: GoogleFonts.pressStart2p(
            fontSize: 10,
            color: MinecraftColors.sand,
          ),
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              setState(() {
                _cartService.clear();
              });
              Navigator.pop(context);
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }
}

// ==================== PROFILE PAGE CONTENT ====================
class _ProfilePage extends StatefulWidget {
  @override
  State<_ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<_ProfilePage> {
  String _userName = 'CUSTOMER';
  String _userEmail = 'customer@pixelshop.com';
  int _avatarSeed = 12;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          SizedBox(height: 20),
          // Avatar Block
          GestureDetector(
            onTap: () => _changeAvatar(),
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: MinecraftColors.stone,
                border: Border.all(color: MinecraftColors.darkStone, width: 4),
              ),
              child: Stack(
                children: [
                  Image.network(
                    'https://i.pravatar.cc/120?img=$_avatarSeed',
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: MinecraftColors.grassGreen,
                        border: Border.all(
                          color: MinecraftColors.darkGreen,
                          width: 2,
                        ),
                      ),
                      child: Icon(
                        Icons.camera_alt,
                        size: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 16),
          Text(
            _userName,
            style: GoogleFonts.pressStart2p(
              fontSize: 18,
              color: MinecraftColors.sand,
            ),
          ),
          Text(
            'Premium Member',
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
              _buildProfileStat('ORDERS', '42'),
              _buildProfileStat('WISHLIST', '18'),
              _buildProfileStat('POINTS', '2,400'),
            ],
          ),
          SizedBox(height: 24),
          // Edit Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {
                _showEditProfileDialog();
              },
              icon: Icon(Icons.edit),
              label: Text('EDIT PROFILE'),
              style: ElevatedButton.styleFrom(
                backgroundColor: MinecraftColors.diamond,
              ),
            ),
          ),
          SizedBox(height: 24),
          // Settings
          _buildSettingsTile(Icons.receipt_long, 'MY ORDERS', () {
            _showOrdersPage();
          }),
          _buildSettingsTile(Icons.favorite, 'WISHLIST', () {
            _showWishlistPage();
          }),
          _buildSettingsTile(Icons.location_on, 'ADDRESSES', () {
            _showAddressesPage();
          }),
          _buildSettingsTile(Icons.payment, 'PAYMENT', () {
            _showPaymentPage();
          }),
          _buildSettingsTile(Icons.settings, 'SETTINGS', () {
            _showSettingsPage();
          }),
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

  Widget _buildSettingsTile(IconData icon, String title, VoidCallback onTap) {
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
        onTap: onTap,
      ),
    );
  }

  void _changeAvatar() {
    setState(() {
      _avatarSeed = (DateTime.now().millisecondsSinceEpoch % 70) + 1;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Avatar updated!',
          style: GoogleFonts.pressStart2p(fontSize: 8),
        ),
        backgroundColor: MinecraftColors.grassGreen,
        duration: Duration(seconds: 1),
      ),
    );
  }

  void _showEditProfileDialog() {
    final nameController = TextEditingController(text: _userName);
    final emailController = TextEditingController(text: _userEmail);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'EDIT PROFILE',
          style: GoogleFonts.pressStart2p(
            fontSize: 12,
            color: MinecraftColors.grassGreen,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              style: GoogleFonts.pressStart2p(
                fontSize: 10,
                color: Colors.white,
              ),
              decoration: InputDecoration(
                labelText: 'NAME',
                prefixIcon: Icon(
                  Icons.person,
                  color: MinecraftColors.grassGreen,
                ),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: emailController,
              style: GoogleFonts.pressStart2p(
                fontSize: 10,
                color: Colors.white,
              ),
              decoration: InputDecoration(
                labelText: 'EMAIL',
                prefixIcon: Icon(
                  Icons.email,
                  color: MinecraftColors.grassGreen,
                ),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              nameController.dispose();
              emailController.dispose();
              Navigator.pop(context);
            },
            child: Text(
              'CANCEL',
              style: GoogleFonts.pressStart2p(
                fontSize: 10,
                color: MinecraftColors.stone,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _userName = nameController.text.isNotEmpty
                    ? nameController.text
                    : _userName;
                _userEmail = emailController.text.isNotEmpty
                    ? emailController.text
                    : _userEmail;
              });
              nameController.dispose();
              emailController.dispose();
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Profile updated!',
                    style: GoogleFonts.pressStart2p(fontSize: 8),
                  ),
                  backgroundColor: MinecraftColors.grassGreen,
                ),
              );
            },
            child: Text('SAVE'),
          ),
        ],
      ),
    );
  }

  void _showOrdersPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => _OrdersPage()),
    );
  }

  void _showWishlistPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => _WishlistPage()),
    );
  }

  void _showAddressesPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => _AddressesPage()),
    );
  }

  void _showPaymentPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => _PaymentPage()),
    );
  }

  void _showSettingsPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => _SettingsPage()),
    );
  }
}

// ==================== ORDERS PAGE ====================
class _OrdersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('MY ORDERS')),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(bottom: 12),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: MinecraftColors.darkDirt,
              border: Border.all(color: MinecraftColors.coal, width: 3),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'ORDER #${1000 + index}',
                      style: GoogleFonts.pressStart2p(
                        fontSize: 10,
                        color: MinecraftColors.sand,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: MinecraftColors.grassGreen,
                        border: Border.all(
                          color: MinecraftColors.darkGreen,
                          width: 2,
                        ),
                      ),
                      child: Text(
                        'DELIVERED',
                        style: GoogleFonts.pressStart2p(
                          fontSize: 6,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  'Date: Feb ${index + 1}, 2026',
                  style: GoogleFonts.pressStart2p(
                    fontSize: 8,
                    color: MinecraftColors.stone,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Items: ${index + 2}',
                  style: GoogleFonts.pressStart2p(
                    fontSize: 8,
                    color: MinecraftColors.stone,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Total: \$${(99.99 + index * 10).toStringAsFixed(2)}',
                  style: GoogleFonts.pressStart2p(
                    fontSize: 10,
                    color: MinecraftColors.gold,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// ==================== WISHLIST PAGE ====================
class _WishlistPage extends StatefulWidget {
  @override
  State<_WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<_WishlistPage> {
  final CartService _cartService = CartService();
  final List<Product> _wishlist = [
    Product(
      id: '7',
      name: 'Gaming Mouse',
      price: 79.99,
      imageUrl:
          'https://images.pexels.com/photos/2115256/pexels-photo-2115256.jpeg?auto=compress&cs=tinysrgb&w=400',
      category: 'Electronics',
      description: 'RGB lighting',
    ),
    Product(
      id: '8',
      name: 'Webcam',
      price: 149.99,
      imageUrl:
          'https://images.pexels.com/photos/7595263/pexels-photo-7595263.jpeg?auto=compress&cs=tinysrgb&w=400',
      category: 'Electronics',
      description: '4K resolution',
    ),
    Product(
      id: '9',
      name: 'Desk Lamp',
      price: 39.99,
      imageUrl:
          'https://images.pexels.com/photos/1112598/pexels-photo-1112598.jpeg?auto=compress&cs=tinysrgb&w=400',
      category: 'Accessories',
      description: 'LED adjustable',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('WISHLIST')),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: _wishlist.length,
        itemBuilder: (context, index) {
          final product = _wishlist[index];
          return Container(
            margin: EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
              color: MinecraftColors.darkDirt,
              border: Border.all(color: MinecraftColors.coal, width: 3),
            ),
            child: Row(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    border: Border(
                      right: BorderSide(color: MinecraftColors.coal, width: 3),
                    ),
                  ),
                  child: Image.network(product.imageUrl, fit: BoxFit.cover),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name,
                          style: GoogleFonts.pressStart2p(
                            fontSize: 8,
                            color: MinecraftColors.sand,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          '\$${product.price.toStringAsFixed(2)}',
                          style: GoogleFonts.pressStart2p(
                            fontSize: 10,
                            color: MinecraftColors.gold,
                          ),
                        ),
                        SizedBox(height: 8),
                        SizedBox(
                          width: double.infinity,
                          height: 35,
                          child: ElevatedButton(
                            onPressed: () {
                              _cartService.addToCart(product);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Added to cart!',
                                    style: GoogleFonts.pressStart2p(
                                      fontSize: 8,
                                    ),
                                  ),
                                  backgroundColor: MinecraftColors.grassGreen,
                                  duration: Duration(seconds: 1),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(vertical: 8),
                            ),
                            child: Text(
                              'ADD TO CART',
                              style: TextStyle(fontSize: 8),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.delete, color: MinecraftColors.redstone),
                  onPressed: () {
                    setState(() {
                      _wishlist.removeAt(index);
                    });
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// ==================== ADDRESSES PAGE ====================
class _AddressesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ADDRESSES'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Add address feature coming soon!',
                    style: GoogleFonts.pressStart2p(fontSize: 8),
                  ),
                  backgroundColor: MinecraftColors.grassGreen,
                ),
              );
            },
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          _buildAddressCard(
            'Home',
            '123 Pixel Street\nBlock City, MC 12345\nUnited States',
            true,
          ),
          SizedBox(height: 12),
          _buildAddressCard(
            'Work',
            '456 Diamond Avenue\nCraft Town, MC 67890\nUnited States',
            false,
          ),
        ],
      ),
    );
  }

  Widget _buildAddressCard(String title, String address, bool isDefault) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: MinecraftColors.darkDirt,
        border: Border.all(color: MinecraftColors.coal, width: 3),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: GoogleFonts.pressStart2p(
                  fontSize: 10,
                  color: MinecraftColors.sand,
                ),
              ),
              if (isDefault)
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: MinecraftColors.grassGreen,
                    border: Border.all(
                      color: MinecraftColors.darkGreen,
                      width: 2,
                    ),
                  ),
                  child: Text(
                    'DEFAULT',
                    style: GoogleFonts.pressStart2p(
                      fontSize: 6,
                      color: Colors.white,
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(height: 12),
          Text(
            address,
            style: GoogleFonts.pressStart2p(
              fontSize: 8,
              color: MinecraftColors.stone,
            ),
          ),
          SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 35,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: MinecraftColors.grassGreen,
                      width: 2,
                    ),
                  ),
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'EDIT',
                      style: GoogleFonts.pressStart2p(
                        fontSize: 8,
                        color: MinecraftColors.grassGreen,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: Container(
                  height: 35,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: MinecraftColors.redstone,
                      width: 2,
                    ),
                  ),
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'DELETE',
                      style: GoogleFonts.pressStart2p(
                        fontSize: 8,
                        color: MinecraftColors.redstone,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ==================== PAYMENT PAGE ====================
class _PaymentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PAYMENT'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Add payment method coming soon!',
                    style: GoogleFonts.pressStart2p(fontSize: 8),
                  ),
                  backgroundColor: MinecraftColors.grassGreen,
                ),
              );
            },
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          _buildPaymentCard(
            'Visa ending in 1234',
            'Expires 12/25',
            Icons.credit_card,
            true,
          ),
          SizedBox(height: 12),
          _buildPaymentCard(
            'Mastercard ending in 5678',
            'Expires 08/26',
            Icons.credit_card,
            false,
          ),
          SizedBox(height: 12),
          _buildPaymentCard(
            'PayPal',
            'customer@email.com',
            Icons.account_balance_wallet,
            false,
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentCard(
    String title,
    String subtitle,
    IconData icon,
    bool isDefault,
  ) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: MinecraftColors.darkDirt,
        border: Border.all(color: MinecraftColors.coal, width: 3),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: MinecraftColors.grassGreen.withOpacity(0.2),
              border: Border.all(color: MinecraftColors.grassGreen, width: 2),
            ),
            child: Icon(icon, color: MinecraftColors.grassGreen, size: 24),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: GoogleFonts.pressStart2p(
                          fontSize: 8,
                          color: MinecraftColors.sand,
                        ),
                      ),
                    ),
                    if (isDefault)
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: MinecraftColors.grassGreen,
                          border: Border.all(
                            color: MinecraftColors.darkGreen,
                            width: 2,
                          ),
                        ),
                        child: Text(
                          'DEFAULT',
                          style: GoogleFonts.pressStart2p(
                            fontSize: 6,
                            color: Colors.white,
                          ),
                        ),
                      ),
                  ],
                ),
                SizedBox(height: 4),
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
          Icon(Icons.chevron_right, color: MinecraftColors.stone),
        ],
      ),
    );
  }
}

// ==================== SETTINGS PAGE ====================
class _SettingsPage extends StatefulWidget {
  @override
  State<_SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<_SettingsPage> {
  bool _notifications = true;
  bool _emailUpdates = true;
  bool _darkMode = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SETTINGS')),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Text(
            'NOTIFICATIONS',
            style: GoogleFonts.pressStart2p(
              fontSize: 10,
              color: MinecraftColors.sand,
            ),
          ),
          SizedBox(height: 12),
          _buildSwitchTile(
            'Push Notifications',
            'Get notified about orders',
            _notifications,
            (value) => setState(() => _notifications = value),
          ),
          _buildSwitchTile(
            'Email Updates',
            'Receive promotional emails',
            _emailUpdates,
            (value) => setState(() => _emailUpdates = value),
          ),
          SizedBox(height: 24),
          Text(
            'APPEARANCE',
            style: GoogleFonts.pressStart2p(
              fontSize: 10,
              color: MinecraftColors.sand,
            ),
          ),
          SizedBox(height: 12),
          _buildSwitchTile(
            'Dark Mode',
            'Use dark theme',
            _darkMode,
            (value) => setState(() => _darkMode = value),
          ),
          SizedBox(height: 24),
          Text(
            'ABOUT',
            style: GoogleFonts.pressStart2p(
              fontSize: 10,
              color: MinecraftColors.sand,
            ),
          ),
          SizedBox(height: 12),
          _buildInfoTile('Version', 'v1.0.0'),
          _buildInfoTile('Terms of Service', ''),
          _buildInfoTile('Privacy Policy', ''),
          _buildInfoTile('Help & Support', ''),
          SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text(
                      'DELETE ACCOUNT',
                      style: GoogleFonts.pressStart2p(
                        fontSize: 12,
                        color: MinecraftColors.redstone,
                      ),
                    ),
                    content: Text(
                      'Are you sure?',
                      style: GoogleFonts.pressStart2p(
                        fontSize: 10,
                        color: MinecraftColors.sand,
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text(
                          'CANCEL',
                          style: GoogleFonts.pressStart2p(
                            fontSize: 10,
                            color: MinecraftColors.stone,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: MinecraftColors.redstone,
                        ),
                        child: Text('DELETE'),
                      ),
                    ],
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: MinecraftColors.redstone,
              ),
              child: Text('DELETE ACCOUNT'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSwitchTile(
    String title,
    String subtitle,
    bool value,
    Function(bool) onChanged,
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
                SizedBox(height: 4),
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
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: MinecraftColors.grassGreen,
          ),
        ],
      ),
    );
  }

  Widget _buildInfoTile(String title, String subtitle) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: MinecraftColors.darkDirt,
        border: Border.all(color: MinecraftColors.coal, width: 2),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: GoogleFonts.pressStart2p(
                fontSize: 8,
                color: MinecraftColors.sand,
              ),
            ),
          ),
          if (subtitle.isNotEmpty)
            Text(
              subtitle,
              style: GoogleFonts.pressStart2p(
                fontSize: 8,
                color: MinecraftColors.stone,
              ),
            )
          else
            Icon(Icons.chevron_right, color: MinecraftColors.stone),
        ],
      ),
    );
  }
}
