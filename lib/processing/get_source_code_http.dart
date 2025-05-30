import 'package:http/http.dart' as http;

class GetSourceCodeHttp{
  Future<String?> fetchPageSource(String dir) async {
    final url = Uri.parse(dir);

    try {
      final response = await http.get(url);
      print ("response ${response.statusCode}");
      if (response.statusCode == 200) {
        return response.body;
      } else {
        print('Error al cargar la página: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Excepción: $e');
      return null;
    }
  }
}