import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velokids/view/utils/export_utils.dart';

class CommonButton extends StatelessWidget {
  CommonButton({
    required this.type,
    required this.onPressed,
  });

  int type;
  Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
        width: 53.w,
        height: 5.4.h,
        decoration: BoxDecoration(
          color: type == 3 ? AppColors.neutral0 : AppColors.primary100,
          border: Border.all(
            color: type == 3 ? AppColors.error100 : AppColors.neutral0,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            type == 1
                ? const SizedBox()
                : type == 2
                    ? Padding(
                        padding: EdgeInsets.only(right: 3.w),
                        child: Icon(
                          Icons.download,
                          size: 3.2.h,
                          color: AppColors.neutral0,
                        ),
                      )
                    : Padding(
                        padding: EdgeInsets.only(right: 3.w),
                        child: Icon(
                          Icons.close,
                          size: 3.2.h,
                          color: AppColors.error100,
                        ),
                      ),
            type == 1
                ? const Text('HISTÓRICO').button(AppColors.neutral0)
                : type == 2
                    ? const Text('BAIXAR NOTA FISCAL')
                        .button(AppColors.neutral0)
                    : const Text('CANCELAR SERVIÇO').button(AppColors.error100),
          ],
        ),
      ),
    );
  }
}
