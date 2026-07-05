import 'package:flutter/material.dart';
import 'package:busz/models/home_models.dart';

class BusService {
  static Future<List<City>> searchCities(String query) async {
    // Mock data
    final cities = [
      City(id: 'c1', name: 'Jakarta'),
      City(id: 'c2', name: 'Surabaya'),
      City(id: 'c3', name: 'Yogyakarta'),
      City(id: 'c4', name: 'Bali'),
      City(id: 'c5', name: 'Bandung'),
    ];
    if (query.isEmpty) return cities;
    return cities.where((c) => c.name.toLowerCase().contains(query.toLowerCase())).toList();
  }

  static Future<List<Station>> getPopularDestinations() async {
    await Future.delayed(const Duration(milliseconds: 200));
    return [
      Station(id: 's1', name: 'Terminal Condongcatur', cityId: 'c3', isPopular: true),
      Station(id: 's2', name: 'Terminal Purabaya', cityId: 'c2', isPopular: true),
      Station(id: 's3', name: 'Terminal Mangkang', cityId: 'c6', isPopular: true),
      Station(id: 's4', name: 'Terminal Mengwi', cityId: 'c4', isPopular: true),
      Station(id: 's5', name: 'Ngurah Rai', cityId: 'c4', isPopular: true),
      Station(id: 's6', name: 'Juanda International Airport', cityId: 'c2', isPopular: true),
    ];
  }

  static Future<List<Station>> searchStations(String query) async {
    final stations = await getPopularDestinations();
    if (query.isEmpty) return stations;
    return stations.where((s) => s.name.toLowerCase().contains(query.toLowerCase())).toList();
  }

  static Future<List<Trip>> searchBuses(SearchRequest req) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return [
      Trip(
        id: 't1',
        busAgent: 'Cititrans',
        busAgentLogo: 'assets/images/logo_cititrans.png',
        busClass: 'Super Executive - Alpha 01',
        departureTime: '04:50',
        departureStation: 'Blue Bird Ciputat (Kebay...)',
        arrivalTime: '16:55',
        arrivalStation: 'Cititrans Yogyakarta',
        duration: '11h 50m',
        pointsEarned: 1100,
        price: 280000,
      ),
      Trip(
        id: 't2',
        busAgent: 'Cititrans',
        busAgentLogo: 'assets/images/logo_cititrans.png',
        busClass: 'Super Executive - Beta 02',
        departureTime: '06:30',
        departureStation: 'Blue Bird Ciputat (Kebay...)',
        arrivalTime: '18:30',
        arrivalStation: 'Cititrans Yogyakarta',
        duration: '12h 00m',
        pointsEarned: 1100,
        price: 280000,
      ),
      Trip(
        id: 't3',
        busAgent: 'DayTrans',
        busAgentLogo: 'assets/images/logo_daytrans.png',
        busClass: 'Executive',
        departureTime: '08:00',
        departureStation: 'Terminal Lebak Bulus',
        arrivalTime: '19:00',
        arrivalStation: 'Terminal Giwangan',
        duration: '11h 00m',
        pointsEarned: 950,
        price: 250000,
      ),
    ];
  }

  static Future<List<CalendarPrice>> getCalendarPrices(int year, int month) async {
    await Future.delayed(const Duration(milliseconds: 200));
    int daysInMonth = DateTime(year, month + 1, 0).day;
    List<CalendarPrice> prices = [];
    
    for (int day = 1; day <= daysInMonth; day++) {
      String priceStr = 'IDR 320k';
      Color priceColor = Colors.black54;
      
      if (day % 4 == 0) {
        priceStr = 'IDR 400k';
        priceColor = Colors.red[400]!;
      } else if (day % 7 == 0) {
        priceStr = 'IDR 250k';
        priceColor = const Color(0xFF13B57B);
      }
      
      prices.add(CalendarPrice(
        date: DateTime(year, month, day),
        priceStr: priceStr,
        priceColor: priceColor,
      ));
    }
    
    return prices;
  }

  static Future<List<BusAgent>> getBusAgents() async {
    await Future.delayed(const Duration(milliseconds: 200));
    return [
      BusAgent(id: 'a1', name: 'Cititrans Bus'),
      BusAgent(id: 'a2', name: 'Agra Mas'),
      BusAgent(id: 'a3', name: 'Safari Dharma Raya'),
      BusAgent(id: 'a4', name: 'Kramat Djati Bus'),
      BusAgent(id: 'a5', name: 'Semeru Trans Bus'),
    ];
  }
}
