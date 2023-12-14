import 'package:flutter/material.dart';

import '../constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.ontap,
    this.isLoading = false,
  });

  final void Function()? ontap;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        decoration: BoxDecoration(
          color: kPrimrey,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
            child: isLoading
                ? const CircularProgressIndicator()
                : const Text(
                    "Add",
                    style: const TextStyle(color: Colors.black),
                  )),
      ),
    );
  }
}
