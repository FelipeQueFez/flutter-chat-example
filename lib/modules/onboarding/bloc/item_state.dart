import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class ItemState extends Equatable {
  const ItemState();
}

class InitialItemState extends ItemState {
  @override
  List<Object> get props => [];
}

class ItemsLoaded extends ItemState {

  final List<dynamic> items;

  ItemsLoaded({@required this.items});

  @override
  List<Object> get props => [items];
}
