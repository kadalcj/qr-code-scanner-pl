class Ticket {
  int id;
  String name;
  String email;
  double price;
  String qrCode;
  bool isVip;
  bool productId;

  Ticket({this.id, this.name, this.email, this.price, this.qrCode, this.isVip, this.productId});

  factory Ticket.fromJson(Map<String, dynamic> json) {
    return Ticket(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      price: json['price'],
      qrCode: json['qr_code'],
      isVip: json['is_vip'],
      productId: json['product_id']
    );
  }
}

