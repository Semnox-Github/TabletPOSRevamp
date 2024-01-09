import 'package:flutter/cupertino.dart';

class ProductMenu extends StatelessWidget {
  const ProductMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: (1 / .2),
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                crossAxisCount:
                    (MediaQuery.of(context).orientation == Orientation.portrait)
                        ? 2
                        : 2),
            itemCount: 8,
            itemBuilder: (BuildContext context, int index) {
              return PhysicalModel(
                color: Color(0xffEDEFF7),
                elevation: 3,
                shadowColor: Color(0xffBBBCC1),
                borderRadius: BorderRadius.circular(8),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 18, 0, 0),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Chicken Overloaded',
                            style: TextStyle(
                                fontSize: 26,
                                fontFamily: 'RobotoCondensed',
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 7),
                          Text(
                            'Medium -  12.00',
                            style: TextStyle(
                                fontSize: 19,
                                fontFamily: 'RobotoCondensed',
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 8, 8, 0),
                        child: Image.asset(
                          'assets/Offers Icon 24@3x.png',
                          width: 20,
                          height: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
