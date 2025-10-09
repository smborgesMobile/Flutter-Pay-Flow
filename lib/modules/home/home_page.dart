import 'package:flutter/material.dart';
import 'package:learning_project/modules/bill_extract/bill_extract_page.dart';
import 'package:learning_project/modules/home/home_controller.dart';
import 'package:learning_project/modules/invoice/invoice_page.dart';
import 'package:learning_project/shared/models/user_model.dart';
import 'package:learning_project/shared/themes/app_colors.dart';
import 'package:learning_project/shared/themes/app_text_styles.dart';
import 'package:learning_project/shared/widgets/profile_image/profile_image_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  UserModel? user;
  final homeController = HomeController();
  final pages = [InvoicePage(), BillExtractPage()];

  @override
  void initState() {
    super.initState();
    _loadCurrentUser();
  }

  Future<void> _loadCurrentUser() async {
    user = await homeController.currentUser(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120),
        child: Container(
          height: 120,
          color: AppColors.primary,
          child: Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Center(
              child: ListTile(
                title: Text.rich(
                  TextSpan(
                    text: "Olá, ",
                    style: TextStyles.titleRegular,
                    children: [
                      TextSpan(
                        text: user?.name ?? "Avatar",
                        style: TextStyles.titleBoldBackground,
                      ),
                    ],
                  ),
                ),
                subtitle: Text(
                  "Mantenha suas contas em dia",
                  style: TextStyles.captionShape,
                ),
                trailing: ProfileImageWidget(
                  imageUrl: user?.photoUrl ?? "", // URL da imagem
                  width: 48,
                  height: 48,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ),
      body: Stack(children: [pages[homeController.currentPage]]),
      bottomNavigationBar: SafeArea(
        top: false,
        child: SizedBox(
          height: 90,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {
                  homeController.setPage(0);
                  setState(() {});
                },
                icon: const Icon(Icons.home),
                color: homeController.currentPage == 0
                    ? AppColors.primary
                    : AppColors.stroke,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "/barcode_scanner");
                },
                child: Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Icon(Icons.add_outlined, color: AppColors.background),
                ),
              ),
              IconButton(
                onPressed: () {
                  homeController.setPage(1);
                  setState(() {});
                },
                icon: const Icon(Icons.description_outlined),
                color: homeController.currentPage == 1
                    ? AppColors.primary
                    : AppColors.stroke,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
