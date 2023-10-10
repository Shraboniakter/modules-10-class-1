import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo'),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        showModalBottomSheet(context: context, builder:(context){
          return AddNewTeskModal();
        });

      },
        child: Icon(Icons.add),),
      body: ListView.separated(
          itemCount: 10,
          itemBuilder:( context,index){
            return ListTile(
              onTap: (){
                showDialog(context: context, builder: (context){
                  return AlertDialog(
                    title: Text('Action'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                      ListTile(
                        leading: Icon(Icons.edit),
                        title: Text('Update'),
                        onTap: (){
                          Navigator.pop(context);
                          showModalBottomSheet(context: context, builder: (context){
                            return UpdateTeskModal();
                          });
                        },
                      ),
                      Divider(
                        height: 0,
                      ),
                      ListTile(
                        leading: Icon(Icons.delete),
                        title: Text('Delete'),
                        onTap: (){
                          Navigator.pop(context);
                        },
                      ),
                    ],),
                  );
                });
              },
              leading: CircleAvatar(child: Text('${index+1}'),),
              title: Text('I have to do my homework for school'),
              subtitle: Text('10-10-2023'),
              trailing: Text('Pending'),
            );


    }, separatorBuilder: (BuildContext context, int index) {
            return Divider(
              height: 4,
            );
      },),

    );
  }
}

class AddNewTeskModal extends StatelessWidget {
  const AddNewTeskModal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Add new todo',style: Theme.of(context).textTheme.titleLarge),
            IconButton(onPressed: (){
              Navigator.pop(context);
            }, icon:Icon(Icons.close),)
          ],
        ),
        SizedBox(height: 24),
        TextFormField(
          maxLines: 4,
          decoration: InputDecoration(
            hintText: 'enter your todo here',
            enabledBorder: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(),


          ),

        ),
        const SizedBox(height: 16,),
        SizedBox(
            width: double.infinity,
            child: ElevatedButton(onPressed:(){}, child: const Text('Add'),))
      ],),
    );
  }
}
class UpdateTeskModal extends StatelessWidget {
  const UpdateTeskModal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Update todo',style: Theme.of(context).textTheme.titleLarge),
            IconButton(onPressed: (){
              Navigator.pop(context);
            }, icon:Icon(Icons.close),)
          ],
        ),
        SizedBox(height: 24),
        TextFormField(
          maxLines: 4,
          decoration: InputDecoration(
            hintText: 'enter your todo here',
            enabledBorder: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(),


          ),

        ),
        const SizedBox(height: 16,),
        SizedBox(
            width: double.infinity,
            child: ElevatedButton(onPressed:(){}, child: const Text('Update'),))
      ],),
    );
  }
}
