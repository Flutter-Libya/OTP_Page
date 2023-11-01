
class OtpPage extends StatelessWidget {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: OTPWidget(),
      ),
    );
  }
}

class OTPWidget extends StatelessWidget {
  const OTPWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final OTPController otpController = Get.put(OTPController());
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 176.61.w,
            height: 33.h,
            margin: EdgeInsets.only(bottom: 20.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'رقم غير صحيح؟',
                  style: TextStyle(
                    color: const Color(0xFF1A1C1E),
                    fontWeight: FontWeight.w600,
                    fontSize: 17.53.sp,
                  ),
                ),
                SizedBox(width: 8.w),
                Text(
                  'تعديل',
                  style: TextStyle(
                    fontSize: 19.59.sp,
                    color: const Color(0xFFDE4747),
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildOTPField(context, otpController.focusNode1,
                  otpController.focusNode2, otpController.isFocused1),
              buildOTPField(context, otpController.focusNode2,
                  otpController.focusNode3, otpController.isFocused2),
              buildOTPField(context, otpController.focusNode3,
                  otpController.focusNode4, otpController.isFocused3),
              buildOTPField(context, otpController.focusNode4, null,
                  otpController.isFocused4),
            ],
          ),
          SizedBox(height: 26.h),
          SizedBox(
            height: 12.h,
          ),
          CustomButtonTwo(
              width: 395.27.w,
              height: 59.7.h,
              borderRadius: 30.84.r,
              backgroundColor: Colors.red,
              text: "تأكيد",
              onPressed: () {},
              textStyle: TextStyle(
              
                fontSize: 20.85.sp,
                fontWeight: FontWeight.w500,
                color: kWhiteColor,
              )),
        ],
      ),
    );
  }

  TextSpan _buildTextSpan(String text, int color, TextStyle? textStyle) {
    return TextSpan(
      text: text,
      style: textStyle,
    );
  }

  Widget buildOTPField(BuildContext context, FocusNode focusNode,
      FocusNode? nextFocusNode, RxBool isFocused) {
    return Obx(
      () => Container(
        width: 75.27.w,
        height: 93.83.h,
        margin: EdgeInsets.symmetric(vertical: 5.h),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1.5.w,
              color: Color(
                isFocused.value ? 0xFFDE0F7E : 0xFFEAE8E8,
              ),
            ),
            borderRadius: BorderRadius.circular(12.37.r),
          ),
        ),
        child: Center(
          child: TextFormField(
            focusNode: focusNode,
            decoration: const InputDecoration(
              border: InputBorder.none,
              counterText: "",
            ),
            style: TextStyle(fontSize: 24.sp),
            textAlign: TextAlign.center,
            maxLength: 1,
            onChanged: (value) {
              if (value.length == 1 && nextFocusNode != null) {
                FocusScope.of(context).requestFocus(nextFocusNode);
              }
            },
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly,
            ],
          ),
        ),
      ),
    );
  }
}
