import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../constants/constant_colors.dart';
import '../constants/constant_images.dart';
import '../constants/constant_integers.dart';
import '../constants/constant_variables.dart';

class HistoryTab extends StatefulWidget {
  const HistoryTab({super.key});

  @override
  HistoryTabScreen createState() => HistoryTabScreen();
}

class HistoryTabScreen extends State<HistoryTab> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: historyTabViewContent(),
      backgroundColor: ConstantColors.defaultDashBoardColour,
    );
  }

  Widget historyTab() {
    return Tab(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.history,
            size: ConstantIntegers.tabBarIcon,
            color: ConstantColors.tabBarIconsColor,
          ),
          Text(
            ConstantVariables.tabBarHistoryText,
            style: TextStyle(
              fontFamily: ConstantVariables.fontFamilyPoppins,
              fontSize: ConstantIntegers.tabBarText,
              fontWeight: FontWeight.bold,
              color: ConstantColors.tabBarIconsTextColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget historyTabViewContent() {
    return ListView(
      children: [
        SizedBox(height: ConstantIntegers.dateMarginBox),
        dateTimeRow(),
        const SizedBox(height: ConstantIntegers.historyCardPadding),
        historyCardContent(),
        SizedBox(height: ConstantIntegers.betweenCardPadding),
        historyCardContent(),
        SizedBox(height: ConstantIntegers.betweenCardPadding),
        historyCardContent(),
        SizedBox(height: ConstantIntegers.betweenCardPadding),
      ],
    );
  }

  Widget dateTimeRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const SizedBox(width: ConstantIntegers.dateMarginBoxLeft),
        dateTimeTextField(
          ConstantVariables.dateHintText,
          Icons.calendar_month,
          () => selectDate(context),
          dateController,
        ),
        const SizedBox(width: ConstantIntegers.dateMarginBoxMiddle),
        dateTimeTextField(
          ConstantVariables.labelSelectTimeText,
          Icons.timer_outlined,
          () => selectTime(context),
          timeController,
        ),
        const SizedBox(width: ConstantIntegers.dateMarginBoxRight),
      ],
    );
  }

  Widget dateTimeTextField(
    String hintText,
    IconData icon,
    Function onTap,
    TextEditingController controller,
  ) {
    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(),
        child: AbsorbPointer(
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(
                color: ConstantColors.historyTextFieldHintTextColor,
                fontFamily: ConstantVariables.fontFamilyPoppins,
              ),
              prefixIcon: Icon(
                icon,
                color: ConstantColors.historyTextFieldIconColor,
              ),
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ),
    );
  }

  void selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        dateController.text = DateFormat(ConstantVariables.dateFormatText).format(selectedDate!);
      });
    }
  }

  void selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
        timeController.text =
            "${picked.hour}:${picked.minute.toString().padLeft(2, '0')}";
      });
    }
  }

  Widget historyCardContent() {
    return Card(
      margin: const EdgeInsets.all(ConstantIntegers.historyCardMargin),
      elevation: ConstantIntegers.historyCardElevation,
      shadowColor: ConstantColors.historyCardShadowColor,
      color: ConstantColors.historyCardColor,
      child: historyCardUserContentColumn(),
    );
  }

  Widget historyCardUserContentColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        listTileUser(),
        Divider(),
        arrivalDeparture(),
        SizedBox(height: ConstantIntegers.departureBottomBox),
      ],
    );
  }

  Widget listTileUser() {
    return ListTile(
      leading: listTileLeadingContentUser(),
      title: listTileTitleContentUser(),
      subtitle: listTileSubtitleContentUser(),
    );
  }

  Widget listTileLeadingContentUser() {
    return CircleAvatar(
      backgroundColor: ConstantColors.historyListAvatarBackgroundColor,
      child: Icon(
        Icons.person,
        size: ConstantIntegers.historyPersonIconSize,
        color: ConstantColors.historyPersonIconColor,
      ),
    );
  }

  Widget listTileTitleContentUser() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          ConstantVariables.historyPersonNameText,
          style: TextStyle(
            color: ConstantColors.historyPersonNameTextColor,
            fontWeight: FontWeight.bold,
            fontFamily: ConstantVariables.fontFamilyPoppins,
            fontSize: ConstantIntegers.historyCardName,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            ConstantIntegers.starCountHistory,
            (index) => Icon(
              Icons.star,
              color: ConstantColors.profileStarsColor,
              size: ConstantIntegers.starIconSize,
            ),
          ),
        ),
      ],
    );
  }

  Widget listTileSubtitleContentUser() {
    return Text(
      ConstantVariables.historyCarNumberText,
      style: TextStyle(
        fontSize: ConstantIntegers.historyVehicleFontSize,
        fontFamily: ConstantVariables.fontFamilyPoppins,
        color: ConstantColors.historySubTitleTextColor,
      ),
    );
  }

  Widget arrivalDeparture() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(width: ConstantIntegers.linePadding),
        lineImageColumn(),
        SizedBox(width: ConstantIntegers.linePaddingWidth),
        Center(child: historyArrivalDepartureColumn()),
      ],
    );
  }

  Widget historyArrivalDepartureColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        arrivalDepartureText(ConstantVariables.distanceArrivalText),
        arrivalRow(),
        SizedBox(height: ConstantIntegers.arrivalDeparturePadding),
        arrivalDepartureText(ConstantVariables.distanceDepartureText),
        departureRow(),
      ],
    );
  }

  Widget arrivalDepartureText(String text) {
    return Text(
      text,
      style: TextStyle(
        color: ConstantColors.historyArrivalTextColor,
        fontWeight: FontWeight.bold,
        fontFamily: ConstantVariables.fontFamilyPoppins,
      ),
    );
  }

  Widget arrivalRow() {
    return Row(
      children: [
        calenderIcon(),
        dateText(),
        SizedBox(width: ConstantIntegers.dateTimePadding),
        timeIcon(),
        timeText(),
        SizedBox(width: ConstantIntegers.timePmPadding),
        pmText(),
      ],
    );
  }

  Widget calenderIcon() {
    return Icon(
      Icons.calendar_month,
      color: ConstantColors.historyCardCalenderIconColor,
    );
  }

  Widget dateText() {
    return Text(
      ConstantVariables.dateText,
      style: TextStyle(fontFamily: ConstantVariables.fontFamilyPoppins),
    );
  }

  Widget timeIcon() {
    return Icon(
      Icons.timer_outlined,
      color: ConstantColors.historyClockIconColor,
    );
  }

  Widget timeText() {
    return Text(
      ConstantVariables.timeText,
      style: TextStyle(
        color: ConstantColors.historyTimeTextColor,
        fontFamily: ConstantVariables.fontFamilyPoppins,
      ),
    );
  }

  Widget pmText() {
    return Text(
      ConstantVariables.hoursText,
      style: TextStyle(
        color: ConstantColors.historyHoursTextColor,
        fontFamily: ConstantVariables.fontFamilyPoppins,
      ),
    );
  }

  Widget departureRow() {
    return Row(
      children: [
        calenderIcon(),
        dateText(),
        SizedBox(width: ConstantIntegers.dateTimePadding),
        timeIcon(),
        timeText(),
        SizedBox(width: ConstantIntegers.timePmPadding),
        pmText(),
      ],
    );
  }

  Widget lineImageColumn() {
    return Column(children: [greyDotImage(), lineImage(), blackDotImage()]);
  }

  Widget greyDotImage() {
    return Image.asset(
      ConstantImages.assetImages + ConstantImages.ellipseLineImage,
    );
  }

  Widget lineImage() {
    return Image.asset(ConstantImages.assetImages + ConstantImages.line11Image);
  }

  Widget blackDotImage() {
    return Image.asset(
      ConstantImages.assetImages + ConstantImages.ellipseLineImage,
      color: ConstantColors.historyArrivalLineColor,
    );
  }
}
