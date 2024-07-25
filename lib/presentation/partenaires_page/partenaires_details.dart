import 'package:elbara_express/core/app_export.dart';
import 'package:elbara_express/core/utils/image_constant.dart';
import 'package:elbara_express/core/utils/size_utils.dart';
import 'package:elbara_express/presentation/partenaires_page/models/partenaires_item_model.dart';
import 'package:elbara_express/theme/app_style.dart';
import 'package:elbara_express/widgets/app_bar/appbar_image.dart';
import 'package:elbara_express/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:elbara_express/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:url_launcher/url_launcher.dart';

class PartenaireDetailsPage extends StatelessWidget {
  final Partenaires courierService;

  const PartenaireDetailsPage({Key? key, required this.courierService}) : super(key: key);

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  
  // Function to launch phone call
  void _launchPhone(String? phoneNumber) async {
    if (phoneNumber != null && phoneNumber.isNotEmpty) {
      final url = 'tel:$phoneNumber';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }
  }

  // Function to launch email
  void _launchEmail(String? email) async {
    if (email != null && email.isNotEmpty) {
      final url = 'mailto:$email';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }
  }

  // Function to launch website
  void _launchWebsite(String? url) async {
    if (url != null && url.isNotEmpty) {
      // Ensure URL has a proper scheme
      if (!url.startsWith('http://') && !url.startsWith('https://')) {
        url = 'http://$url';
      }
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
                    height: getVerticalSize(79),
                    leadingWidth: 42,
                    leading: AppbarImage(
                        height: getSize(24),
                        width: getSize(24),
                        svgPath: ImageConstant.imgArrowleft,
                        margin: getMargin(left: 18, top: 29, bottom: 26),
                        onTap: () {
                          onTapArrowleft22();
                        }),
                    centerTitle: true,
                    title: AppbarSubtitle1(text: "Details du Partenaire"),
                    
                    styleType: Style.bgFillWhiteA700),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Ligne avec l'icône et le nom du logo
            Row(
              children: [
                Image.network(
                  courierService.icon ?? '',
                  height: 80,
                  width: 80,
                  fit: BoxFit.cover,
                ),
                SizedBox(width: 10),

                Text(
                  courierService.nom ?? 'Nom du Partenaire',
                  maxLines: null,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtSFProTextBold22.copyWith(
                    color: ColorConstant.bleuElbara, // Appliquer la couleur ici
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),

            // Description
            Text(
              'Description',
              style: AppStyle.txtSubheadline,
            ),
            SizedBox(height: 8),
            Text(
              courierService.description ?? 'Aucune description disponible',
              style: AppStyle.txtSFProTextRegular17,
              
            ),

            
            SizedBox(height: 16),
            // Images
            Wrap(
              spacing: 8.0, // Espacement entre les éléments
              runSpacing: 8.0, // Espacement entre les lignes
              children: courierService.images!.map((image) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PhotoViewGalleryScreen(images: courierService.images ?? []),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 4,
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          image: NetworkImage(image), // Utilisation de NetworkImage pour les images depuis Firebase
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 18),
            // Contact Information
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                
                Expanded(
                  child: Column(
                    children: [
                      
                      GestureDetector(
                        onTap: () {
                          _launchPhone(courierService.contact);
                        },
                        child: Icon(Icons.phone),
                      ),
                      Text(
                        courierService.contact ?? '',
                        style: AppStyle.txtOutfitRegular14,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          _launchEmail(courierService.email);
                        },
                        child: Icon(Icons.email),
                      ),
                      Text(
                        courierService.email ?? '',
                        style: AppStyle.txtOutfitRegular14,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          _launchWebsite(courierService.webSite);
                        },
                        child: Icon(Icons.web),
                      ),
                      Text(
                        courierService.webSite ?? '',
                        style: AppStyle.txtOutfitRegular14,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 18),
            // Réseaux Sociaux
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Réseaux Sociaux',
                  style: AppStyle.txtSubheadline,
                ),
                SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    if (courierService.facebook != null)
                      IconButton(
                        icon: FaIcon(FontAwesomeIcons.facebook),
                        onPressed: () => _launchURL(courierService.facebook!),
                      ),
                    if (courierService.instagram != null)
                      IconButton(
                        icon: FaIcon(FontAwesomeIcons.instagram),
                        onPressed: () => _launchURL(courierService.instagram!),
                      ),
                    if (courierService.tiktok != null)
                      IconButton(
                        icon: FaIcon(FontAwesomeIcons.tiktok),
                        onPressed: () => _launchURL(courierService.tiktok!),
                      ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

onTapArrowleft22() {
    Get.back();
  }

class PhotoViewGalleryScreen extends StatelessWidget {
  final List<String> images;

  PhotoViewGalleryScreen({required this.images});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: PhotoViewGallery.builder(
        itemCount: images.length,
        builder: (context, index) {
          return PhotoViewGalleryPageOptions(
            imageProvider: NetworkImage(images[index]),
            minScale: PhotoViewComputedScale.contained * 0.8,
            maxScale: PhotoViewComputedScale.covered * 2,
          );
        },
        scrollPhysics: BouncingScrollPhysics(),
        backgroundDecoration: BoxDecoration(
          color: Colors.black,
        ),
      ),
    );
  }
}
