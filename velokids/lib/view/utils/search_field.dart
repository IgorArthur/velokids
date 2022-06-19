import 'package:flutter/material.dart';
import 'package:velokids/view/utils/export_utils.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
    required this.notifier,
    required this.onPressed,
  }) : super(key: key);

  final ValueNotifier<String> notifier;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 76.w,
      height: 4.7.h,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.neutral100),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextFormField(
        onChanged: (String value) {
          notifier.value = value;
        },
        decoration: InputDecoration(
          enabledBorder: InputBorder.none,
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          contentPadding: EdgeInsets.only(left: 3.w, bottom: 1.h),
          hintText: 'Pesquisar',
          hintStyle: const TextStyle(
            color: AppColors.neutral100,
            fontSize: 12,
          ),
          suffixIcon: TextButton(
            onPressed: onPressed,
            child: Icon(
              Icons.search,
              size: 4.w,
              color: AppColors.primary100,
            ),
          ),
        ),
        style: const TextStyle(
          color: AppColors.neutral200,
          fontSize: 12,
        ),
        cursorColor: AppColors.neutral100,
      ),
    );
  }
}
