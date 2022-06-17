import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:siyu_shopping/pages/modules/model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: _height,
          width: _width,
          color: Colors.grey[200],
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _appBarWidget(),
                const SizedBox(
                  height: 10,
                ),
                _headingText(),
                const SizedBox(
                  height: 20,
                ),
                _searchBoxWidget(_width),
                const SizedBox(
                  height: 20,
                ),
                _mainDressCategoryList(),
                const SizedBox(
                  height: 25,
                ),
                _subHeadingWidget(),
                const SizedBox(
                  height: 20,
                ),
                _mainDressWidget(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        height: 60.0,
        items: const <Widget>[
          Icon(Icons.home, size: 30),
          Icon(Icons.shopping_basket, size: 30),
          Icon(Icons.heart_broken, size: 30),
          Icon(Icons.currency_rupee, size: 30),
          Icon(Icons.perm_identity, size: 30),
        ],
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        backgroundColor: AppModel.primaryColor,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
        letIndexChange: (index) => true,
      ),
    );
  }

  Padding _mainDressWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Wrap(
        children: [
          _dressMiniWidget(
            "assets/images/product_0.png",
            Colors.grey,
            "Long Sleeve Shirt",
            "\$165",
          ),
          _dressMiniWidget(
            "assets/images/product_1.png",
            Colors.grey,
            "Casual Henley Shirt",
            "\$275",
          ),
          _dressMiniWidget(
            "assets/images/product_2.png",
            Colors.grey,
            "Curved Hem Shirt",
            "\$105",
          ),
          _dressMiniWidget(
            "assets/images/product_3.png",
            Colors.grey,
            "Casual Nolin",
            "\335",
          ),
        ],
      ),
    );
  }

  Padding _dressMiniWidget(image, color, name, price) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      child: Container(
        height: 250,
        width: 160,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 180,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: color, borderRadius: BorderRadius.circular(10)),
              child: Image.asset(
                image,
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            Row(
              children: [
                SizedBox(
                  width: 100,
                  child: Text(
                    name,
                    // overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  price,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Padding _subHeadingWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "New Arrival",
            style: AppModel.headingText
                .copyWith(fontSize: 25, fontWeight: FontWeight.w500),
          ),
          const Text(
            "See All",
            style: TextStyle(color: Colors.grey),
          )
        ],
      ),
    );
  }

  Padding _mainDressCategoryList() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _dressMiniCategory("assets/icons/dress.svg", "Dress"),
            _dressMiniCategory("assets/icons/shirt.svg", "Shirt"),
            _dressMiniCategory("assets/icons/pants.svg", "Pants"),
            _dressMiniCategory("assets/icons/Tshirt.svg", "Tshirt"),
          ],
        ),
      ),
    );
  }

  Padding _dressMiniCategory(image, name) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        height: 80,
        width: 80,
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(image),
            const SizedBox(
              height: 8,
            ),
            Text(name)
          ],
        ),
      ),
    );
  }

  Padding _searchBoxWidget(double _width) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: _width * 0.04),
      child: Container(
        height: 55,
        padding: const EdgeInsets.only(left: 20, top: 2, bottom: 2, right: 5),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  "assets/icons/Search.svg",
                  height: 20,
                ),
                Text(
                  "  Search items...",
                  style: TextStyle(color: Colors.grey[800]),
                ),
              ],
            ),
            Container(
              height: 40,
              width: 40,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: AppModel.primaryColor,
                  borderRadius: BorderRadius.circular(10)),
              child: SvgPicture.asset(
                "assets/icons/Filter.svg",
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding _headingText() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Explore",
            style: AppModel.headingText.copyWith(fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            "best Outfits for you",
            style: TextStyle(color: Colors.grey, fontSize: 20),
          )
        ],
      ),
    );
  }

  Padding _appBarWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset("assets/icons/menu.svg"),
          Row(
            children: [
              SvgPicture.asset("assets/icons/Location.svg"),
              Text(" 15/3, New Texas"),
            ],
          ),
          SvgPicture.asset("assets/icons/Notification.svg"),
        ],
      ),
    );
  }
}
