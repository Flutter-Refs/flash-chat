class Message {
  String text;
  String sender;
  late DateTime timeStamp;

  Message({required this.text, required this.sender}) {
    this.timeStamp = DateTime.now();
  }
}
