import 'package:chefkart_task/Api/ApiWrapper.dart';
import 'package:chefkart_task/Api/Config.dart';
import 'package:chefkart_task/UI/dishes/model/dishes_detail_model.dart';
import 'package:chefkart_task/UI/dishes/model/dishes_model.dart';
import 'package:chefkart_task/helper/utils.dart';
import 'package:get/get.dart';

class DishesController extends GetxController{
  RxBool isDishesLoading = true.obs;
  Rx<DishesModel> dishesModel = DishesModel().obs;

  RxBool isDishesDetailLoading = true.obs;
  Rx<DishesDetailModel> dishesDetailModel = DishesDetailModel().obs;

  RxList<String> foodTypeList = <String>['italian', 'indian', 'indian', 'indian', 'indian', 'indian'].obs;
  RxInt selectedFoodTypeIndex = 0.obs;

  RxList<String> categoryList = <String>['Biryani', 'Chaval', 'Pizza', 'Noodles', 'Cheese', 'indian'].obs;
  RxInt selectedCategoryIndex = 0.obs;

  RxBool isShowRecommended = true.obs;
  RxBool isShowVegetables = true.obs;
  RxBool isShowSpices = true.obs;

  getDishes(){
    ApiWrapper.dataGet(Config.dishes).then((response) {
      if(response != null && response != ''){
        dishesModel.value = DishesModel.fromJson(response);
        isDishesLoading.value = false;
      }else{
        Utils.showToastMessage('Something wrong! please try after some time');
      }
    });
  }

  getDishesDetails({String? dishID}){
    ApiWrapper.dataGet('${Config.dishes}/$dishID').then((response) {
      if(response != null && response != ''){
        dishesDetailModel.value = DishesDetailModel.fromJson(response);
        isDishesDetailLoading.value = false;
      }else{
        Utils.showToastMessage('Something wrong! please try after some time');
      }
    });
  }
}