class ProductCategories{
  int id;
  int branch_id;
  int main_id;
  int rank;
  String start_time;
  String end_time;
  int active_table;
  int active_take_away;
  int active_safe;
  int active_come_take;
  int product_id;
  String name_tr;
  String name_en;
  String name_nl;
  String name_de;
  String name_ar;
  String name_ru;
  String name_zh;
  String name_sp;
  String name_it;
  String name_pt;
  String name_ro;
  String name_fr;
  int is_delete;

  ProductCategories(
      this.id,
      this.branch_id,
      this.main_id,
      this.rank,
      this.start_time,
      this.end_time,
      this.active_table,
      this.active_take_away,
      this.active_safe,
      this.active_come_take,
      this.product_id,
      this.name_tr,
      this.name_en,
      this.name_nl,
      this.name_de,
      this.name_ar,
      this.name_ru,
      this.name_zh,
      this.name_sp,
      this.name_it,
      this.name_pt,
      this.name_ro,
      this.name_fr,
      this.is_delete);
}