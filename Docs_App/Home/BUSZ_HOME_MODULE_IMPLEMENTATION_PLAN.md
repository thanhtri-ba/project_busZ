# BUSZ Home Module Implementation Plan

## Goal Description

Implement the BUSZ Home Module **strictly according to the approved
mockups** inside:

``` text
Docs_App/busz_home_mockups/
```

The mockups are the **FINAL APPROVED DESIGN** and the **ONLY source of
truth**.

This task is **NOT** to redesign the Home module.

The implementation must follow the screenshots as closely as possible.

Do NOT: - redesign the UI - improve the design - change spacing - change
colors - change typography - change icons - change component positions -
change card layout

If the documentation conflicts with the screenshots, **always follow the
screenshots**.

------------------------------------------------------------------------

# Scope

Implement ONLY:

-   Home Dashboard
-   Search Departure
-   Search Destination
-   Search City
-   Search Results
-   Date Picker
-   Sort Bottom Sheet
-   Filter Bottom Sheet
-   Change Search Bottom Sheet

Do NOT implement:

-   Booking Flow
-   Passenger Information
-   Seat Selection
-   Payment
-   Ticket Detail
-   Rewards
-   Voucher
-   Profile
-   Notification

Other tabs may display a simple **Coming Soon** placeholder.

------------------------------------------------------------------------

# User Review Decisions

## Header Image

If the original asset is unavailable:

-   Use a static placeholder image.
-   Mark it with `TODO: Replace with official asset`.
-   Do NOT generate a new illustration.
-   Do NOT redesign the header.

## Bottom Navigation

Tabs:

-   Home
-   Voucher
-   My Ticket
-   Rewards
-   Account

Only Home is fully implemented in this phase.

------------------------------------------------------------------------

# UI Screens

## MODIFY

### home_screen.dart

Match:

-   screen_18.png
-   screen_19.png
-   screen_20.png

Include:

-   Header
-   Search Card
-   Last Search
-   Promo
-   Ticket Card
-   Earn Busz Coin
-   Bottom Navigation

------------------------------------------------------------------------

## NEW

### search_city_screen.dart

Match:

-   screen_16.png
-   screen_17.png
-   screen_24.png

Features:

-   Search
-   Current Location
-   Search History
-   Popular Destinations

------------------------------------------------------------------------

## NEW

### search_results_screen.dart

Match:

-   screen_26.png

Include:

-   Route Header
-   Trip List
-   Rating
-   Price
-   Amenities
-   Filter
-   Sort
-   Change Search

------------------------------------------------------------------------

# Components

### filter_bottom_sheet.dart

Match `screen_28.png`

### sort_bottom_sheet.dart

Match `screen_22.png`

Options:

-   Earliest Departure Time
-   Price Low to High
-   Earliest Arrival Time
-   Shortest Travel Time
-   Highest Rating

### change_search_bottom_sheet.dart

Match `screen_27.png`

### date_picker_screen.dart

Match `screen_25.png`

------------------------------------------------------------------------

# Backend Requirements

The UI is fixed.

Backend must adapt to the UI.

Do NOT modify the UI because of backend implementation.

If backend APIs are unavailable:

-   Create service methods
-   Create request models
-   Create response models
-   Use temporary mock data ONLY inside the service layer

Never place fake business logic inside Widgets.

------------------------------------------------------------------------

# Services

Create:

-   home_service.dart
-   bus_service.dart
-   station_service.dart
-   promotion_service.dart

------------------------------------------------------------------------

# Suggested APIs

``` http
GET /user/profile
GET /promotion/list
GET /ticket/my
GET /city/search
GET /station/search
GET /bus/search
GET /bus/filter
GET /bus/sort
```

------------------------------------------------------------------------

# Models

-   User
-   Station
-   City
-   Trip
-   Promotion
-   Ticket
-   SearchRequest
-   SearchResponse

------------------------------------------------------------------------

# Verification

Run:

``` bash
flutter analyze
```

Manual:

1.  Home matches screen_18.png
2.  Home Logged In matches screen_19.png
3.  Ticket matches screen_20.png
4.  Search City matches screen_16,17,24
5.  Calendar matches screen_25
6.  Search Results matches screen_26
7.  Change Search matches screen_27
8.  Filter matches screen_28
9.  Sort matches screen_22

------------------------------------------------------------------------

# Completion Criteria

-   UI matches mockups.
-   No redesign.
-   Backend integration ready.
-   Business logic separated from UI.
-   Mock data exists only in Service Layer.
