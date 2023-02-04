import 'package:talaky_app/data/services/all_booked_services.dart';
import '../models/all_booked.dart';

class BookedRepository
{
  final BookedService service ;

  BookedRepository(this.service);

  Future<List<BookedData>> fetchBooked (int page) async {

    final booked = await service.fetchBooked(page) ;

    return booked.map((e) => BookedData.fromJson(e)).toList() ;
  }
}