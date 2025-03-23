import 'package:flutter/material.dart';

class BtnTheme {
  static ButtonStyle primaryBtn({required EdgeInsets? padding}) {
    return ButtonStyle(
      backgroundColor: WidgetStateProperty.all(Color(0xFF4B8E4B)),
      foregroundColor: WidgetStateProperty.all(Color(0XFFFFFFFF)),
      textStyle: WidgetStateProperty.all(
        TextStyle(
          fontFamily: "Poppins",
          fontWeight: FontWeight.w400,
          fontSize: 16,
        ),
      ),
      padding: WidgetStateProperty.all(padding),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}

class OnboardingControls extends StatelessWidget {
  final bool isLastPage;
  final Function() onSkipPressed;
  final Function() onNextPressed;

  const OnboardingControls({
    super.key,
    required this.isLastPage,
    required this.onSkipPressed,
    required this.onNextPressed,
  });


  @override
  Widget build(BuildContext context) {
    if (isLastPage) {
      return SizedBox(
          width: MediaQuery.of(context).size.width * 0.9, 
          child: ElevatedButton(
            onPressed: onNextPressed,
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 12), 
              backgroundColor: Color(0xFF567CBD), 
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text(
              "Get Started",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        );
    }

    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
          SizedBox(
          width: MediaQuery.of(context).size.width * 0.9, // Tombol penuh mengikuti ukuran layar
          child: ElevatedButton(
            onPressed: onNextPressed,
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 12), 
              backgroundColor: Color(0xFF567CBD), 
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), 
              ),
            ),
            child: Text(
              "Next",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
        SizedBox(height: 3),
        TextButton(
          onPressed: onSkipPressed,
          child: Text(
            'Skip',
            style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: Color(0XFF0E110E),
                        overflow: TextOverflow.ellipsis,
                      ),
          ),
        ),
      
        
      ],
    );
  }
}
