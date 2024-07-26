class RecentlyShipped{

  final String orderID;
  final String status;
  final String name;
  final String typeServive;
  final String typeColis;

  final String typeEngin;
  final String depart;
  final String destination;
  final DateTime date;  
  final DateTime dateRecup;  
  final String docID;
  final int cout;
  final String modePayment;
  final String payemenStatus;

  final String montantRecevoir;
  final bool recevoirArgent;
  final String modePaiement;
  final String numeroDeReception;

  final String deliveryID;




  const RecentlyShipped({
    required this.docID,
    required this.typeColis,
    required this.typeServive,
    required this.orderID,
    required this.dateRecup,

    required this.status,
    required this.name,
    required this.date,
    required this.typeEngin,
    required this.depart,
    required this.destination,
    required this.payemenStatus,
    required this.cout,
    required this.modePayment,
    
    required this.deliveryID,


    required this.recevoirArgent,
    required this.modePaiement,
    required this.numeroDeReception,
    required this.montantRecevoir,

  });
  
}