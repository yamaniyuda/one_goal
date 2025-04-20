import 'package:flutter/material.dart';

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
              "Masuk",
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
              "Lanjutkan",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
        SizedBox(height: 3),
        
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.9, // Tombol penuh mengikuti ukuran layar
          child: OutlinedButton(
                onPressed: onSkipPressed,
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Color(0xFF567CBD)), // Border biru
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  "Skip",
                  style: TextStyle(color: Colors.blue), // Teks juga berwarna biru
                ),
              ),
        )
      
        
      ],
    );
  }
}
