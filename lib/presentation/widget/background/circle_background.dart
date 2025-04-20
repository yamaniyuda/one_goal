import 'package:flutter/material.dart';

class CircleBackground extends StatelessWidget {
    final Widget? child;

    const CircleBackground({super.key, this.child});

    @override
    Widget build(BuildContext context) {
        return Stack(
            children: [
                Container(
                    color: Theme.of(context).primaryColor,
                    height: MediaQuery.sizeOf(context).height,
                    child: Stack(
                        children: [
                            Positioned(
                                top: -150,
                                left: -300,
                                child: CircleAvatar(
                                    radius: 200,
                                    backgroundColor: Colors.white.withValues(alpha: 0.1),
                                ),
                            ),
                            Positioned(
                                top: 100,
                                right: -250,
                                child: CircleAvatar(
                                    radius: 200,
                                    backgroundColor: Colors.white.withValues(alpha: 0.1),
                                ),
                            ),
                            Positioned(
                                top: -200,
                                right: -300,
                                child: CircleAvatar(
                                    radius: 200,
                                    backgroundColor: Colors.white.withValues(alpha: 0.1),
                                ),
                            ),
                            Positioned(
                                top: 300,
                                right: 100,
                                child: CircleAvatar(
                                    radius: 200,
                                    backgroundColor: Colors.white.withValues(alpha: 0.1),
                                ),
                            ),
                            Positioned(
                                top: MediaQuery.sizeOf(context).height - 400,
                                right: -100,
                                child: CircleAvatar(
                                    radius: 300,
                                    backgroundColor: Colors.white.withValues(alpha: 0.1),
                                ),
                            ),
                        ],
                    ),
                ),
                child ?? const SizedBox(),
            ],
        );
    }
}