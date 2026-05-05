-- ============================================================
-- HW7: load_data.sql
-- ============================================================

-- ============================================================
-- GUEST CATEGORIES  (2 types with different discounts)
-- ============================================================
INSERT INTO GuestCategory (CategoryID, Name, DiscountPercent) VALUES
    (1, 'Standard', 0.00),
    (2, 'Gold',     10.00);

-- ============================================================
-- HOTELS  (5 hotels)
-- ============================================================
INSERT INTO Hotel (HotelUID, Name, Street, City, State, Zip, PhoneNumber) VALUES
    (1, 'Hotel Azul',      '100 Ocean Ave',      'Miami',         'FL', '33101', '305-100-0001'),
    (2, 'Hotel Noir',      '200 Broadway',        'New York',      'NY', '10001', '212-200-0002'),
    (3, 'Hotel Verde',     '300 Sunset Blvd',     'Los Angeles',   'CA', '90028', '323-300-0003'),
    (4, 'Hotel Blanco',    '400 Michigan Ave',    'Chicago',       'IL', '60601', '312-400-0004'),
    (5, 'Hotel Dorado',    '500 Bourbon St',      'New Orleans',   'LA', '70116', '504-500-0005');

-- ============================================================
-- SEASONS  (2 per hotel = 10 total)
-- ============================================================
INSERT INTO Season (SeasonID, HotelUID, Name, StartDate, EndDate) VALUES
    -- Hotel Azul (1)
    (1,  1, 'Summer',  '2025-06-01', '2025-08-31'),
    (2,  1, 'Winter',  '2025-12-01', '2026-02-28'),
    -- Hotel Noir (2)
    (3,  2, 'Summer',  '2025-06-01', '2025-08-31'),
    (4,  2, 'Winter',  '2025-12-01', '2026-02-28'),
    -- Hotel Verde (3)
    (5,  3, 'Summer',  '2025-06-01', '2025-08-31'),
    (6,  3, 'Winter',  '2025-12-01', '2026-02-28'),
    -- Hotel Blanco (4)
    (7,  4, 'Summer',  '2025-06-01', '2025-08-31'),
    (8,  4, 'Winter',  '2025-12-01', '2026-02-28'),
    -- Hotel Dorado (5)
    (9,  5, 'Summer',  '2025-06-01', '2025-08-31'),
    (10, 5, 'Winter',  '2025-12-01', '2026-02-28');

-- ============================================================
-- ROOM TYPES  (at least 2 per hotel = 10 total)
-- TypeID scheme: hotel*10 + offset (1=Single, 2=Double, etc.)
-- ============================================================
INSERT INTO RoomType (TypeID, HotelUID, Name, Size, Capacity) VALUES
    -- Hotel Azul (1)
    (11, 1, 'Single',  'Small',  1),
    (12, 1, 'Double',  'Medium', 2),
    (13, 1, 'Suite',   'Large',  4),
    -- Hotel Noir (2)
    (21, 2, 'Single',  'Small',  1),
    (22, 2, 'Double',  'Medium', 2),
    (23, 2, 'Suite',   'Large',  4),
    -- Hotel Verde (3)
    (31, 3, 'Single',  'Small',  1),
    (32, 3, 'Double',  'Medium', 2),
    -- Hotel Blanco (4)
    (41, 4, 'Single',  'Small',  1),
    (42, 4, 'Double',  'Medium', 2),
    -- Hotel Dorado (5)
    (51, 5, 'Single',  'Small',  1),
    (52, 5, 'Double',  'Medium', 2);

-- ============================================================
-- ROOMS  (at least 3 per type per hotel)
-- ============================================================
INSERT INTO Room (RoomNumber, HotelUID, TypeID, Floor) VALUES
    -- Hotel Azul: Single (11) rooms
    (101, 1, 11, 1), (102, 1, 11, 1), (103, 1, 11, 1),
    -- Hotel Azul: Double (12) rooms
    (201, 1, 12, 2), (202, 1, 12, 2), (203, 1, 12, 2),
    -- Hotel Azul: Suite (13) rooms
    (301, 1, 13, 3), (302, 1, 13, 3), (303, 1, 13, 3),

    -- Hotel Noir: Single (21) rooms
    (101, 2, 21, 1), (102, 2, 21, 1), (103, 2, 21, 1),
    -- Hotel Noir: Double (22) rooms
    (201, 2, 22, 2), (202, 2, 22, 2), (203, 2, 22, 2),
    -- Hotel Noir: Suite (23) rooms
    (301, 2, 23, 3), (302, 2, 23, 3), (303, 2, 23, 3),

    -- Hotel Verde: Single (31) rooms
    (101, 3, 31, 1), (102, 3, 31, 1), (103, 3, 31, 1),
    -- Hotel Verde: Double (32) rooms
    (201, 3, 32, 2), (202, 3, 32, 2), (203, 3, 32, 2),

    -- Hotel Blanco: Single (41) rooms
    (101, 4, 41, 1), (102, 4, 41, 1), (103, 4, 41, 1),
    -- Hotel Blanco: Double (42) rooms
    (201, 4, 42, 2), (202, 4, 42, 2), (203, 4, 42, 2),

    -- Hotel Dorado: Single (51) rooms
    (101, 5, 51, 1), (102, 5, 51, 1), (103, 5, 51, 1),
    -- Hotel Dorado: Double (52) rooms
    (201, 5, 52, 2), (202, 5, 52, 2), (203, 5, 52, 2);

-- ============================================================
-- ROOM PRICES
-- Every (SeasonID, TypeID, DayOfTheWeek) combo.
-- Prices vary across days and seasons as required.
-- Days: Monday Tuesday Wednesday Thursday Friday Saturday Sunday
-- ============================================================

-- Helper note:
--   Season 1 = Hotel Azul Summer  | Season 2 = Hotel Azul Winter
--   Season 3 = Hotel Noir Summer  | Season 4 = Hotel Noir Winter
--   Season 5 = Hotel Verde Summer | Season 6 = Hotel Verde Winter
--   Season 7 = Hotel Blanco Summer| Season 8 = Hotel Blanco Winter
--   Season 9 = Hotel Dorado Summer| Season 10= Hotel Dorado Winter
--   Types: 11,12,13 (Azul) | 21,22,23 (Noir) | 31,32 (Verde)
--          41,42 (Blanco) | 51,52 (Dorado)

-- ---- Hotel Azul Summer (SeasonID=1) ----
INSERT INTO RoomPrice (SeasonID, TypeID, DayOfTheWeek, Price) VALUES
    (1, 11, 'Monday',    89.00), (1, 11, 'Tuesday',   89.00),
    (1, 11, 'Wednesday', 89.00), (1, 11, 'Thursday',  95.00),
    (1, 11, 'Friday',   115.00), (1, 11, 'Saturday', 125.00),
    (1, 11, 'Sunday',    99.00),

    (1, 12, 'Monday',   129.00), (1, 12, 'Tuesday',  129.00),
    (1, 12, 'Wednesday',129.00), (1, 12, 'Thursday', 139.00),
    (1, 12, 'Friday',   169.00), (1, 12, 'Saturday', 185.00),
    (1, 12, 'Sunday',   149.00),

    (1, 13, 'Monday',   249.00), (1, 13, 'Tuesday',  249.00),
    (1, 13, 'Wednesday',249.00), (1, 13, 'Thursday', 269.00),
    (1, 13, 'Friday',   319.00), (1, 13, 'Saturday', 349.00),
    (1, 13, 'Sunday',   279.00);

-- ---- Hotel Azul Winter (SeasonID=2) ----
INSERT INTO RoomPrice (SeasonID, TypeID, DayOfTheWeek, Price) VALUES
    (2, 11, 'Monday',    75.00), (2, 11, 'Tuesday',   75.00),
    (2, 11, 'Wednesday', 75.00), (2, 11, 'Thursday',  80.00),
    (2, 11, 'Friday',    95.00), (2, 11, 'Saturday', 105.00),
    (2, 11, 'Sunday',    85.00),

    (2, 12, 'Monday',   110.00), (2, 12, 'Tuesday',  110.00),
    (2, 12, 'Wednesday',110.00), (2, 12, 'Thursday', 120.00),
    (2, 12, 'Friday',   145.00), (2, 12, 'Saturday', 160.00),
    (2, 12, 'Sunday',   125.00),

    (2, 13, 'Monday',   210.00), (2, 13, 'Tuesday',  210.00),
    (2, 13, 'Wednesday',210.00), (2, 13, 'Thursday', 225.00),
    (2, 13, 'Friday',   270.00), (2, 13, 'Saturday', 295.00),
    (2, 13, 'Sunday',   230.00);

-- ---- Hotel Noir Summer (SeasonID=3) ----
INSERT INTO RoomPrice (SeasonID, TypeID, DayOfTheWeek, Price) VALUES
    (3, 21, 'Monday',   109.00), (3, 21, 'Tuesday',  109.00),
    (3, 21, 'Wednesday',109.00), (3, 21, 'Thursday', 115.00),
    (3, 21, 'Friday',   140.00), (3, 21, 'Saturday', 155.00),
    (3, 21, 'Sunday',   119.00),

    (3, 22, 'Monday',   159.00), (3, 22, 'Tuesday',  159.00),
    (3, 22, 'Wednesday',159.00), (3, 22, 'Thursday', 170.00),
    (3, 22, 'Friday',   205.00), (3, 22, 'Saturday', 225.00),
    (3, 22, 'Sunday',   175.00),

    (3, 23, 'Monday',   299.00), (3, 23, 'Tuesday',  299.00),
    (3, 23, 'Wednesday',299.00), (3, 23, 'Thursday', 319.00),
    (3, 23, 'Friday',   379.00), (3, 23, 'Saturday', 419.00),
    (3, 23, 'Sunday',   329.00);

-- ---- Hotel Noir Winter (SeasonID=4) ----
INSERT INTO RoomPrice (SeasonID, TypeID, DayOfTheWeek, Price) VALUES
    (4, 21, 'Monday',    95.00), (4, 21, 'Tuesday',   95.00),
    (4, 21, 'Wednesday', 95.00), (4, 21, 'Thursday', 100.00),
    (4, 21, 'Friday',   120.00), (4, 21, 'Saturday', 135.00),
    (4, 21, 'Sunday',   105.00),

    (4, 22, 'Monday',   140.00), (4, 22, 'Tuesday',  140.00),
    (4, 22, 'Wednesday',140.00), (4, 22, 'Thursday', 150.00),
    (4, 22, 'Friday',   180.00), (4, 22, 'Saturday', 195.00),
    (4, 22, 'Sunday',   155.00),

    (4, 23, 'Monday',   265.00), (4, 23, 'Tuesday',  265.00),
    (4, 23, 'Wednesday',265.00), (4, 23, 'Thursday', 280.00),
    (4, 23, 'Friday',   335.00), (4, 23, 'Saturday', 365.00),
    (4, 23, 'Sunday',   285.00);

-- ---- Hotel Verde Summer (SeasonID=5) ----
INSERT INTO RoomPrice (SeasonID, TypeID, DayOfTheWeek, Price) VALUES
    (5, 31, 'Monday',    99.00), (5, 31, 'Tuesday',   99.00),
    (5, 31, 'Wednesday', 99.00), (5, 31, 'Thursday', 105.00),
    (5, 31, 'Friday',   130.00), (5, 31, 'Saturday', 145.00),
    (5, 31, 'Sunday',   110.00),

    (5, 32, 'Monday',   149.00), (5, 32, 'Tuesday',  149.00),
    (5, 32, 'Wednesday',149.00), (5, 32, 'Thursday', 160.00),
    (5, 32, 'Friday',   195.00), (5, 32, 'Saturday', 215.00),
    (5, 32, 'Sunday',   165.00);

-- ---- Hotel Verde Winter (SeasonID=6) ----
INSERT INTO RoomPrice (SeasonID, TypeID, DayOfTheWeek, Price) VALUES
    (6, 31, 'Monday',    85.00), (6, 31, 'Tuesday',   85.00),
    (6, 31, 'Wednesday', 85.00), (6, 31, 'Thursday',  90.00),
    (6, 31, 'Friday',   110.00), (6, 31, 'Saturday', 120.00),
    (6, 31, 'Sunday',    95.00),

    (6, 32, 'Monday',   125.00), (6, 32, 'Tuesday',  125.00),
    (6, 32, 'Wednesday',125.00), (6, 32, 'Thursday', 135.00),
    (6, 32, 'Friday',   165.00), (6, 32, 'Saturday', 180.00),
    (6, 32, 'Sunday',   140.00);

-- ---- Hotel Blanco Summer (SeasonID=7) ----
INSERT INTO RoomPrice (SeasonID, TypeID, DayOfTheWeek, Price) VALUES
    (7, 41, 'Monday',    79.00), (7, 41, 'Tuesday',   79.00),
    (7, 41, 'Wednesday', 79.00), (7, 41, 'Thursday',  85.00),
    (7, 41, 'Friday',   105.00), (7, 41, 'Saturday', 115.00),
    (7, 41, 'Sunday',    89.00),

    (7, 42, 'Monday',   119.00), (7, 42, 'Tuesday',  119.00),
    (7, 42, 'Wednesday',119.00), (7, 42, 'Thursday', 129.00),
    (7, 42, 'Friday',   155.00), (7, 42, 'Saturday', 170.00),
    (7, 42, 'Sunday',   135.00);

-- ---- Hotel Blanco Winter (SeasonID=8) ----
INSERT INTO RoomPrice (SeasonID, TypeID, DayOfTheWeek, Price) VALUES
    (8, 41, 'Monday',    65.00), (8, 41, 'Tuesday',   65.00),
    (8, 41, 'Wednesday', 65.00), (8, 41, 'Thursday',  70.00),
    (8, 41, 'Friday',    85.00), (8, 41, 'Saturday',  95.00),
    (8, 41, 'Sunday',    72.00),

    (8, 42, 'Monday',    99.00), (8, 42, 'Tuesday',   99.00),
    (8, 42, 'Wednesday', 99.00), (8, 42, 'Thursday', 108.00),
    (8, 42, 'Friday',   130.00), (8, 42, 'Saturday', 145.00),
    (8, 42, 'Sunday',   112.00);

-- ---- Hotel Dorado Summer (SeasonID=9) ----
INSERT INTO RoomPrice (SeasonID, TypeID, DayOfTheWeek, Price) VALUES
    (9, 51, 'Monday',    92.00), (9, 51, 'Tuesday',   92.00),
    (9, 51, 'Wednesday', 92.00), (9, 51, 'Thursday',  98.00),
    (9, 51, 'Friday',   120.00), (9, 51, 'Saturday', 135.00),
    (9, 51, 'Sunday',   102.00),

    (9, 52, 'Monday',   135.00), (9, 52, 'Tuesday',  135.00),
    (9, 52, 'Wednesday',135.00), (9, 52, 'Thursday', 145.00),
    (9, 52, 'Friday',   175.00), (9, 52, 'Saturday', 195.00),
    (9, 52, 'Sunday',   150.00);

-- ---- Hotel Dorado Winter (SeasonID=10) ----
INSERT INTO RoomPrice (SeasonID, TypeID, DayOfTheWeek, Price) VALUES
    (10, 51, 'Monday',   78.00), (10, 51, 'Tuesday',   78.00),
    (10, 51, 'Wednesday',78.00), (10, 51, 'Thursday',  84.00),
    (10, 51, 'Friday',  100.00), (10, 51, 'Saturday', 112.00),
    (10, 51, 'Sunday',   88.00),

    (10, 52, 'Monday',  115.00), (10, 52, 'Tuesday',  115.00),
    (10, 52, 'Wednesday',115.00),(10, 52, 'Thursday', 125.00),
    (10, 52, 'Friday',  150.00), (10, 52, 'Saturday', 165.00),
    (10, 52, 'Sunday',  128.00);

-- ============================================================
-- FEATURE TYPES  (amenities per room type)
-- ============================================================
INSERT INTO Feature_Type (FeatureID, HotelUID, TypeID, Name) VALUES
    (1,  1, 11, 'City View'),
    (2,  1, 12, 'Ocean View'),
    (3,  1, 12, 'Balcony'),
    (4,  1, 13, 'Jacuzzi'),
    (5,  1, 13, 'Living Room'),
    (6,  2, 21, 'Street View'),
    (7,  2, 22, 'King Bed'),
    (8,  2, 23, 'Butler Service'),
    (9,  3, 31, 'Garden View'),
    (10, 3, 32, 'Pool Access'),
    (11, 4, 41, 'City View'),
    (12, 4, 42, 'Kitchenette'),
    (13, 5, 51, 'Courtyard View'),
    (14, 5, 52, 'Jazz Lounge Access');

-- ============================================================
-- SERVICES  (extra services per hotel)
-- ============================================================
INSERT INTO Services (ServiceID, HotelUID, Name, Price) VALUES
    (1,  1, 'Room Service',     25),
    (2,  1, 'Spa Treatment',    80),
    (3,  1, 'Airport Shuttle',  40),
    (4,  2, 'Room Service',     30),
    (5,  2, 'Laundry',          20),
    (6,  2, 'Airport Shuttle',  55),
    (7,  3, 'Room Service',     25),
    (8,  3, 'Pool Cabana',      60),
    (9,  4, 'Room Service',     20),
    (10, 4, 'Parking',          35),
    (11, 5, 'Room Service',     22),
    (12, 5, 'Jazz Tour',        45);

-- ============================================================
-- GUESTS  (10 registered guests)
-- Mix of Standard (CategoryID=1) and Gold (CategoryID=2)
-- ============================================================
INSERT INTO Guest (GuestUID, CategoryID, Name, Identification, Address, HomePhone, MobilePhone) VALUES
    (1,  2, 'John Smith',       'DL-VA-001', '123 Main St, Springfield, VA',    '703-111-0001', '703-222-0001'),
    (2,  2, 'Maria Garcia',     'DL-FL-002', '456 Oak Ave, Tampa, FL',           '813-111-0002', '813-222-0002'),
    (3,  1, 'James Lee',        'DL-NY-003', '789 Pine Rd, Brooklyn, NY',        '718-111-0003', '718-222-0003'),
    (4,  1, 'Sarah Johnson',    'DL-CA-004', '321 Elm St, Pasadena, CA',         '626-111-0004', '626-222-0004'),
    (5,  2, 'Carlos Rivera',    'DL-TX-005', '654 Maple Dr, Austin, TX',         '512-111-0005', '512-222-0005'),
    (6,  1, 'Emily Chen',       'DL-IL-006', '987 Cedar Ln, Evanston, IL',       '847-111-0006', '847-222-0006'),
    (7,  2, 'Michael Brown',    'DL-LA-007', '159 Willow Way, Baton Rouge, LA',  '225-111-0007', '225-222-0007'),
    (8,  1, 'Aisha Williams',   'DL-GA-008', '753 Birch Blvd, Atlanta, GA',      '404-111-0008', '404-222-0008'),
    (9,  1, 'David Kim',        'DL-WA-009', '852 Spruce Ct, Seattle, WA',       '206-111-0009', '206-222-0009'),
    (10, 2, 'Priya Patel',      'DL-NJ-010', '246 Ash Pl, Newark, NJ',           '973-111-0010', '973-222-0010');

-- ============================================================
-- OCCUPANTS  (people accompanying guests — mixture of counts)
-- ============================================================
INSERT INTO Occupant (GuestUID, OccupantName) VALUES
    -- John Smith brings his wife (Guest 1 — Smiths for Query 2 & 3)
    (1, 'Jane Smith'),
    -- Maria Garcia brings 2 family members
    (2, 'Pedro Garcia'),
    (2, 'Lucia Garcia'),
    -- Carlos Rivera brings 1 person
    (5, 'Ana Rivera'),
    -- Michael Brown brings 2 people
    (7, 'Tom Brown'),
    (7, 'Lisa Brown'),
    -- Priya Patel brings 1 person
    (10, 'Raj Patel');

-- ============================================================
-- RESERVATIONS
-- ---- Completed stays (past) for billing — Guests 1, 2, 3 ----
-- ---- Guest 1 (Smith) has 2 reservations ----
-- ---- Guest 2 (Garcia) has 2 reservations ----
-- Requirements satisfied:
--   • At least 3 guests with completed past stays → Guests 1,2,3 (RES 1,2,3,5)
--   • 2 guests with 2+ reservations → Guest 1 (RES 1,6), Guest 2 (RES 2,5)
--   • 2 reservations with multiple room types → RES 3, RES 7
--   • 2 reservations with multiple rooms same type → RES 4, RES 8
--   • 2 multi-day reservations → most are multi-day; explicit: RES 1 (3 nights), RES 6 (2 nights)
--   • 2 reservations fully within a season → RES 9 (Summer 2025), RES 10 (Summer 2025)
-- ============================================================
INSERT INTO Reservation (ReservationID, GuestUID, Check_In_Date, Check_Out_Date, Address, HomePhone, MobilePhone) VALUES
    -- PAST (completed) stays ----------------------------------------
    -- RES 1: John Smith, Hotel Noir, 3 nights (multi-day, past)
    (1,  1, '2025-07-10', '2025-07-13', '123 Main St, Springfield, VA', '703-111-0001', '703-222-0001'),
    -- RES 2: Maria Garcia, Hotel Azul, 2 nights (past)
    (2,  2, '2025-07-01', '2025-07-03', '456 Oak Ave, Tampa, FL',        '813-111-0002', '813-222-0002'),
    -- RES 3: James Lee, Hotel Verde, multi-room-type (past, 2 nights)
    (3,  3, '2025-06-20', '2025-06-22', '789 Pine Rd, Brooklyn, NY',     '718-111-0003', '718-222-0003'),
    -- FUTURE / upcoming stays ----------------------------------------
    -- RES 4: Sarah Johnson, Hotel Azul, 2 same-type rooms (Double), 1 night
    (4,  4, '2026-05-10', '2026-05-11', '321 Elm St, Pasadena, CA',      '626-111-0004', '626-222-0004'),
    -- RES 5: Maria Garcia (2nd reservation), Hotel Blanco, 1 night (past)
    (5,  2, '2025-08-05', '2025-08-06', '456 Oak Ave, Tampa, FL',        '813-111-0002', '813-222-0002'),
    -- RES 6: John Smith (2nd reservation), Hotel Noir, 2 nights (future, multi-day)
    (6,  1, '2026-07-15', '2026-07-17', '123 Main St, Springfield, VA',  '703-111-0001', '703-222-0001'),
    -- RES 7: Carlos Rivera, Hotel Dorado, multiple room types
    (7,  5, '2026-03-14', '2026-03-15', '654 Maple Dr, Austin, TX',      '512-111-0005', '512-222-0005'),
    -- RES 8: Emily Chen, Hotel Blanco, 2 Double rooms (same type)
    (8,  6, '2026-04-01', '2026-04-02', '987 Cedar Ln, Evanston, IL',    '847-111-0006', '847-222-0006'),
    -- RES 9: Michael Brown, Hotel Azul, fully within Summer 2025 season
    (9,  7, '2025-07-20', '2025-07-22', '159 Willow Way, Baton Rouge, LA','225-111-0007','225-222-0007'),
    -- RES 10: Priya Patel, Hotel Dorado, fully within Summer 2025 season
    (10,10, '2025-08-10', '2025-08-12', '246 Ash Pl, Newark, NJ',        '973-111-0010', '973-222-0010'),
    -- Additional reservations for remaining guests
    -- RES 11: Aisha Williams, Hotel Verde, 1 night
    (11, 8, '2026-02-14', '2026-02-15', '753 Birch Blvd, Atlanta, GA',   '404-111-0008', '404-222-0008'),
    -- RES 12: David Kim, Hotel Verde, 1 night
    (12, 9, '2026-03-05', '2026-03-06', '852 Spruce Ct, Seattle, WA',    '206-111-0009', '206-222-0009');

-- ============================================================
-- RESERVATION ROOM REQUESTS
-- ============================================================
INSERT INTO ReservationRoomRequest (RequestID, ReservationID, TypeID, Quantity) VALUES
    -- RES 1: John Smith → 1 Double at Hotel Noir
    (1,  1, 22, 1),
    -- RES 2: Maria Garcia → 1 Single at Hotel Azul
    (2,  2, 11, 1),
    -- RES 3: James Lee → 1 Single + 1 Double at Hotel Verde (multiple room types)
    (3,  3, 31, 1),
    (4,  3, 32, 1),
    -- RES 4: Sarah Johnson → 2 Double rooms at Hotel Azul (same type, quantity=2)
    (5,  4, 12, 2),
    -- RES 5: Maria Garcia 2nd → 1 Double at Hotel Blanco
    (6,  5, 42, 1),
    -- RES 6: John Smith 2nd → 1 Double at Hotel Noir (Query 2 & 3)
    (7,  6, 22, 1),
    -- RES 7: Carlos Rivera → 1 Single + 1 Double at Hotel Dorado (multiple types)
    (8,  7, 51, 1),
    (9,  7, 52, 1),
    -- RES 8: Emily Chen → 2 Double rooms at Hotel Blanco (same type)
    (10, 8, 42, 2),
    -- RES 9: Michael Brown → 1 Suite at Hotel Azul (within Summer season)
    (11, 9, 13, 1),
    -- RES 10: Priya Patel → 1 Double at Hotel Dorado (within Summer season)
    (12,10, 52, 1),
    -- RES 11: Aisha Williams → 1 Single at Hotel Verde
    (13,11, 31, 1),
    -- RES 12: David Kim → 1 Double at Hotel Verde
    (14,12, 32, 1);

-- ============================================================
-- ROOM ASSIGNMENTS  (physical rooms assigned)
-- Past reservations have both start and end datetimes.
-- Future/current reservations have only startDateTime set.
-- ============================================================
INSERT INTO RoomAssignment (AssignmentID, RequestID, HotelUID, RoomNumber, startDateTime, endDateTime) VALUES
    -- RES 1 (Smith past, Hotel Noir, Double)
    (1,  1, 2, 201, '2025-07-10 15:00:00', '2025-07-13 11:00:00'),
    -- RES 2 (Garcia past, Hotel Azul, Single)
    (2,  2, 1, 101, '2025-07-01 14:00:00', '2025-07-03 11:00:00'),
    -- RES 3 (Lee past, Hotel Verde, Single + Double)
    (3,  3, 3, 101, '2025-06-20 14:00:00', '2025-06-22 11:00:00'),
    (4,  4, 3, 201, '2025-06-20 14:00:00', '2025-06-22 11:00:00'),
    -- RES 4 (Johnson future, Hotel Azul, 2 Doubles)
    (5,  5, 1, 201, '2026-05-10 14:00:00', NULL),
    (6,  5, 1, 202, '2026-05-10 14:00:00', NULL),
    -- RES 5 (Garcia 2nd past, Hotel Blanco, Double)
    (7,  6, 4, 201, '2025-08-05 14:00:00', '2025-08-06 11:00:00'),
    -- RES 6 (Smith 2nd future, Hotel Noir, Double — Query 2 scenario)
    (8,  7, 2, 202, '2026-07-15 14:00:00', NULL),
    -- RES 7 (Rivera, Hotel Dorado, Single + Double)
    (9,  8, 5, 101, '2026-03-14 14:00:00', NULL),
    (10, 9, 5, 201, '2026-03-14 14:00:00', NULL),
    -- RES 8 (Chen, Hotel Blanco, 2 Doubles)
    (11,10, 4, 201, '2026-04-01 14:00:00', NULL),
    (12,10, 4, 202, '2026-04-01 14:00:00', NULL),
    -- RES 9 (Brown, Hotel Azul, Suite — within Summer season)
    (13,11, 1, 301, '2025-07-20 14:00:00', '2025-07-22 11:00:00'),
    -- RES 10 (Patel, Hotel Dorado, Double — within Summer season)
    (14,12, 5, 201, '2025-08-10 14:00:00', '2025-08-12 11:00:00'),
    -- RES 11 (Williams, Hotel Verde)
    (15,13, 3, 101, '2026-02-14 14:00:00', NULL),
    -- RES 12 (Kim, Hotel Verde)
    (16,14, 3, 201, '2026-03-05 14:00:00', NULL);

-- ============================================================
-- OCCUPIES  (currently in-house guests for future reservations)
-- Only guests whose stays have not ended.
-- ============================================================
INSERT INTO Occupies (GuestUID, HotelUID, RoomNumber) VALUES
    -- Sarah Johnson (RES 4 — future, rooms 201 & 202 Hotel Azul)
    (4, 1, 201),
    (4, 1, 202),
    -- Carlos Rivera (RES 7 — Hotel Dorado)
    (5, 5, 101),
    (5, 5, 201),
    -- Emily Chen (RES 8 — Hotel Blanco)
    (6, 4, 201),
    (6, 4, 202),
    -- Aisha Williams (RES 11 — Hotel Verde)
    (8, 3, 101),
    -- David Kim (RES 12 — Hotel Verde)
    (9, 3, 201);

-- ============================================================
-- SERVICE USAGE  (for completed stays only — billing will exist)
-- Guests 1, 2, 3 had completed stays (RES 1, 2, 3, 5)
-- Also RES 9 and 10 are past stays (Brown, Patel)
-- ============================================================
INSERT INTO ServiceUsage (UsageID, ReservationID, ServiceID, Quantity, PriceCharged) VALUES
    -- RES 1: John Smith used Room Service at Hotel Noir (ServiceID=4, $30)
    (1, 1, 4, 2, 60.00),
    -- RES 1: John Smith used Laundry at Hotel Noir (ServiceID=5, $20)
    (2, 1, 5, 1, 20.00),
    -- RES 2: Maria Garcia used Room Service at Hotel Azul (ServiceID=1, $25)
    (3, 2, 1, 1, 25.00),
    -- RES 3: James Lee used Room Service at Hotel Verde (ServiceID=7, $25)
    (4, 3, 7, 1, 25.00),
    -- RES 5: Maria Garcia used Parking at Hotel Blanco (ServiceID=10, $35)
    (5, 5, 10, 1, 35.00),
    -- RES 9: Michael Brown used Spa at Hotel Azul (ServiceID=2, $80)
    (6, 9, 2, 1, 80.00),
    -- RES 10: Priya Patel used Airport Shuttle at Hotel Azul... 
    -- (Patel stayed at Hotel Dorado — use Dorado Room Service ServiceID=11)
    (7, 10, 11, 2, 44.00);

-- ============================================================
-- INVOICES  (for completed past stays)
-- Billing covers room charges (per night, per day of week, per
-- season) plus service usage, minus any Gold discount (10%).
--
-- RES 1: John Smith, Hotel Noir, Double (TypeID=22), Jul 10-13
--   Nights: Jul 10 (Thu $170), Jul 11 (Fri $205), Jul 12 (Sat $225)
--   Room subtotal: 600.00
--   Services: $60 + $20 = $80
--   Gold 10% discount on rooms: 600 * 0.90 = 540.00
--   Total: 540.00 + 80.00 = 620.00
--
-- RES 2: Maria Garcia, Hotel Azul, Single (TypeID=11), Jul 1-3
--   Nights: Jul 1 (Tue $89), Jul 2 (Wed $89)
--   Room subtotal: 178.00
--   Services: $25
--   Gold 10% on rooms: 178 * 0.90 = 160.20
--   Total: 160.20 + 25.00 = 185.20
--
-- RES 3: James Lee, Hotel Verde, Single+Double, Jun 20-22
--   Single nights: Jun 20 (Fri $130), Jun 21 (Sat $145) = 275.00
--   Double nights: Jun 20 (Fri $195), Jun 21 (Sat $215) = 410.00
--   Room subtotal: 685.00
--   Services: $25
--   Standard (no discount): 685.00 + 25.00 = 710.00
--
-- RES 5: Maria Garcia, Hotel Blanco, Double (TypeID=42), Aug 5-6
--   Night: Aug 5 (Tue $119) — Summer season (SeasonID=7)
--   Room subtotal: 119.00
--   Services: $35
--   Gold 10%: 119 * 0.90 = 107.10
--   Total: 107.10 + 35.00 = 142.10
--
-- RES 9: Michael Brown, Hotel Azul, Suite (TypeID=13), Jul 20-22
--   Nights: Jul 20 (Sun $279), Jul 21 (Mon $249) — Summer (SeasonID=1)
--   Room subtotal: 528.00
--   Services: $80
--   Gold 10%: 528 * 0.90 = 475.20
--   Total: 475.20 + 80.00 = 555.20
--
-- RES 10: Priya Patel, Hotel Dorado, Double (TypeID=52), Aug 10-12
--   Nights: Aug 10 (Sun $150), Aug 11 (Mon $135) — Summer (SeasonID=9)
--   Room subtotal: 285.00
--   Services: $44
--   Gold 10%: 285 * 0.90 = 256.50
--   Total: 256.50 + 44.00 = 300.50
-- ============================================================
INSERT INTO Invoice (InvoiceID, ReservationID, IssueDate, TotalAmount) VALUES
    (1,  1, '2025-07-13', 620.00),
    (2,  2, '2025-07-03', 185.20),
    (3,  3, '2025-06-22', 710.00),
    (4,  5, '2025-08-06', 142.10),
    (5,  9, '2025-07-22', 555.20),
    (6, 10, '2025-08-12', 300.50);
