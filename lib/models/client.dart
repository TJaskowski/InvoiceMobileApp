class Client {
  String name;
  String address;
  String city;
  String? zipCode;
  String country;
  String? email;
  String? phone;

  Client({
    required this.name,
    required this.address,
    required this.city,
    zipCode,
    required this.country,
    email,
    phone,
  });

 Client copyWith({
    String? name,

    String? address,
    String? city,
    String? zipCode,
    String? country,
    String? email,
    String? phone,
  }) {
    return Client(
      name: name ?? this.name,
      address: address ?? this.address,
      city: city ?? this.city,
      zipCode: zipCode ?? this.zipCode,
      country: country ?? this.country,
      email: email ?? this.email,
      phone: phone ?? this.phone,
    );
  }
}