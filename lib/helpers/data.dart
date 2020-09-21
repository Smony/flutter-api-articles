import 'package:backtotheroots/models/category_model.dart';

List<CategoryModel> getCategories() {

  List<CategoryModel> category = new List<CategoryModel>();
  CategoryModel categoryModel = new CategoryModel();

  categoryModel.name = "Summer";
  categoryModel.image = "https://images.unsplash.com/photo-1586934367569-3c7fa407e8f4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2102&q=80";
  category.add(categoryModel);

  categoryModel = new CategoryModel();

  categoryModel.name = "Traditions";
  categoryModel.image = "https://images.unsplash.com/photo-1545433463-ff5ca8db6c7a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2100&q=80";
  category.add(categoryModel);

  categoryModel = new CategoryModel();

  categoryModel.name = "Travel Tips";
  categoryModel.image = "https://images.unsplash.com/photo-1469854523086-cc02fe5d8800?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1908&q=80";
  category.add(categoryModel);

  categoryModel = new CategoryModel();

  categoryModel.name = "Traditions";
  categoryModel.image = "https://images.unsplash.com/photo-1545433463-ff5ca8db6c7a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2100&q=80";
  category.add(categoryModel);

  categoryModel = new CategoryModel();

  categoryModel.name = "Travel Tips";
  categoryModel.image = "https://images.unsplash.com/photo-1469854523086-cc02fe5d8800?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1908&q=80";
  category.add(categoryModel);

  categoryModel = new CategoryModel();

  return category;
}