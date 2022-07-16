import 'package:objectbox/objectbox.dart';


@Entity()
class DataModel{
  int? id;
  int? number;
  bool? done;
  String? title;
  String? tag;
  String? WithdrawOrDeposit;

  DataModel({
    this.id = 0,
    required this.number,
    required this.title,
    required this.done,
    required this.tag,
    required this.WithdrawOrDeposit,
  });
}