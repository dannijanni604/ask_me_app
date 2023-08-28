import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class SearchField extends StatelessWidget {
  final TextEditingController? textEditingController;
  final VoidCallback? onTap;

  // ignore: prefer_typing_uninitialized_variables
  var color;

  SearchField({
    Key? key,
    this.color,
    this.textEditingController,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _searchTextField();
  }

  Widget _searchTextField() {
    return Container(
      margin: const EdgeInsets.only(bottom: 0, left: 4, right: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 8),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(.2),
                      offset: const Offset(0.0, 0.50),
                      spreadRadius: 1,
                      blurRadius: 1,
                    )
                  ]),
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(width: 20.w),
                      Expanded(
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxHeight: 50),
                          child: Scrollbar(
                            child: TextFormField(
                              style: const TextStyle(fontSize: 14),
                              controller: textEditingController,
                              maxLines: null,
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Ask Me Something..."),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 5),
          InkWell(
            borderRadius: BorderRadius.circular(40.r),
            onTap: onTap,
            child: Container(
              decoration: BoxDecoration(
                  color: color, borderRadius: BorderRadius.circular(40.r)),
              padding: EdgeInsets.all(12.r),
              child: const Icon(
                Icons.send,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(width: 6)
        ],
      ),
    );
  }
}
