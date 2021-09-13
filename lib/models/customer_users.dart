class CustomerUsers{
  int id;
  String name;
  String create_date;
  String email;
  String email_confirm_code;
  String phone;
  String phone_confirm_code;
  int address_id;
  int language_id;

  CustomerUsers(
      this.id,
      this.name,
      this.create_date,
      this.email,
      this.email_confirm_code,
      this.phone,
      this.phone_confirm_code,
      this.address_id,
      this.language_id
  );
}