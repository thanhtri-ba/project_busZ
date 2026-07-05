import 'package:flutter/material.dart';

class UserProfile {
  final String name;
  final String dob;

  UserProfile({required this.name, required this.dob});
}

class Wallet {
  final String balanceStr;

  Wallet({required this.balanceStr});
}

class Loyalty {
  final int points;
  final String tierName;

  Loyalty({required this.points, required this.tierName});
}

class City {
  final String id;
  final String name;

  City({required this.id, required this.name});
}

class Station {
  final String id;
  final String name;
  final String cityId;
  final bool isPopular;

  Station({required this.id, required this.name, required this.cityId, this.isPopular = false});
}

class Trip {
  final String id;
  final String busAgent;
  final String busAgentLogo;
  final String busClass; 
  final String departureTime;
  final String departureStation;
  final String arrivalTime;
  final String arrivalStation;
  final String duration;
  final int pointsEarned;
  final int price;

  Trip({
    required this.id,
    required this.busAgent,
    required this.busAgentLogo,
    required this.busClass,
    required this.departureTime,
    required this.departureStation,
    required this.arrivalTime,
    required this.arrivalStation,
    required this.duration,
    required this.pointsEarned,
    required this.price,
  });
}

class SearchRequest {
  final String departureCity;
  final String arrivalCity;
  final DateTime date;
  final bool isRoundTrip;

  SearchRequest({
    required this.departureCity,
    required this.arrivalCity,
    required this.date,
    this.isRoundTrip = false,
  });
}

class Promo {
  final String id;
  final String title;
  final String subtitle;
  final String logoPath; 

  Promo({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.logoPath,
  });
}

class Ticket {
  final String id;
  final String busAgent;
  final String busClass;
  final String status; 
  final String type; 
  final String departureTime;
  final String departureStation;
  final String arrivalTime;
  final String arrivalStation;
  final String duration;
  final String boardingTime;

  Ticket({
    required this.id,
    required this.busAgent,
    required this.busClass,
    required this.status,
    required this.type,
    required this.departureTime,
    required this.departureStation,
    required this.arrivalTime,
    required this.arrivalStation,
    required this.duration,
    required this.boardingTime,
  });
}

class SearchHistory {
  final String id;
  final String route;
  final String date;
  final String passengerInfo;

  SearchHistory({
    required this.id,
    required this.route,
    required this.date,
    required this.passengerInfo,
  });
}

class CalendarPrice {
  final DateTime date;
  final String priceStr;
  final Color priceColor;

  CalendarPrice({
    required this.date,
    required this.priceStr,
    required this.priceColor,
  });
}

class BusAgent {
  final String id;
  final String name;

  BusAgent({required this.id, required this.name});
}
