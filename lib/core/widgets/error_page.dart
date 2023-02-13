import 'package:flutter/material.dart';
import 'package:starter_temp/core/utils/media_query_values.dart';

import '../utils/color_manager.dart';

class ErrorView extends StatelessWidget {
  final VoidCallback? onPress;
  const ErrorView({Key? key, this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Icon(
            Icons.warning_amber_rounded,
            color: theme.primary,
            size: 150,
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 12),
          child: Text(
            'something went wrong',
            style: TextStyle(
                color: theme.onBackground,
                fontSize: 20,
                fontWeight: FontWeight.w700),
          ),
        ),
        Text(
          'try again',
          style: TextStyle(
              color: theme.onBackground,
              fontSize: 18,
              fontWeight: FontWeight.w500),
        ),
        Container(
          height: 55,
          width: context.width * 0.55,
          margin: const EdgeInsets.symmetric(vertical: 15),
          child: ElevatedButton(
            // style: ElevatedButton.styleFrom(
            //     backgroundColor: theme.onBackground,
            //     foregroundColor: Theme.of(context).primaryColor,
            //     elevation: 500,
            //     shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(50))),
            child: const Text(
              'reload screen',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
            ),
            onPressed: () {
              if (onPress != null) {
                onPress!();
              }
            },
          ),
        )
      ],
    );
  }
}
