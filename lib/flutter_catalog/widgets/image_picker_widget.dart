/*import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ImagePickerWidget extends StatefulWidget {
  ImagePickerWidget({Key? key}) : super(key: key);

  @override
  State<ImagePickerWidget> createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }

    late File image;
    bool _uploading = false;
    final picker = ImagePicker();

    Future getImage() async {
        final pickedFile = await picker.getImage(source: ImageSource.gallery);

        setState((){
        if(pickedFile != null) {
            image = File(pickedFile.path);
        }
        else{
            print('No image selected. ');
        }
        });
    }
}
@override
Widget build(BuildContext context) {
    
    var _provider = Provider.of<CategoryProvider>(context);
//image upload to storage
    Future<String> uploadFile() async {
        File file= File(_image.path);
        String imageName = 'productImage/${DateTime.now().microsecondsSinceEpoch}';
        String downloadUrl;
        try {
            await FirebaseStorage.instance.ref('imageName').putFile(file);
            if(downloadUrl!=null){
                setstate(() {
                    _image=null;
                    _provider.getImage(downloadUrl);
                });
            }
        } 
        on Firebase Exception catch (e) {
            // e.g, e.code == 'canceled"
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                    content: Text("Cancelled"),
                ), // SnackBar
            );
        }
    }
    return ;
}
return Dialog(
    child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
            AppBar(
                elevation: 1,
                backgroundColor: Colors.white,
                iconTheme: IconTheme Data(color: Colors.black),
                title: Text('Upload images',
                    style: TextStyle(color:Colors.black)
                )
            ) // AppBar
            Padding(
                padding: const EdgeInsects.all(10.0),
                child:Column(
                    children: [
                        Stack(
                            children: [
                                if(_image!=null)
                            
                                Positioned(
                                    right: 0,
                                    child: IconButton(
                                        icon: Icon(Icons.clear),
                                        onPressed: (){
                                            setState(() {
                                                _image=null;
                                            });
                                        },
                                    ), // IconButton
                                ), // Positioned
                                Container(
                                    height:120,
                                    width: MediaQuery.of(context).size.width,
                                    child: FittedBox(
                                        child: _image == null ? Icon(
                                           CupertinoIcons.photo_on_rectangle,
                                           color: Colors.grey,
                                           ): Image.file(_image),// Icon
                                    ), // FittedBox
                                ), // Container
                                SizedBox(
                                    height: 20,
                                ),
                                if(_provider.urlList.length>0)
                                Container(
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade300,
                                            borderRadius: BorderRadius.circular(4)
                                    ), // BoxDecoration
                                    child: GalleryImage(
                                        imageurls: _provider.urlList, // need a list of image url for this.
                                    ),
                                ),
                                SizedBox(
                                    height: 20,
                                ),
                                if(_image!=null)
                                Row(
                                    children: [
                                        Expanded(
                                            child: NeumorphicButton(
                                                style: NeumorphicStyle(
                                                    color: Colors.green),
                                                    onPressed: (){
                                                        setState(() {
                                                            _uploading=true;
                                                            uploadFile().then((url){ 
                                                                if(url!=null){
                                                                    setState((){
                                                                        _uploading = false;
                                                                    });
                                                                }
                                                            });
                                                        }),
                                                    };
                                                    child: Text(
                                                        'Save' ,
                                                        textAlign: TextAlign.center,),
                                                       
                                            ), // NeumorphicButton
                                        ), // Expanded
                                        SizedBox(
                                            width: 10,
                                        ),
                                        Expanded(
                                            child: NeumorphicButton(
                                                style: NeumorphicStyle(color: Colors.red),
                                                    onPressed: (){},
                                                    child: Text('Cancel' ,textAlign: TextAlign.center,),
                                            ), // NeumorphicButton
                                        ),
                                    ],
                                ), // Row
                                 
                                SizedBox(
                                    height: 20,
                                ), // SizedBox

                                Row(
                                    children: [
                                        Expanded(
                                            child: NeumorphicButton(
                                                onPressed: (){},
                                                style: Neumorphicstyle(
                                                    color: Theme.of(context).primaryColor),
                                                    child: Text(
                                                        _provider.urlList.length>0 ? 'Upload more images' : 'Upload image' ,
                                                        textAlign: TextAlign.center,
                                                        style: Textstyle(color: Colors.white ),
                                                    ),//Text
                                            ), //NeumorphicButton
                                        ), //Expanded
                                    ],
                                ), //Row
                                SizedBox(height: 20,),
                                if(_uploading)
                                CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimated<Color>(Theme.of(context).primryColor),
                                )
                            ],
                        ),
                    ],
                ),
            ),
        ],
    ),
),
}
}
*/