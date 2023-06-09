import 'package:flutter/material.dart';


void main() {
  runApp(const SegmentedButtonApp());
}

class SegmentedButtonApp extends StatefulWidget {
  const SegmentedButtonApp({super.key});

  @override
  State<SegmentedButtonApp> createState() => _SegmentedButtonAppState();
}

class _SegmentedButtonAppState extends State<SegmentedButtonApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(useMaterial3: true),
      home:    Scaffold(
        appBar: AppBar(backgroundColor: Colors.white,elevation: 0,),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(flex: 1,
                child:Column(
                  children: [
                    Text('Single choice',style: TextStyle(color: Colors.red,fontSize: 18,fontWeight: FontWeight.bold),),
                    SizedBox(height: 10),
                    CategoryWidget(),
                  ],
                )

                ,),
              Expanded(flex: 2,
                child:Column(
                  children: [
                    Text('Multiple choice',style: TextStyle(color: Colors.blue,fontSize: 18,fontWeight: FontWeight.bold),),
                    SizedBox(height: 10),
                    MultipleChoice(),
                  ],
                )

                ,),

            ],
          ),
        ),
      ),
    );
  }
}


enum Category { shirt, short, pants, dress }
class CategoryWidget extends StatefulWidget {
  const CategoryWidget({super.key});

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}
class _CategoryWidgetState extends State<CategoryWidget> {
  Category selectedItem=Category.shirt;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SegmentedButton(
          segments: const[
            ButtonSegment(value: Category.shirt,icon: Icon(Icons.accessibility_new_sharp),label: Text('shirt',style:TextStyle(color: Colors.blue,fontSize: 12,fontWeight: FontWeight.bold))),
            ButtonSegment(value: Category.short,icon: Icon(Icons.ac_unit),label: Text('short',style:TextStyle(color: Colors.blue,fontSize: 12,fontWeight: FontWeight.bold))),
            ButtonSegment(value: Category.pants,icon: Icon(Icons.abc_sharp),label: Text('pants',style:TextStyle(color: Colors.blue,fontSize: 12,fontWeight: FontWeight.bold))),
            ButtonSegment(value: Category.dress,icon: Icon(Icons.girl),label: Text('dress',style:TextStyle(color: Colors.blue,fontSize: 12,fontWeight: FontWeight.bold))),
          ],
          selected: {selectedItem},
          onSelectionChanged: (item){setState(() {selectedItem=item.first;});},
          selectedIcon: const Icon(Icons.done_outline_rounded,color: Colors.blue,),

          style: ButtonStyle(
            iconColor:MaterialStateProperty.all(Colors.red),
            shape:MaterialStateProperty.all(  RoundedRectangleBorder(borderRadius: BorderRadius.circular(40))),
            side: MaterialStateProperty.all(const BorderSide(color: Colors.red,width: 1,style: BorderStyle.solid)),

          ),
        ),

        Text(selectedItem.toString(),style: TextStyle(fontSize: 14),)
      ],
    );
  }
}
enum Sizes { extraSmall, small, medium, large, extraLarge }
class MultipleChoice extends StatefulWidget {
  const MultipleChoice({super.key});

  @override
  State<MultipleChoice> createState() => _MultipleChoiceState();
}
class _MultipleChoiceState extends State<MultipleChoice> {
  Set<Sizes> selection = {Sizes.large};
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SegmentedButton(
          segments: const [
            ButtonSegment(value: Sizes.extraSmall, label: Text('XS',style:TextStyle(color: Colors.blue,fontSize: 12,fontWeight: FontWeight.bold))),
            ButtonSegment(value: Sizes.small, label: Text('S',style:TextStyle(color: Colors.blue,fontSize: 12,fontWeight: FontWeight.bold))),
            ButtonSegment(value: Sizes.medium, label: Text('M',style:TextStyle(color: Colors.blue,fontSize: 12,fontWeight: FontWeight.bold))),
            ButtonSegment(value: Sizes.large, label: Text('L',style:TextStyle(color: Colors.blue,fontSize: 12,fontWeight: FontWeight.bold)),),
            ButtonSegment(value: Sizes.extraLarge, label: Text('XL',style:TextStyle(color: Colors.blue,fontSize: 12,fontWeight: FontWeight.bold))),
          ],
          selected: selection,
          onSelectionChanged: ( newSelection) { setState(() {selection = newSelection; }); },
          multiSelectionEnabled: true,
          emptySelectionAllowed: true,
          selectedIcon: const Icon(Icons.done,color: Colors.blue,),

          style: ButtonStyle(
            iconColor:MaterialStateProperty.all(Colors.red),
            shape:MaterialStateProperty.all(  RoundedRectangleBorder(borderRadius: BorderRadius.circular(40))),
            side: MaterialStateProperty.all(const BorderSide(color: Colors.blue,width: 1,style: BorderStyle.solid)),

          ),

        ),

        SizedBox(height: 20,),

        Column(
          children: selection.map((item) =>  Text(item.toString(),style: TextStyle(fontSize: 14),)).toList(),
        )
      ],
    );
  }
}


