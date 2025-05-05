class Appointment {
  final String? id;
  final String clinicName;
  final DateTime appointmentDate;
  final String reason;
  final PaymentDetails paymentDetails;

  Appointment({
    this.id,
    required this.clinicName,
    required this.appointmentDate,
    required this.reason,
    required this.paymentDetails,
  });

  factory Appointment.fromJson(Map json) {
    return Appointment(
      id: json['_id'],
      clinicName: json['clinicName'] ?? 'Check Up Clinic',
      appointmentDate: DateTime.parse(json['appointmentDate']),
      reason: json['reason'],
      paymentDetails: PaymentDetails.fromJson(json['paymentDetails']),
    );
  }

  Map toJson() {
    return {
      'clinicName': clinicName,
      'appointmentDate': appointmentDate.toIso8601String(),
      'reason': reason,
      'paymentDetails': paymentDetails.toJson(),
    };
  }
}

class PaymentDetails {
  final double consultation;
  final double adminFee;
  final double additionalDiscount;
  final double total;

  PaymentDetails({
    required this.consultation,
    required this.adminFee,
    required this.additionalDiscount,
    required this.total,
  });

  factory PaymentDetails.fromJson(Map json) {
    return PaymentDetails(
      consultation: json['consultation'].toDouble(),
      adminFee: json['adminFee'].toDouble(),
      additionalDiscount: json['additionalDiscount'].toDouble(),
      total: json['total'].toDouble(),
    );
  }

  Map toJson() {
    return {
      'consultation': consultation,
      'adminFee': adminFee,
      'additionalDiscount': additionalDiscount,
      'total': total,
    };
  }
}