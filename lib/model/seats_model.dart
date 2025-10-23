import 'package:tickets_demo/core/enums/seats_status.dart';

class SeatsModel {
  final int id;
  SeatsStatus status;
  SeatsModel({
    required this.id,
    this.status = SeatsStatus.available,
  });
}
