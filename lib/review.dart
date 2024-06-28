class ReviewScreen extends StatelessWidget {
  final String imagePath;

  const ReviewScreen({Key key, this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Review Image')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.file(File(imagePath)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _saveReview(imagePath, 'OK');
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                _saveReview(imagePath, 'Not OK');
                Navigator.pop(context);
              },
              child: Text('Not OK'),
            ),
          ],
        ),
      ),
    );
  }

  void _saveReview(String imagePath, String status) async {
    await DBHelper().insertReview(imagePath, status);
  }
}
