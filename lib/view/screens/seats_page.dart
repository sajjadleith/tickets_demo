import 'package:flutter/material.dart';
import 'package:tickets_demo/core/enums/seats_status.dart';
import 'package:tickets_demo/core/theme_colors.dart';
import 'package:tickets_demo/model/seats_model.dart';

class SeatsPage
    extends
        StatefulWidget {
  final Function(
    int,
  )?
  onSelectionChanged;
  SeatsPage({
    Key? key,
    required this.onSelectionChanged,
  }) : super(
         key: key,
       );

  @override
  _SeatsPageState createState() => _SeatsPageState();
}

class _SeatsPageState
    extends
        State<
          SeatsPage
        > {
  late List<
    SeatsModel
  >
  seats;

  @override
  void initState() {
    super.initState();
    seats = List.generate(
      48,
      (
        i,
      ) {
        // أمثلة: خانات "فارغة" (مساحة) في منتصف الصفوف
        if ((i ==
                18) ||
            (i ==
                21))
          return SeatsModel(
            id: i,
            status: SeatsStatus.empty,
          );
        // بعض الخانات محجوزة (ممتلئة باللون الأحمر)
        if (i >=
                24 &&
            i <=
                31)
          return SeatsModel(
            id: i,
            status: SeatsStatus.reserved,
          );
        if (i >=
                32 &&
            i <=
                39)
          return SeatsModel(
            id: i,
            status: SeatsStatus.reserved,
          );
        // الباقي متاحة
        return SeatsModel(
          id: i,
          status: SeatsStatus.available,
        );
      },
    );
  }

  void _onSeatTap(
    int index,
  ) {
    final seat = seats[index];
    if (seat.status ==
        SeatsStatus.available) {
      seat.status = SeatsStatus.selected;
    } else if (seat.status ==
        SeatsStatus.selected) {
      seat.status = SeatsStatus.available;
    }
    final selectedCount = seats
        .where(
          (
            s,
          ) =>
              s.status ==
              SeatsStatus.selected,
        )
        .length;
    widget.onSelectionChanged?.call(
      selectedCount,
    );
    setState(
      () {},
    );
  }

  Color seatColor(
    SeatsStatus status,
  ) {
    switch (status) {
      case SeatsStatus.available:
        return Colors.transparent;
      case SeatsStatus.selected:
        return ThemeColors.secondaryColor;
      case SeatsStatus.reserved:
        return const Color(
          0xFFDF6A66,
        );
      case SeatsStatus.empty:
        return Colors.transparent;
    }
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return GridView.builder(
      itemCount: seats.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 8,
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
      ),
      itemBuilder:
          (
            context,
            index,
          ) {
            final seat = seats[index];
            return GestureDetector(
              onTap: () {
                if (seat.status !=
                        SeatsStatus.reserved &&
                    seat.status !=
                        SeatsStatus.empty) {
                  _onSeatTap(
                    index,
                  );
                }
              },
              child: AnimatedContainer(
                duration: Duration(
                  milliseconds: 150,
                ),
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                  color: seatColor(
                    seat.status,
                  ),
                  border:
                      (seat.status ==
                          SeatsStatus.available)
                      ? Border.all(
                          color: Colors.grey.withOpacity(
                            0.4,
                          ),
                          width: 1.5,
                        )
                      : null,
                ),
              ),
            );
          },
    );
  }
}
