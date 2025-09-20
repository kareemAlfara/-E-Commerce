part of 'checkup_cubit.dart';

class CheckupState extends Equatable {
  final int index;         // الخطوة الحالية
  final int paymentIndex;  // اختيار الدفع
final bool  issaveaddreess;
final bool isDefultCard;
  const CheckupState({
    required this.index,
    required this.paymentIndex,
    required this.issaveaddreess,
    required this.isDefultCard,

    
  });

  CheckupState copyWith({
    int? index,
    int? paymentIndex,
    bool ? issaveaddreess,
    bool ? isDefultCard
  }) {
    return CheckupState(
      index: index ?? this.index,
      paymentIndex: paymentIndex ?? this.paymentIndex,
      issaveaddreess: issaveaddreess??this.issaveaddreess,
      isDefultCard: isDefultCard??this.isDefultCard
    );
  }

  @override
  List<Object?> get props => [index, paymentIndex,issaveaddreess,isDefultCard];
}

class CheckupInitial extends CheckupState {
  const CheckupInitial() : super(index: 0, paymentIndex: -1, issaveaddreess: false, isDefultCard: false);
}
