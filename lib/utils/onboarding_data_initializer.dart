import 'package:cloud_firestore/cloud_firestore.dart';

class OnboardingDataInitializer {
  static Future<void> addOnboardingPages() async {
    CollectionReference onboarding =
        FirebaseFirestore.instance.collection("onboarding_pages");

    // Collection da allaqachon ma'lumotlar mavjudligini tekshirish
    final snapshot = await onboarding.limit(1).get();
    if (snapshot.docs.isNotEmpty) {
      print("Onboarding pages allaqachon mavjud!");
      return;
    }

    // Ma'lumotlarni qo'shish
    await onboarding.doc("doc1").set({
      "title": "Nearby restaurants",
      "description":
          "You don't have to go far to find a good restaurant. We have provided all the restaurants that is near you",
      "svg_asset": "assets/svgs/location.svg",
    });

    await onboarding.doc("doc2").set({
      "title": "Select the Favorites Menu",
      "description":
          "Now eat well, don't leave the house. You can choose your favorite food only with one click",
      "svg_asset": "assets/svgs/order.svg",
    });

    await onboarding.doc("doc3").set({
      "title": "Good food at a cheap price",
      "description":
          "You can eat at expensive restaurants with affordable price",
      "svg_asset": "assets/svgs/food.svg",
    });

    print("Onboarding pages added successfully!");
  }
}