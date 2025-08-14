import 'package:flutter/material.dart';
import 'package:restaurant_booking/features/auth/presentation/register_screen.dart';
import 'login_form.dart';

void showDraggableAuthSheet(BuildContext context, {int initialPage = 0}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) => DraggableScrollableSheet(
      initialChildSize: 0.8,
      minChildSize: 0.5,
      maxChildSize: 0.9,
      expand: false,
      builder: (context, scrollController) {
        return AuthSheetContent(
          scrollController: scrollController,
          initialPage: initialPage,
        );
      },
    ),
  );
}

class AuthSheetContent extends StatefulWidget {
  final ScrollController scrollController;
  final int initialPage;

  const AuthSheetContent({
    Key? key,
    required this.scrollController,
    this.initialPage = 0,
  }) : super(key: key);

  @override
  _AuthSheetContentState createState() => _AuthSheetContentState();
}

class _AuthSheetContentState extends State<AuthSheetContent> {
  final PageController _pageController = PageController(
    initialPage: 0,
  ); // Initial page belgilash

  @override
  void initState() {
    super.initState();
    // jumpToPage ni olib tashladik, chunki initialPage PageController da belgilandi
  }

  @override
  void dispose() {
    _pageController.dispose(); // Resource larini tozalash
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        children: [
          const SizedBox(height: 10),
          Container(
            width: 40,
            height: 5,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {}); // Page o'zgarganda UI ni yangilash
              },
              children: [
                LoginForm(
                  onSwitch: () => _pageController.animateToPage(
                    1,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  ),
                ),
                RegisterForm(
                  onSwitch: () => _pageController.animateToPage(
                    0,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
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
