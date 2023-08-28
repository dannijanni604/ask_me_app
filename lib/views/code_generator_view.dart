import 'package:ask_me/components/app_button.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_plus/share_plus.dart';
import '../components/app_snackbar.dart';
import '../core/app_apis.dart';

class CodeGeneratorView extends StatefulWidget {
  const CodeGeneratorView({super.key});
  @override
  State<CodeGeneratorView> createState() => _CodeGeneratorViewState();
}

bool isLoading = false;
String codeText = "";
TextEditingController language = TextEditingController();
TextEditingController problem = TextEditingController();

class _CodeGeneratorViewState extends State<CodeGeneratorView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Code generation")),
      body: ListView(
        primary: true,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: [
          const Text("Code Language"),
          SizedBox(height: 15.h),
          Row(
            children: [
              Container(
                width: 200.w,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.r)),
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 0),
                child: TextFormField(
                  controller: language,
                  decoration: const InputDecoration(
                      border: InputBorder.none, hintText: "Eg: Python"),
                ),
              ),
            ],
          ),
          SizedBox(height: 15.h),
          const Text("Problem"),
          SizedBox(height: 15.h),
          Row(
            children: [
              Container(
                width: 320.w,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.r)),
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 0),
                child: TextFormField(
                  controller: problem,
                  keyboardType: TextInputType.multiline,
                  minLines: 1,
                  maxLines: 5,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter your Code Query here"),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          AppButton(
            label: "Generate Code",
            onTap: () async {
              generateCode();
            },
          ),
          SizedBox(
            height: 20.h,
          ),
          if (isLoading)
            SizedBox(
                height: 200.h,
                child: const Center(child: CircularProgressIndicator())),
          if (!isLoading && codeText != "")
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        splashRadius: 20.r,
                        onPressed: () {
                          Clipboard.setData(ClipboardData(text: codeText));
                          sendAlert("Code copied successfully!");
                        },
                        icon: const Icon(Icons.copy)),
                    IconButton(
                        splashRadius: 20.r,
                        onPressed: () {
                          Share.share(codeText);
                        },
                        icon: const Icon(Icons.share))
                  ],
                ),
                Container(
                    padding: EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 10.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: Colors.white,
                        border: Border.all(color: Colors.grey.shade300)),
                    child: Text(codeText))
              ],
            )
        ],
      ),
    );
  }

  generateCode() async {
    if (language.text != "" && problem.text != "") {
      isLoading = true;
      setState(() {});
      String response = await ChatGptApi()
          .getMessageFromChatGPT("${problem.text} in ${language.text}");
      codeText = response;
      isLoading = false;
      setState(() {});
    }
  }

  Widget generateCodeButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.8),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(10.r),
            onTap: () async {
              generateCode();
            },
            child: Container(
                width: 170.w,
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Generate Code",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white),
                    )
                  ],
                )),
          ),
        ),
      ],
    );
  }
}
