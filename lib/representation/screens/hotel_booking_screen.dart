import 'package:flutter/cupertino.dart';
import 'package:travel_app/core/constants/dimension_constants.dart';
import 'package:travel_app/core/extentions/date_ext.dart';
import 'package:travel_app/core/helpers/asset_helper.dart';
import 'package:travel_app/representation/screens/guest_and_room_booking_screen.dart';
import 'package:travel_app/representation/screens/hotels_screen.dart';
import 'package:travel_app/representation/screens/select_date_screen.dart';
import 'package:travel_app/representation/widgets/app_bar_container.dart';
import 'package:travel_app/representation/widgets/buttom_widget.dart';
import 'package:travel_app/representation/widgets/item_booking_widget.dart';

class HotelBookingScreen extends StatefulWidget {
  const HotelBookingScreen({super.key, required this.nameDestination});
  static const String routeName = '/hotel_booking';
  final String? nameDestination;
  @override
  State<HotelBookingScreen> createState() => _HotelBookingScreenState();
}

class _HotelBookingScreenState extends State<HotelBookingScreen> {
  String? dateSelected;
  @override
  Widget build(BuildContext context) {
    return AppBarContinerWidget(
      titleString: "Hotel Booking",
      subTitleString: 'Choose your favorite hotel and enjoy the service',
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: kMediumPadding,
            ),
            ItemBookingWidget(
              icon: AssetHelper.icoLocation,
              title: "Discription",
              description: widget.nameDestination ?? 'Discription',
              onTap: () {},
            ),
            SizedBox(
              height: kMediumPadding,
            ),
            StatefulBuilder(builder: (context, setState) {
              // no chi render lai chill cua state nay
              return ItemBookingWidget(
                  icon: AssetHelper.icoLocation,
                  title: "Select Date",
                  description: dateSelected ?? '13 Feb - 18 Feb 2024',
                  onTap: () async {
                    final resul = await Navigator.of(context)
                        .pushNamed(SelectDateScreen.routeName);
                    if (!(resul as List<DateTime?>)
                        .any((element) => element == null)) {
                      dateSelected =
                          '${resul[0]?.getStartDate} - ${resul[1]?.getEndDate}';
                      setState(() {});
                    }
                  });
            }),
            SizedBox(
              height: kMediumPadding,
            ),
            ItemBookingWidget(
                icon: AssetHelper.icoLocation,
                title: "Guest and Room",
                description: "2 Guest, 1 Room",
                onTap: () {
                  Navigator.of(context)
                      .pushNamed(GuestAndRoomBookingScreen.routeName);
                }),
            SizedBox(
              height: kMediumPadding,
            ),
            ButtonWidget(
              title: "Search",
              ontap: () {
                Navigator.of(context).pushNamed(HotelsScreen.routeName);
              },
            )
          ],
        ),
      ),
    );
  }
}
