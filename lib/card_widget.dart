import 'dart:math';

import 'package:card_flip_animation/back_card_widget.dart';
import 'package:card_flip_animation/bank_card_widget.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatefulWidget {
  const CardWidget({super.key});

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> with TickerProviderStateMixin {
  bool _isZoomedIn = false;
  bool _showFrontSide = true;
  bool _flipXAxis = true;

  late AnimationController _zoomController;
  late Animation<double> _zoomAnimation;

  @override
  void initState() {
    super.initState();
    _zoomController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _zoomAnimation =
        Tween<double>(begin: 0.9, end: 1.1).animate(CurvedAnimation(
      parent: _zoomController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _zoomController.dispose();
    super.dispose();
  }

  Color bgColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 80,
          ),
          Center(
            child: AnimatedBuilder(
              animation: _zoomAnimation,
              builder: (context, child) {
                return Transform.scale(
                  scale: _zoomAnimation.value,
                  child: AnimatedContainer(
                    width: _isZoomedIn ? 330 : 350,
                    height: _isZoomedIn ? 200 : 200,
                    duration: const Duration(milliseconds: 300),
                    child: _buildFlipAnimation(),
                  ),
                );
              },
            ),
          ),
          Spacer(),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _isZoomedIn = !_isZoomedIn;
                if (_isZoomedIn) {
                  _zoomController.forward();
                  Future.delayed(Duration(milliseconds: 200), () {
                    setState(() {
                      bgColor = Colors.grey;
                    });
                  });
                } else {
                  _zoomController.reverse();
                  Future.delayed(Duration(milliseconds: 200), () {
                    setState(() {
                      bgColor = Colors.white;
                    });
                  });
                }
              });
            },
            child: const Text("zoom"),
          ),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }

  void _switchCard() {
    setState(() {
      _showFrontSide = !_showFrontSide;
      _flipXAxis = !_flipXAxis;
    });
  }

  Widget _buildFlipAnimation() {
    return GestureDetector(
      onTap: _switchCard,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 1500),
        transitionBuilder: __transitionBuilder,
        layoutBuilder: (widget, list) => Stack(children: [widget!, ...list]),
        child: _showFrontSide
            ? BankCardWidget(
                key: const ValueKey(true),
                cardHolderName: 'Wassef Hassine',
                cardNumber: '1234 5678 9012 3456',
                expiryDate: '12/25',
                bankName: 'A9wa développeur flutter fi 7omti',
              )
            : BankCardBackWidget(
                key: const ValueKey(false),
                cardNumber: '1234 5678 9012 3456',
                cvv: '123',
              ),
      ),
    );
  }

  Widget __transitionBuilder(Widget widget, Animation<double> animation) {
    final rotateAnim = Tween(begin: pi, end: 0.0).animate(animation);
    return AnimatedBuilder(
      animation: rotateAnim,
      child: widget,
      builder: (context, widget) {
        final isUnder = (ValueKey(_showFrontSide) != widget?.key);
        var tilt = ((animation.value - 0.5).abs() - 0.5) * 0.003;
        tilt *= isUnder ? -1.0 : 1.0;
        final value =
            isUnder ? min(rotateAnim.value, pi / 2) : rotateAnim.value;
        return Transform(
          transform: Matrix4.rotationY(value)..setEntry(3, 0, tilt),
          alignment: Alignment.center,
          child: widget,
        );
      },
    );
  }
}
