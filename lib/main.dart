import 'package:flutter/material.dart';

void main() {
  runApp(const TopUpPayBDApp());
}

class TopUpPayBDApp extends StatelessWidget {
  const TopUpPayBDApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TopUp Pay BD',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: const Color(0xFFF4F7F5),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0B7A33),
          primary: const Color(0xFF0B7A33),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const MainNavigationScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B7A33),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 92,
              height: 92,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: .12),
                borderRadius: BorderRadius.circular(28),
                border: Border.all(color: Colors.white24),
              ),
              child: const Icon(
                Icons.account_balance_wallet_rounded,
                color: Colors.white,
                size: 46,
              ),
            ),
            const SizedBox(height: 18),
            const Text(
              'TopUp Pay BD',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.w800,
                letterSpacing: .3,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Smart Recharge & Mobile Banking',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 28),
            const SizedBox(
              width: 26,
              height: 26,
              child: CircularProgressIndicator(
                strokeWidth: 2.4,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int currentIndex = 0;

  final List<Widget> screens = const [
    HomeScreen(),
    RechargeScreen(),
    WalletScreen(),
    HistoryScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    const primaryGreen = Color(0xFF0B7A33);

    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: NavigationBar(
        height: 72,
        backgroundColor: Colors.white,
        indicatorColor: const Color(0x1A0B7A33),
        selectedIndex: currentIndex,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        onDestinationSelected: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home_rounded, color: primaryGreen),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.phone_android_outlined),
            selectedIcon:
                Icon(Icons.phone_android_rounded, color: primaryGreen),
            label: 'Recharge',
          ),
          NavigationDestination(
            icon: Icon(Icons.account_balance_wallet_outlined),
            selectedIcon:
                Icon(Icons.account_balance_wallet_rounded, color: primaryGreen),
            label: 'Wallet',
          ),
          NavigationDestination(
            icon: Icon(Icons.history_outlined),
            selectedIcon: Icon(Icons.history_rounded, color: primaryGreen),
            label: 'History',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person, color: primaryGreen),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryGreen = Color(0xFF0B7A33);
    const darkGreen = Color(0xFF075B26);
    const cardWhite = Colors.white;
    const softBg = Color(0xFFF4F7F5);

    return Scaffold(
      backgroundColor: softBg,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 18),
                decoration: BoxDecoration(
                  color: primaryGreen,
                  borderRadius: BorderRadius.circular(22),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 42,
                          height: 42,
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: .16),
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(color: Colors.white24),
                          ),
                          child: const Icon(
                            Icons.account_balance_wallet_rounded,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                        const SizedBox(width: 12),
                        const Expanded(
                          child: Text(
                            'TopUp Pay BD',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        const Icon(
                          Icons.notifications_none_rounded,
                          color: Colors.white,
                          size: 26,
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),
                    const Text(
                      'Smart Recharge & Mobile Banking',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [primaryGreen, darkGreen],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Available Balance',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      '৳ 0.00',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: _smallInfoCard(
                            title: 'Cashback',
                            value: '৳ 0',
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _smallInfoCard(
                            title: 'Today Earn',
                            value: '৳ 0',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),
                    SizedBox(
                      width: 150,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: primaryGreen,
                          elevation: 0,
                          padding: const EdgeInsets.symmetric(vertical: 13),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        onPressed: () {},
                        icon: const Icon(Icons.add_circle_outline_rounded),
                        label: const Text(
                          'Add Money',
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 18),

              _sectionTitle('Quick Services'),
              const SizedBox(height: 10),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: cardWhite,
                  borderRadius: BorderRadius.circular(22),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x12000000),
                      blurRadius: 12,
                      offset: Offset(0, 6),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      children: const [
                        Expanded(
                          child: ServiceCard(
                            icon: Icons.phone_android_rounded,
                            title: 'Recharge',
                            color: Color(0xFF0B7A33),
                          ),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: ServiceCard(
                            icon: Icons.card_giftcard_rounded,
                            title: 'Offers',
                            color: Color(0xFFE53935),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    Row(
                      children: const [
                        Expanded(
                          child: ServiceCard(
                            icon: Icons.language_rounded,
                            title: 'Internet',
                            color: Color(0xFF1E88E5),
                          ),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: ServiceCard(
                            icon: Icons.receipt_long_rounded,
                            title: 'Bill Pay',
                            color: Color(0xFFFF9800),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 18),

              _sectionTitle('Mobile Banking'),
              const SizedBox(height: 10),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: cardWhite,
                  borderRadius: BorderRadius.circular(22),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x12000000),
                      blurRadius: 12,
                      offset: Offset(0, 6),
                    ),
                  ],
                ),
                child: Row(
                  children: const [
                    Expanded(
                      child: BankingCard(
                        icon: Icons.account_balance_wallet_rounded,
                        title: 'bKash',
                        color: Color(0xFFE2136E),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: BankingCard(
                        icon: Icons.local_fire_department_rounded,
                        title: 'Nagad',
                        color: Color(0xFFFF6D00),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: BankingCard(
                        icon: Icons.rocket_launch_rounded,
                        title: 'Rocket',
                        color: Color(0xFF7B1FA2),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: BankingCard(
                        icon: Icons.account_balance_rounded,
                        title: 'Bank',
                        color: Color(0xFF1565C0),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 18),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF0B7A33), Color(0xFF149647)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Row(
                  children: [
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Drive Sell System',
                            style: TextStyle(
                              color: Colors.yellowAccent,
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'সব সার্ভিস এক অ্যাপে\nরিচার্জ, অফার, ব্যাংকিং',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              height: 1.35,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Smart telecom dashboard for your business.',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      width: 84,
                      height: 84,
                      decoration: BoxDecoration(
                        color: Colors.white12,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Icon(
                        Icons.trending_up_rounded,
                        color: Colors.white,
                        size: 46,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _sectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 2),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w800,
          color: Color(0xFF122217),
        ),
      ),
    );
  }

  static Widget _smallInfoCard({
    required String title,
    required String value,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white12,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}
class RechargeScreen extends StatefulWidget {
  const RechargeScreen({super.key});

  @override
  State<RechargeScreen> createState() => _RechargeScreenState();
}

class _RechargeScreenState extends State<RechargeScreen> {
  final TextEditingController numberController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  String selectedOperator = 'Grameenphone';
  String selectedType = 'Prepaid';

  final List<String> operators = [
    'Grameenphone',
    'Robi',
    'Banglalink',
    'Airtel',
    'Teletalk',
  ];

  final List<int> quickAmounts = [20, 50, 100, 200, 500];

  @override
  Widget build(BuildContext context) {
    const primaryGreen = Color(0xFF0B7A33);

    return Scaffold(
      backgroundColor: const Color(0xFFF4F7F5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Recharge',
          style: TextStyle(
            color: Color(0xFF18231B),
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 14, 16, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF0B7A33), Color(0xFF149647)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(24),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Mobile Recharge',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'সব অপারেটরে দ্রুত রিচার্জ করুন',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 18),

            _sectionTitleRecharge('Mobile Number'),
            const SizedBox(height: 8),
            _inputBox(
              child: TextField(
                controller: numberController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  hintText: '01XXXXXXXXX',
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.phone_android_rounded),
                ),
              ),
            ),

            const SizedBox(height: 16),

            _sectionTitleRecharge('Operator'),
            const SizedBox(height: 8),
            _inputBox(
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: selectedOperator,
                  isExpanded: true,
                  items: operators.map((item) {
                    return DropdownMenuItem(
                      value: item,
                      child: Text(item),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedOperator = value!;
                    });
                  },
                ),
              ),
            ),

            const SizedBox(height: 16),

            _sectionTitleRecharge('Recharge Type'),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: _typeButton(
                    title: 'Prepaid',
                    isSelected: selectedType == 'Prepaid',
                    onTap: () {
                      setState(() {
                        selectedType = 'Prepaid';
                      });
                    },
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _typeButton(
                    title: 'Postpaid',
                    isSelected: selectedType == 'Postpaid',
                    onTap: () {
                      setState(() {
                        selectedType = 'Postpaid';
                      });
                    },
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            _sectionTitleRecharge('Amount'),
            const SizedBox(height: 8),
            _inputBox(
              child: TextField(
                controller: amountController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: 'Enter amount',
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.currency_exchange_rounded),
                ),
              ),
            ),

            const SizedBox(height: 12),

            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: quickAmounts.map((amount) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      amountController.text = amount.toString();
                    });
                  },
                  borderRadius: BorderRadius.circular(14),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: const Color(0xFFE2E8E3)),
                    ),
                    child: Text(
                      '৳$amount',
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF18231B),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),

            const SizedBox(height: 18),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x12000000),
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Row(
                children: const [
                  Icon(Icons.local_offer_rounded, color: Color(0xFF0B7A33)),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Offer: GP 100৳ recharge = 5৳ bonus cashback',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF18231B),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 22),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryGreen,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Recharge request: ${numberController.text} | $selectedOperator | ${amountController.text}৳',
                      ),
                    ),
                  );
                },
                child: const Text(
                  'Recharge Now',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _inputBox({required Widget child}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFE2E8E3)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 8,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: child,
    );
  }

  Widget _typeButton({
    required String title,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    const primaryGreen = Color(0xFF0B7A33);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0x1A0B7A33) : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? primaryGreen : const Color(0xFFE2E8E3),
            width: 1.3,
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: isSelected ? primaryGreen : const Color(0xFF18231B),
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }

  Widget _sectionTitleRecharge(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w700,
        color: Color(0xFF18231B),
      ),
    );
  }
}

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F7F5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Wallet',
          style: TextStyle(
            color: Color(0xFF18231B),
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 14, 16, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF0B7A33), Color(0xFF149647)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Current Balance',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    '৳ 12,500.00',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 14),
                  Row(
                    children: [
                      Expanded(
                        child: _walletInfoBox(
                          title: 'Cashback',
                          value: '৳ 350',
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _walletInfoBox(
                          title: 'Pending',
                          value: '৳ 120',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 18),

            _walletTitle('Quick Actions'),
            const SizedBox(height: 10),
            Row(
              children: const [
                Expanded(
                  child: WalletActionCard(
                    icon: Icons.add_circle_outline_rounded,
                    title: 'Add Money',
                    color: Color(0xFF0B7A33),
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: WalletActionCard(
                    icon: Icons.send_rounded,
                    title: 'Send Money',
                    color: Color(0xFF1565C0),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            Row(
              children: const [
                Expanded(
                  child: WalletActionCard(
                    icon: Icons.account_balance_wallet_rounded,
                    title: 'Cash Out',
                    color: Color(0xFFFF6D00),
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: WalletActionCard(
                    icon: Icons.receipt_long_rounded,
                    title: 'Statement',
                    color: Color(0xFF7B1FA2),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 18),

            _walletTitle('Linked Accounts'),
            const SizedBox(height: 10),
            _linkedAccountTile(
              icon: Icons.account_balance_wallet_rounded,
              title: 'bKash Personal',
              subtitle: '017XXXXXXXX',
              color: const Color(0xFFE2136E),
            ),
            const SizedBox(height: 10),
            _linkedAccountTile(
              icon: Icons.local_fire_department_rounded,
              title: 'Nagad Account',
              subtitle: '018XXXXXXXX',
              color: const Color(0xFFFF6D00),
            ),
            const SizedBox(height: 10),
            _linkedAccountTile(
              icon: Icons.rocket_launch_rounded,
              title: 'Rocket Wallet',
              subtitle: '019XXXXXXXX',
              color: const Color(0xFF7B1FA2),
            ),

            const SizedBox(height: 18),

            _walletTitle('Recent Wallet Activity'),
            const SizedBox(height: 10),
            _activityTile(
              title: 'Add Money from bKash',
              amount: '+৳ 2,000',
              time: 'Today, 11:25 AM',
              positive: true,
            ),
            const SizedBox(height: 10),
            _activityTile(
              title: 'Mobile Recharge',
              amount: '-৳ 100',
              time: 'Today, 09:40 AM',
              positive: false,
            ),
            const SizedBox(height: 10),
            _activityTile(
              title: 'Cashback Added',
              amount: '+৳ 15',
              time: 'Yesterday, 08:10 PM',
              positive: true,
            ),
          ],
        ),
      ),
    );
  }

  static Widget _walletTitle(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w800,
        color: Color(0xFF18231B),
      ),
    );
  }

  static Widget _walletInfoBox({
    required String title,
    required String value,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white12,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }

  Widget _linkedAccountTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Color(0x12000000),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: color.withValues(alpha: .12),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF18231B),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 12.5,
                    color: Color(0xFF6B756E),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const Icon(Icons.chevron_right_rounded, color: Color(0xFF9AA59D)),
        ],
      ),
    );
  }

  Widget _activityTile({
    required String title,
    required String amount,
    required String time,
    required bool positive,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Color(0x12000000),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 22,
            backgroundColor:
                positive ? const Color(0x140B7A33) : const Color(0x14E53935),
            child: Icon(
              positive ? Icons.south_west_rounded : Icons.north_east_rounded,
              color:
                  positive ? const Color(0xFF0B7A33) : const Color(0xFFE53935),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14.5,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF18231B),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  time,
                  style: const TextStyle(
                    fontSize: 12.5,
                    color: Color(0xFF6B756E),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Text(
            amount,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w800,
              color:
                  positive ? const Color(0xFF0B7A33) : const Color(0xFFE53935),
            ),
          ),
        ],
      ),
    );
  }
}

class WalletActionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;

  const WalletActionCard({
    super.key,
    required this.icon,
    required this.title,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Color(0x12000000),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: color.withValues(alpha: .12),
            child: Icon(icon, color: color, size: 26),
          ),
          const SizedBox(height: 10),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: Color(0xFF18231B),
            ),
          ),
        ],
      ),
    );
  }
}
class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F7F5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Transaction History',
          style: TextStyle(
            color: Color(0xFF18231B),
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 14, 16, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF0B7A33), Color(0xFF149647)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(24),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'This Month Summary',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '৳ 8,450 Total Transaction',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Recharge, wallet topup, cashback and bill payments',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 12.5,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 18),

            const Text(
              'Recent Transactions',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w800,
                color: Color(0xFF18231B),
              ),
            ),

            const SizedBox(height: 12),

            _historyTile(
              title: 'Grameenphone Recharge',
              subtitle: '017XXXXXXXX • Today, 10:15 AM',
              amount: '-৳ 100',
              amountColor: const Color(0xFFE53935),
              icon: Icons.phone_android_rounded,
              iconColor: const Color(0xFF0B7A33),
            ),
            const SizedBox(height: 10),

            _historyTile(
              title: 'Add Money from bKash',
              subtitle: 'Wallet top-up • Today, 11:30 AM',
              amount: '+৳ 2,000',
              amountColor: const Color(0xFF0B7A33),
              icon: Icons.account_balance_wallet_rounded,
              iconColor: const Color(0xFFE2136E),
            ),
            const SizedBox(height: 10),

            _historyTile(
              title: 'Internet Pack Purchase',
              subtitle: 'Robi Internet Offer • Yesterday',
              amount: '-৳ 48',
              amountColor: const Color(0xFFE53935),
              icon: Icons.language_rounded,
              iconColor: const Color(0xFF1E88E5),
            ),
            const SizedBox(height: 10),

            _historyTile(
              title: 'Cashback Received',
              subtitle: 'Recharge cashback • Yesterday',
              amount: '+৳ 5',
              amountColor: const Color(0xFF0B7A33),
              icon: Icons.card_giftcard_rounded,
              iconColor: const Color(0xFFFF9800),
            ),
            const SizedBox(height: 10),

            _historyTile(
              title: 'Electricity Bill Payment',
              subtitle: 'Palli Bidyut • 2 days ago',
              amount: '-৳ 650',
              amountColor: const Color(0xFFE53935),
              icon: Icons.receipt_long_rounded,
              iconColor: const Color(0xFF7B1FA2),
            ),
            const SizedBox(height: 10),

            _historyTile(
              title: 'Nagad Cash In',
              subtitle: '018XXXXXXXX • 3 days ago',
              amount: '+৳ 1,500',
              amountColor: const Color(0xFF0B7A33),
              icon: Icons.local_fire_department_rounded,
              iconColor: const Color(0xFFFF6D00),
            ),
          ],
        ),
      ),
    );
  }

  Widget _historyTile({
    required String title,
    required String subtitle,
    required String amount,
    required Color amountColor,
    required IconData icon,
    required Color iconColor,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Color(0x12000000),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: iconColor.withValues(alpha: .12),
            child: Icon(icon, color: iconColor, size: 24),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14.5,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF18231B),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 12.5,
                    color: Color(0xFF6B756E),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Text(
            amount,
            style: TextStyle(
              fontSize: 14.5,
              fontWeight: FontWeight.w800,
              color: amountColor,
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F7F5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'My Profile',
          style: TextStyle(
            color: Color(0xFF18231B),
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 14, 16, 24),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF0B7A33), Color(0xFF149647)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 36,
                    backgroundColor: Colors.white24,
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 42,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Md Jihad Hossen',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    '017XXXXXXXX',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 14),
                  Row(
                    children: [
                      Expanded(
                        child: _profileStatBox(
                          title: 'Total Recharge',
                          value: '125',
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _profileStatBox(
                          title: 'Cashback',
                          value: '৳ 550',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 18),

            _sectionTitle('Account'),
            const SizedBox(height: 10),
            _profileMenuTile(
              icon: Icons.account_circle_rounded,
              title: 'Personal Information',
              subtitle: 'Name, phone, email details',
              color: const Color(0xFF0B7A33),
            ),
            const SizedBox(height: 10),
            _profileMenuTile(
              icon: Icons.account_balance_wallet_rounded,
              title: 'Saved Wallet Accounts',
              subtitle: 'bKash, Nagad, Rocket accounts',
              color: const Color(0xFFE2136E),
            ),
            const SizedBox(height: 10),
            _profileMenuTile(
              icon: Icons.history_rounded,
              title: 'Transaction Reports',
              subtitle: 'Recharge and payment history',
              color: const Color(0xFF1565C0),
            ),

            const SizedBox(height: 18),

            _sectionTitle('Settings'),
            const SizedBox(height: 10),
            _profileMenuTile(
              icon: Icons.notifications_active_rounded,
              title: 'Notifications',
              subtitle: 'Offer, recharge, cashback alerts',
              color: const Color(0xFFFF9800),
            ),
            const SizedBox(height: 10),
            _profileMenuTile(
              icon: Icons.security_rounded,
              title: 'Security & PIN',
              subtitle: 'Password, PIN, account protection',
              color: const Color(0xFF7B1FA2),
            ),
            const SizedBox(height: 10),
            _profileMenuTile(
              icon: Icons.help_center_rounded,
              title: 'Help & Support',
              subtitle: 'FAQ, contact and support center',
              color: const Color(0xFF009688),
            ),

            const SizedBox(height: 24),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                onPressed: () {},
                icon: const Icon(Icons.logout_rounded),
                label: const Text(
                  'Logout',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _sectionTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w800,
          color: Color(0xFF18231B),
        ),
      ),
    );
  }

  static Widget _profileStatBox({
    required String title,
    required String value,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white12,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }

  Widget _profileMenuTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Color(0x12000000),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: color.withValues(alpha: .12),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14.5,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF18231B),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 12.5,
                    color: Color(0xFF6B756E),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const Icon(Icons.chevron_right_rounded, color: Color(0xFF9AA59D)),
        ],
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;

  const ServiceCard({
    super.key,
    required this.icon,
    required this.title,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAF8),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFE7ECE8)),
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: color.withValues(alpha: .12),
            child: Icon(icon, color: color, size: 26),
          ),
          const SizedBox(height: 10),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: Color(0xFF18231B),
            ),
          ),
        ],
      ),
    );
  }
}

class BankingCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;

  const BankingCard({
    super.key,
    required this.icon,
    required this.title,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAF8),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFE7ECE8)),
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 22,
            backgroundColor: color.withValues(alpha: .12),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(height: 10),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 12.5,
              fontWeight: FontWeight.w700,
              color: Color(0xFF18231B),
            ),
          ),
        ],
      ),
    );
  }
}
