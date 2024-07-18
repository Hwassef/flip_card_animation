import 'dart:math';
import 'package:card_flip_animation/widgets/bank_back_card_informations_widget.dart';
import 'package:card_flip_animation/widgets/bank_card_front_informations_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  /// To track zoom state

  bool _isZoomedIn = false;

  /// To track which side of the card to show

  bool _showFrontSide = true;

  /// Animation controller for zoom

  late AnimationController _zoomController;

  /// Animation for zoom effect

  late Animation<double> _zoomAnimation;

  @override
  void initState() {
    super.initState();

    /// Initialize the zoom animation controller
    _zoomController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    /// Define the zoom animation
    _zoomAnimation = Tween<double>(begin: 0.9, end: 1.1).animate(
      CurvedAnimation(
        parent: _zoomController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    /// Dispose the controller when no longer needed
    _zoomController.dispose();
    super.dispose();
  }

  /// Background color of the screen

  Color _bgColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bgColor,

      /// Set background color

      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 80),

            /// Add some space at the top

            Center(
              child: AnimatedBuilder(
                animation: _zoomAnimation,

                /// Use the zoom animation

                builder: (context, child) {
                  return Transform.scale(
                    /// Scale according to the animation value
                    scale: _zoomAnimation.value,

                    child: AnimatedContainer(
                      /// Change width based on zoom state

                      width: _isZoomedIn ? 330 : 350,

                      /// Fixed height

                      height: 200,

                      /// Animation duration

                      duration: const Duration(milliseconds: 300),

                      /// Build the flip animation

                      child: _buildFlipAnimation(),
                    ),
                  );
                },
              ),
            ),

            /// Push the button to the bottom
            const Spacer(),
            ElevatedButton(
              /// Toggle zoom state when button is pressed
              onPressed: _toggleZoom,
              child: const Text("Zoom"),
            ),

            /// Add some space at the bottom
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  /// Method to toggle zoom state and update background color
  void _toggleZoom() {
    setState(() {
      _isZoomedIn = !_isZoomedIn;
      if (_isZoomedIn) {
        /// Start zoom in animation
        _zoomController.forward();

        /// Change background color
        Future.delayed(const Duration(milliseconds: 200), () {
          setState(() {
            _bgColor = Colors.grey[200]!;
          });
        });
      } else {
        /// Start zoom out animation
        _zoomController.reverse();

        /// Reset background color
        Future.delayed(const Duration(milliseconds: 200), () {
          setState(() {
            _bgColor = Colors.white;
          });
        });
      }
    });
  }

  /// Method to switch the card side
  void _switchCard() => setState(() {
        _showFrontSide = !_showFrontSide;
      });

  /// Build the flip animation
  Widget _buildFlipAnimation() {
    return GestureDetector(
      /// Switch card side on tap
      onTap: _switchCard,

      child: AnimatedSwitcher(
        /// Animation duration
        duration: const Duration(milliseconds: 1500),

        /// Use custom transition builder

        transitionBuilder: _transitionBuilder,

        /// Layout builder for stacking widgets

        layoutBuilder: (widget, list) => Stack(children: [widget!, ...list]),

        child: _showFrontSide
            ? const BankCardFrontInformationsWidget(
                key: ValueKey(true),
                cardHolderName: 'Wassef Hassine',
                cardNumber: '1234 5678 9012 3456',
                expiryDate: '12/25',
                bankName: 'A9wa développeur flutter fi 7omti',
              )
            : const BankCardBackInformationsWidget(
                key: ValueKey(false),
                cardNumber: '1234 5678 9012 3456',
                cvv: '123',
              ),
      ),
    );
  }

  /// Custom transition builder for card flip animation
  Widget _transitionBuilder(Widget widget, Animation<double> animation) {
    final rotateAnim = Tween(begin: pi, end: 0.0).animate(animation);
    return AnimatedBuilder(
      animation: rotateAnim,
      child: widget,
      builder: (context, child) {
        final isUnder = (ValueKey(_showFrontSide) != child?.key);
        var tilt = ((animation.value - 0.5).abs() - 0.5) * 0.003;
        tilt *= isUnder ? -1.0 : 1.0;
        final value =
            isUnder ? min(rotateAnim.value, pi / 2) : rotateAnim.value;
        return Transform(
          transform: Matrix4.rotationY(value)..setEntry(3, 0, tilt),
          alignment: Alignment.center,
          child: child,
        );
      },
    );
  }
}
