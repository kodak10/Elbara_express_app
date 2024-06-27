class RecentlyShipped{

  final String orderID;
  final String status;
  final String name;
  final String typCourse;
  final String typeEngin;
  final String depart;
  final String destination;
  final DateTime date;
  final String docID;
  final int cout;
  final String modePayment;
  final String payemenStatus;





  const RecentlyShipped({
    required this.docID,
    required this.orderID,
    required this.status,
    required this.name,
    required this.date,
    required this.typCourse,
    required this.typeEngin,
    required this.depart,
    required this.destination,
    required this.payemenStatus,
    required this.cout,
    required this.modePayment,

  });
  
}