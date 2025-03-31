class Company {
  String?  name;
  String?  taxId;
  String?  address;
  String?  city;
  String?  zipCode;
  String?  country;
  String?  email;
  String?  phone;

  Company({
    this.name,
    this.taxId,
    this.address,
    this.city,
    this.zipCode,
    this.country,
    this.email,
    this.phone,
  });

  Company.copyWith({
    String? name,
    String? taxId,
    String? address,
    String? city,
    String? zipCode,
    String? country,
    String? email,
    String? phone,
  }) {
    this.name = name ?? this.name;
    this.taxId = taxId ?? this.taxId;
    this.address = address ?? this.address;
    this.city = city ?? this.city;
    this.zipCode = zipCode ?? this.zipCode;
    this.country = country ?? this.country;
    this.email = email ?? this.email;
    this.phone = phone ?? this.phone;
  }
}