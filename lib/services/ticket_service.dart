import 'package:busz/models/home_models.dart';

class TicketService {
  static Future<List<Ticket>> getMyTickets() async {
    // Mock data
    await Future.delayed(const Duration(milliseconds: 300));
    return [
      Ticket(
        id: 'tk1',
        busAgent: 'Cititrans Bus',
        busClass: 'Super Executive',
        status: 'Active',
        type: 'Intercity',
        departureTime: '06:45',
        departureStation: 'Terminal Pondok Pinang',
        arrivalTime: '19:00',
        arrivalStation: 'Cititrans Ahmad Yani',
        duration: '12 h 15m',
        boardingTime: '21 October 2024',
      ),
      Ticket(
        id: 'tk2',
        busAgent: 'Trans Jakarta',
        busClass: '',
        status: 'Active',
        type: 'Local Trans',
        departureTime: '08:00',
        departureStation: 'KFT Bus Stop',
        arrivalTime: '10:20',
        arrivalStation: 'Senayan Park Bus Stop',
        duration: '2h 20m',
        boardingTime: 'Today',
      ),
    ];
  }
}
