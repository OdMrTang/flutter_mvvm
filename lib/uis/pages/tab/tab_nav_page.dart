import 'package:jvtd_shop_client/commons/constants/index.dart';

List<Widget> pages = <Widget>[
  MainHomePage(),
  OrderHomePage(),
  CustomerServiceHomepage(),
  UserHomePage()
];

class TabNavigator extends StatefulWidget {
  TabNavigator({Key key}) : super(key: key);

  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  var _pageController = PageController();
  int _selectedIndex = 0;
  DateTime _lastPressed;

  @override
  void initState() {
    super.initState();

  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          if (_lastPressed == null ||
              DateTime.now().difference(_lastPressed) > Duration(seconds: 1)) {
            //两次点击间隔超过1秒则重新计时
            _lastPressed = DateTime.now();
            return false;
          }
          return true;
        },
        child: Stack(children: <Widget>[
          PageView.builder(
            itemBuilder: (ctx, index) => pages[index],
            itemCount: pages.length,
            controller: _pageController,
            physics: NeverScrollableScrollPhysics(),
            onPageChanged: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
          FutureBuilder(
            future: Wakelock.isEnabled,
            builder: (context, AsyncSnapshot<bool> snapshot) {
              // The use of FutureBuilder is necessary here to await the bool value from isEnabled.
              if (!snapshot.hasData)
                return Container(); // The Future is retrieved so fast that you will not be able to see any loading indicator.
              return Container();
            },
          )
        ]),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment_turned_in),
            title: Text("首页"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            title: Text("订单"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.desktop_mac),
            title: Text("客服"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text("我的"),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) {
          _pageController.jumpToPage(index);
        },
      ),
    );
  }
}
