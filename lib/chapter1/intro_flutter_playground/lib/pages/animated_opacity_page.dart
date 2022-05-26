import 'dart:async';

import 'package:flutter/material.dart';

class AnimatedOpacityPage extends StatefulWidget {
  const AnimatedOpacityPage({Key? key}) : super(key: key);

  @override
  createState() => AnimatedOpacityPageState();
}

class AnimatedOpacityPageState extends State<AnimatedOpacityPage> {
  var _visible = true;
  var _loop = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedOpacity'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Opacity Animation Test',
              style: TextStyle(
                fontSize: 22,
              ),
            ),
            const SizedBox(height: 12),
            AnimatedOpacity(
              opacity: _visible ? 1.0 : 0.0,
              duration: const Duration(seconds: 1),
              curve: Curves.fastOutSlowIn,
              child: const FlutterLogo(size: 200),
              onEnd: () {
                if (_loop) {
                  var timer = Timer(
                    const Duration(seconds: 1),
                    () {
                      /// The loop could have been ended before the callback fired,
                      /// so we add this extra check to make sure.
                      if (_loop) {
                        setState(() {
                          _visible = !_visible;
                        });
                      }
                    },
                  );
                }
              },
            ),
            Padding(
              padding: const EdgeInsets.all(22.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _visible = !_visible;
                      });
                    },
                    child: const Text('Toggle'),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    child: _loop
                        ? const Text('Stop Loop')
                        : const Text('Start Loop'),
                    onPressed: () {
                      _loop = !_loop;
                      if (_loop) {
                        /// Trigger a change so the Opacity animation will fire, 
                        /// and the subsequent `onEnd` callback.
                        setState(() {
                          _visible = !_visible;
                        });
                      } else {
                        /// When stopping the loop we always want to end up 
                        /// showing the logo.
                        setState(() {
                          _visible = true;
                        });
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
