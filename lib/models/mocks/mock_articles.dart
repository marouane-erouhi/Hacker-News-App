import '../item.dart';

class MockItem extends Item{
  static final List<Item> items = [
    Item(
      id: '8863',
      url: 'http://www.getdropbox.com/u/2/screencast.html',
      type: 'story',
      title: 'My YC app: Dropbox - Throw away your USB drive',
      userName: 'dhouston',
      descendants: 71,
      score: 111,
      time: 1546671939294,
      kids: [ 8952, 9224, 8917, 8884, 8887 ],
    ),
    Item(
      id: '8863',
      url: 'http://www.getdropbox.com/u/2/screencast.html',
      type: 'story',
      title: 'My YC app: Google Drive - Throw away your USB drive',
      userName: 'dhouston',
      descendants: 71,
      score: 111,
      kids: [ 8952, 9224, 8917, 8884, 8887 ],
      time: 1175714200
    )
  ];

  static List<Item> fetchAll(){
      return MockItem.items;
  }
  static Item fetchById(int id){
    // use an index for now
    return MockItem.items[id];
  }

}