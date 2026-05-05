INSERT INTO GuestCategory (CategoryID, Name, DiscountPercent) VALUES
(1, 'Standard', 0.00),
(2, 'Gold', 10.00);

INSERT INTO Hotel (HotelUID, Name, Street, City, State, Zip, PhoneNumber) VALUES
(1, 'Sunrise Hotel', '123 Main St', 'Miami', 'FL', '33101', '305-111-1111'),
(2, 'Grand Hotel', '456 Broadway', 'New York', 'NY', '10001', '212-222-2222'),
(3, 'Palm Hotel', '789 Sunset Blvd', 'Los Angeles', 'CA', '90028', '323-333-3333'),
(4, 'Lake Hotel', '321 Lake Shore Dr', 'Chicago', 'IL', '60601', '312-444-4444'),
(5, 'Jazz Hotel', '654 Bourbon St', 'New Orleans', 'LA', '70116', '504-555-5555');

INSERT INTO Season (SeasonID, HotelUID, Name, StartDate, EndDate) VALUES
(1, 1, 'Summer', '2025-06-01', '2025-08-31'),
(2, 1, 'Winter', '2025-12-01', '2026-02-28'),
(3, 2, 'Summer', '2025-06-01', '2025-08-31'),
(4, 2, 'Winter', '2025-12-01', '2026-02-28'),
(5, 3, 'Summer', '2025-06-01', '2025-08-31'),
(6, 3, 'Winter', '2025-12-01', '2026-02-28'),
(7, 4, 'Summer', '2025-06-01', '2025-08-31'),
(8, 4, 'Winter', '2025-12-01', '2026-02-28'),
(9, 5, 'Summer', '2025-06-01', '2025-08-31'),
(10, 5, 'Winter', '2025-12-01', '2026-02-28');

INSERT INTO RoomType (TypeID, HotelUID, Name, Size, Capacity) VALUES
(11, 1, 'Single', 'Small', 1),
(12, 1, 'Double', 'Medium', 2),
(13, 1, 'Suite', 'Large', 4),
(21, 2, 'Single', 'Small', 1),
(22, 2, 'Double', 'Medium', 2),
(23, 2, 'Suite', 'Large', 4),
(31, 3, 'Single', 'Small', 1),
(32, 3, 'Double', 'Medium', 2),
(41, 4, 'Single', 'Small', 1),
(42, 4, 'Double', 'Medium', 2),
(51, 5, 'Single', 'Small', 1),
(52, 5, 'Double', 'Medium', 2);

INSERT INTO Room (RoomNumber, HotelUID, TypeID, Floor) VALUES
(101, 1, 11, 1), (102, 1, 11, 1), (103, 1, 11, 1),
(201, 1, 12, 2), (202, 1, 12, 2), (203, 1, 12, 2),
(301, 1, 13, 3), (302, 1, 13, 3), (303, 1, 13, 3),
(101, 2, 21, 1), (102, 2, 21, 1), (103, 2, 21, 1),
(201, 2, 22, 2), (202, 2, 22, 2), (203, 2, 22, 2),
(301, 2, 23, 3), (302, 2, 23, 3), (303, 2, 23, 3),
(101, 3, 31, 1), (102, 3, 31, 1), (103, 3, 31, 1),
(201, 3, 32, 2), (202, 3, 32, 2), (203, 3, 32, 2),
(101, 4, 41, 1), (102, 4, 41, 1), (103, 4, 41, 1),
(201, 4, 42, 2), (202, 4, 42, 2), (203, 4, 42, 2),
(101, 5, 51, 1), (102, 5, 51, 1), (103, 5, 51, 1),
(201, 5, 52, 2), (202, 5, 52, 2), (203, 5, 52, 2);

INSERT INTO HotelFeature (HotelUID, Feature) VALUES
(1, 'Pool'),
(1, 'Gym'),
(2, 'Spa'),
(2, 'Rooftop Bar'),
(3, 'Beach Access'),
(3, 'Pool'),
(4, 'Gym'),
(4, 'Parking'),
(5, 'Live Music'),
(5, 'Pool');

INSERT INTO RoomPrice (SeasonID, TypeID, DayOfTheWeek, Price) VALUES
(1, 11, 'Monday', 90.00), (1, 11, 'Tuesday', 90.00), (1, 11, 'Wednesday', 90.00),
(1, 11, 'Thursday', 95.00), (1, 11, 'Friday', 120.00), (1, 11, 'Saturday', 130.00), (1, 11, 'Sunday', 100.00),
(1, 12, 'Monday', 130.00), (1, 12, 'Tuesday', 130.00), (1, 12, 'Wednesday', 130.00),
(1, 12, 'Thursday', 140.00), (1, 12, 'Friday', 170.00), (1, 12, 'Saturday', 190.00), (1, 12, 'Sunday', 150.00),
(1, 13, 'Monday', 250.00), (1, 13, 'Tuesday', 250.00), (1, 13, 'Wednesday', 250.00),
(1, 13, 'Thursday', 270.00), (1, 13, 'Friday', 320.00), (1, 13, 'Saturday', 350.00), (1, 13, 'Sunday', 280.00),

(2, 11, 'Monday', 70.00), (2, 11, 'Tuesday', 70.00), (2, 11, 'Wednesday', 70.00),
(2, 11, 'Thursday', 75.00), (2, 11, 'Friday', 90.00), (2, 11, 'Saturday', 100.00), (2, 11, 'Sunday', 80.00),
(2, 12, 'Monday', 110.00), (2, 12, 'Tuesday', 110.00), (2, 12, 'Wednesday', 110.00),
(2, 12, 'Thursday', 120.00), (2, 12, 'Friday', 145.00), (2, 12, 'Saturday', 160.00), (2, 12, 'Sunday', 125.00),
(2, 13, 'Monday', 200.00), (2, 13, 'Tuesday', 200.00), (2, 13, 'Wednesday', 200.00),
(2, 13, 'Thursday', 220.00), (2, 13, 'Friday', 265.00), (2, 13, 'Saturday', 290.00), (2, 13, 'Sunday', 225.00),

(3, 21, 'Monday', 100.00), (3, 21, 'Tuesday', 100.00), (3, 21, 'Wednesday', 100.00),
(3, 21, 'Thursday', 110.00), (3, 21, 'Friday', 135.00), (3, 21, 'Saturday', 150.00), (3, 21, 'Sunday', 115.00),
(3, 22, 'Monday', 150.00), (3, 22, 'Tuesday', 150.00), (3, 22, 'Wednesday', 150.00),
(3, 22, 'Thursday', 165.00), (3, 22, 'Friday', 200.00), (3, 22, 'Saturday', 220.00), (3, 22, 'Sunday', 170.00),
(3, 23, 'Monday', 300.00), (3, 23, 'Tuesday', 300.00), (3, 23, 'Wednesday', 300.00),
(3, 23, 'Thursday', 320.00), (3, 23, 'Friday', 380.00), (3, 23, 'Saturday', 420.00), (3, 23, 'Sunday', 330.00),

(4, 21, 'Monday', 90.00), (4, 21, 'Tuesday', 90.00), (4, 21, 'Wednesday', 90.00),
(4, 21, 'Thursday', 95.00), (4, 21, 'Friday', 115.00), (4, 21, 'Saturday', 130.00), (4, 21, 'Sunday', 100.00),
(4, 22, 'Monday', 135.00), (4, 22, 'Tuesday', 135.00), (4, 22, 'Wednesday', 135.00),
(4, 22, 'Thursday', 145.00), (4, 22, 'Friday', 175.00), (4, 22, 'Saturday', 190.00), (4, 22, 'Sunday', 150.00),
(4, 23, 'Monday', 260.00), (4, 23, 'Tuesday', 260.00), (4, 23, 'Wednesday', 260.00),
(4, 23, 'Thursday', 275.00), (4, 23, 'Friday', 330.00), (4, 23, 'Saturday', 360.00), (4, 23, 'Sunday', 280.00),

(5, 31, 'Monday', 95.00), (5, 31, 'Tuesday', 95.00), (5, 31, 'Wednesday', 95.00),
(5, 31, 'Thursday', 100.00), (5, 31, 'Friday', 125.00), (5, 31, 'Saturday', 140.00), (5, 31, 'Sunday', 105.00),
(5, 32, 'Monday', 145.00), (5, 32, 'Tuesday', 145.00), (5, 32, 'Wednesday', 145.00),
(5, 32, 'Thursday', 155.00), (5, 32, 'Friday', 190.00), (5, 32, 'Saturday', 210.00), (5, 32, 'Sunday', 160.00),

(6, 31, 'Monday', 80.00), (6, 31, 'Tuesday', 80.00), (6, 31, 'Wednesday', 80.00),
(6, 31, 'Thursday', 85.00), (6, 31, 'Friday', 105.00), (6, 31, 'Saturday', 115.00), (6, 31, 'Sunday', 90.00),
(6, 32, 'Monday', 120.00), (6, 32, 'Tuesday', 120.00), (6, 32, 'Wednesday', 120.00),
(6, 32, 'Thursday', 130.00), (6, 32, 'Friday', 160.00), (6, 32, 'Saturday', 175.00), (6, 32, 'Sunday', 135.00),

(7, 41, 'Monday', 75.00), (7, 41, 'Tuesday', 75.00), (7, 41, 'Wednesday', 75.00),
(7, 41, 'Thursday', 80.00), (7, 41, 'Friday', 100.00), (7, 41, 'Saturday', 110.00), (7, 41, 'Sunday', 85.00),
(7, 42, 'Monday', 115.00), (7, 42, 'Tuesday', 115.00), (7, 42, 'Wednesday', 115.00),
(7, 42, 'Thursday', 125.00), (7, 42, 'Friday', 150.00), (7, 42, 'Saturday', 165.00), (7, 42, 'Sunday', 130.00),

(8, 41, 'Monday', 60.00), (8, 41, 'Tuesday', 60.00), (8, 41, 'Wednesday', 60.00),
(8, 41, 'Thursday', 65.00), (8, 41, 'Friday', 80.00), (8, 41, 'Saturday', 90.00), (8, 41, 'Sunday', 70.00),
(8, 42, 'Monday', 95.00), (8, 42, 'Tuesday', 95.00), (8, 42, 'Wednesday', 95.00),
(8, 42, 'Thursday', 105.00), (8, 42, 'Friday', 125.00), (8, 42, 'Saturday', 140.00), (8, 42, 'Sunday', 110.00),

(9, 51, 'Monday', 90.00), (9, 51, 'Tuesday', 90.00), (9, 51, 'Wednesday', 90.00),
(9, 51, 'Thursday', 95.00), (9, 51, 'Friday', 115.00), (9, 51, 'Saturday', 130.00), (9, 51, 'Sunday', 100.00),
(9, 52, 'Monday', 130.00), (9, 52, 'Tuesday', 130.00), (9, 52, 'Wednesday', 130.00),
(9, 52, 'Thursday', 140.00), (9, 52, 'Friday', 170.00), (9, 52, 'Saturday', 190.00), (9, 52, 'Sunday', 145.00),

(10, 51, 'Monday', 75.00), (10, 51, 'Tuesday', 75.00), (10, 51, 'Wednesday', 75.00),
(10, 51, 'Thursday', 80.00), (10, 51, 'Friday', 95.00), (10, 51, 'Saturday', 110.00), (10, 51, 'Sunday', 85.00),
(10, 52, 'Monday', 110.00), (10, 52, 'Tuesday', 110.00), (10, 52, 'Wednesday', 110.00),
(10, 52, 'Thursday', 120.00), (10, 52, 'Friday', 145.00), (10, 52, 'Saturday', 160.00), (10, 52, 'Sunday', 125.00);

INSERT INTO Services (ServiceID, HotelUID, Name, Price) VALUES
(1, 1, 'Room Service', 25),
(2, 1, 'Spa', 80),
(3, 1, 'Shuttle', 40),
(4, 2, 'Room Service', 30),
(5, 2, 'Laundry', 20),
(6, 2, 'Shuttle', 55),
(7, 3, 'Room Service', 25),
(8, 3, 'Cabana', 60),
(9, 4, 'Room Service', 20),
(10, 4, 'Parking', 35),
(11, 5, 'Room Service', 22),
(12, 5, 'Jazz Tour', 45);

INSERT INTO Guest (GuestUID, CategoryID, Name, Identification, Address, HomePhone, MobilePhone) VALUES
(1, 2, 'John Smith', 'VA123', '123 Main St, VA', '703-111-1111', '703-222-2222'),
(2, 2, 'Maria Garcia', 'FL456', '456 Oak Ave, FL', '813-111-1111', '813-222-2222'),
(3, 1, 'James Lee', 'NY789', '789 Pine Rd, NY', '718-111-1111', '718-222-2222'),
(4, 1, 'Sarah Johnson', 'CA321', '321 Elm St, CA', '626-111-1111', '626-222-2222'),
(5, 2, 'Carlos Rivera', 'TX654', '654 Maple Dr, TX', '512-111-1111', '512-222-2222'),
(6, 1, 'Emily Chen', 'IL987', '987 Cedar Ln, IL', '847-111-1111', '847-222-2222'),
(7, 2, 'Michael Brown', 'LA159', '159 Willow Way, LA', '225-111-1111', '225-222-2222'),
(8, 1, 'Aisha Williams', 'GA753', '753 Birch Blvd, GA', '404-111-1111', '404-222-2222'),
(9, 1, 'David Kim', 'WA852', '852 Spruce Ct, WA', '206-111-1111', '206-222-2222'),
(10, 2, 'Priya Patel', 'NJ246', '246 Ash Pl, NJ', '973-111-1111', '973-222-2222');

INSERT INTO Occupant (GuestUID, OccupantName) VALUES
(1, 'Jane Smith'),
(2, 'Pedro Garcia'),
(2, 'Lucia Garcia'),
(5, 'Ana Rivera'),
(7, 'Tom Brown'),
(7, 'Lisa Brown'),
(10, 'Raj Patel');

INSERT INTO Reservation (ReservationID, GuestUID, Check_In_Date, Check_Out_Date, Address, HomePhone, MobilePhone) VALUES
(1, 1, '2025-07-10', '2025-07-13', '123 Main St, VA', '703-111-1111', '703-222-2222'),
(2, 2, '2025-07-01', '2025-07-03', '456 Oak Ave, FL', '813-111-1111', '813-222-2222'),
(3, 3, '2025-06-20', '2025-06-22', '789 Pine Rd, NY', '718-111-1111', '718-222-2222'),
(4, 4, '2026-05-10', '2026-05-11', '321 Elm St, CA', '626-111-1111', '626-222-2222'),
(5, 2, '2025-08-05', '2025-08-06', '456 Oak Ave, FL', '813-111-1111', '813-222-2222'),
(6, 1, '2026-07-15', '2026-07-17', '123 Main St, VA', '703-111-1111', '703-222-2222'),
(7, 5, '2026-03-14', '2026-03-15', '654 Maple Dr, TX', '512-111-1111', '512-222-2222'),
(8, 6, '2026-04-01', '2026-04-02', '987 Cedar Ln, IL', '847-111-1111', '847-222-2222'),
(9, 7, '2025-07-20', '2025-07-22', '159 Willow Way, LA', '225-111-1111', '225-222-2222'),
(10, 10, '2025-08-10', '2025-08-12', '246 Ash Pl, NJ', '973-111-1111', '973-222-2222'),
(11, 8, '2026-02-14', '2026-02-15', '753 Birch Blvd, GA', '404-111-1111', '404-222-2222'),
(12, 9, '2026-03-05', '2026-03-06', '852 Spruce Ct, WA', '206-111-1111', '206-222-2222');

INSERT INTO ReservationRoomRequest (ReservationID, TypeID, Quantity) VALUES
(1, 22, 1),
(2, 11, 1),
(3, 31, 1),
(3, 32, 1),
(4, 12, 2),
(5, 42, 1),
(6, 22, 1),
(7, 51, 1),
(7, 52, 1),
(8, 42, 2),
(9, 13, 1),
(10, 52, 1),
(11, 31, 1),
(12, 32, 1);

INSERT INTO RoomAssignment (AssignmentID, ReservationID, TypeID, HotelUID, RoomNumber, startDateTime, endDateTime) VALUES
(1, 1, 22, 2, 201, '2025-07-10 15:00:00', '2025-07-13 11:00:00'),
(2, 2, 11, 1, 101, '2025-07-01 14:00:00', '2025-07-03 11:00:00'),
(3, 3, 31, 3, 101, '2025-06-20 14:00:00', '2025-06-22 11:00:00'),
(4, 3, 32, 3, 201, '2025-06-20 14:00:00', '2025-06-22 11:00:00'),
(5, 4, 12, 1, 201, '2026-05-10 14:00:00', NULL),
(6, 4, 12, 1, 202, '2026-05-10 14:00:00', NULL),
(7, 5, 42, 4, 201, '2025-08-05 14:00:00', '2025-08-06 11:00:00'),
(8, 6, 22, 2, 202, '2026-07-15 14:00:00', NULL),
(9, 7, 51, 5, 101, '2026-03-14 14:00:00', NULL),
(10, 7, 52, 5, 201, '2026-03-14 14:00:00', NULL),
(11, 8, 42, 4, 201, '2026-04-01 14:00:00', NULL),
(12, 8, 42, 4, 202, '2026-04-01 14:00:00', NULL),
(13, 9, 13, 1, 301, '2025-07-20 14:00:00', '2025-07-22 11:00:00'),
(14, 10, 52, 5, 201, '2025-08-10 14:00:00', '2025-08-12 11:00:00'),
(15, 11, 31, 3, 101, '2026-02-14 14:00:00', NULL),
(16, 12, 32, 3, 201, '2026-03-05 14:00:00', NULL);

INSERT INTO Occupies (GuestUID, HotelUID, RoomNumber) VALUES
(4, 1, 201),
(4, 1, 202),
(5, 5, 101),
(5, 5, 201),
(6, 4, 201),
(6, 4, 202),
(8, 3, 101),
(9, 3, 201);

INSERT INTO ServiceUsage (ReservationID, ServiceID, Quantity, PriceCharged) VALUES
(1, 4, 2, 60.00),
(1, 5, 1, 20.00),
(2, 1, 1, 25.00),
(3, 7, 1, 25.00),
(5, 10, 1, 35.00),
(9, 2, 1, 80.00),
(10, 11, 2, 44.00);

INSERT INTO Invoice (InvoiceID, ReservationID, IssueDate, TotalAmount) VALUES
(1, 1,  '2025-07-13', 606.50),
(2, 2,  '2025-07-03', 187.00),
(3, 3,  '2025-06-22', 690.00),
(4, 5,  '2025-08-06', 138.50),
(5, 9,  '2025-07-22', 557.00),
(6, 10, '2025-08-12', 291.50);

INSERT INTO OccupantAssignment (AssignmentID, GuestUID, OccupantName) VALUES
(1,  1,  'Jane Smith'),
(2,  2,  'Pedro Garcia'),
(2,  2,  'Lucia Garcia'),
(7,  2,  'Pedro Garcia'),
(7,  2,  'Lucia Garcia'),
(8,  1,  'Jane Smith'),
(9,  5,  'Ana Rivera'),
(10, 5,  'Ana Rivera'),
(13, 7,  'Tom Brown'),
(13, 7,  'Lisa Brown'),
(14, 10, 'Raj Patel');

------ Q1 support data -------------------------------------------------------
-- Summer 2026 season for Sunrise Hotel so July 15-17, 2026 has valid prices.
INSERT INTO Season (SeasonID, HotelUID, Name, StartDate, EndDate) VALUES
(11, 1, 'Summer', '2026-06-01', '2026-08-31');

-- Prices for Summer 2026 at Sunrise Hotel (same tiers as Summer 2025).
-- July 15 = Wednesday ($90/$130/$250), July 16 = Thursday ($95/$140/$270) —
-- prices differ across the two nights, satisfying the day-of-week requirement.
INSERT INTO RoomPrice (SeasonID, TypeID, DayOfTheWeek, Price) VALUES
(11, 11, 'Monday', 90.00),  (11, 11, 'Tuesday', 90.00),  (11, 11, 'Wednesday', 90.00),
(11, 11, 'Thursday', 95.00),(11, 11, 'Friday', 120.00),  (11, 11, 'Saturday', 130.00),(11, 11, 'Sunday', 100.00),
(11, 12, 'Monday', 130.00), (11, 12, 'Tuesday', 130.00), (11, 12, 'Wednesday', 130.00),
(11, 12, 'Thursday', 140.00),(11, 12, 'Friday', 170.00), (11, 12, 'Saturday', 190.00),(11, 12, 'Sunday', 150.00),
(11, 13, 'Monday', 250.00), (11, 13, 'Tuesday', 250.00), (11, 13, 'Wednesday', 250.00),
(11, 13, 'Thursday', 270.00),(11, 13, 'Friday', 320.00), (11, 13, 'Saturday', 350.00),(11, 13, 'Sunday', 280.00);

-- Reservation 13: James Lee (GuestUID=3) pre-books all 3 Suite rooms at
-- Sunrise Hotel for July 15-17, 2026, making Suite unavailable for the query.
INSERT INTO Reservation (ReservationID, GuestUID, Check_In_Date, Check_Out_Date, Address, HomePhone, MobilePhone)
VALUES (13, 3, '2026-07-15', '2026-07-17', '789 Pine Rd, NY', '718-111-1111', '718-222-2222');

INSERT INTO ReservationRoomRequest (ReservationID, TypeID, Quantity)
VALUES (13, 13, 3);

INSERT INTO RoomAssignment (AssignmentID, ReservationID, TypeID, HotelUID, RoomNumber, startDateTime, endDateTime) VALUES
(17, 13, 13, 1, 301, '2026-07-15 15:00:00', '2026-07-17 11:00:00'),
(18, 13, 13, 1, 302, '2026-07-15 15:00:00', '2026-07-17 11:00:00'),
(19, 13, 13, 1, 303, '2026-07-15 15:00:00', '2026-07-17 11:00:00');

------ Q2 support data -------------------------------------------------------
-- Mrs. Elizabeth Smith has a reservation for a Double at Grand Hotel today.
-- Mrs. Elizabeth Smith has a two-night reservation for a Double at Grand Hotel
-- (May 4-6, 2026: Monday night + Tuesday night).
-- James Lee (GuestUID=3) is currently in room 201, so it is excluded from results.
-- Spring 2026 season added for Grand Hotel; Monday ($150) and Tuesday ($165) prices
-- deliberately differ to satisfy the day-of-week pricing requirement in Q3.

INSERT INTO Guest (GuestUID, CategoryID, Name, Identification, Address, HomePhone, MobilePhone)
VALUES (12, 2, 'Elizabeth Smith', 'NY321', '10 Park Ave, NY', '212-777-1111', '212-777-2222');

INSERT INTO Reservation (ReservationID, GuestUID, Check_In_Date, Check_Out_Date, Address, HomePhone, MobilePhone)
VALUES (15, 12, '2026-05-04', '2026-05-06', '10 Park Ave, NY', '212-777-1111', '212-777-2222');

INSERT INTO ReservationRoomRequest (ReservationID, TypeID, Quantity)
VALUES (15, 22, 1);

INSERT INTO Occupies (GuestUID, HotelUID, RoomNumber)
VALUES (3, 2, 201);

INSERT INTO Season (SeasonID, HotelUID, Name, StartDate, EndDate)
VALUES (12, 2, 'Spring', '2026-03-01', '2026-05-31');

INSERT INTO RoomPrice (SeasonID, TypeID, DayOfTheWeek, Price) VALUES
(12, 22, 'Monday',    150.00),
(12, 22, 'Tuesday',   165.00),
(12, 22, 'Wednesday', 165.00),
(12, 22, 'Thursday',  180.00),
(12, 22, 'Friday',    210.00),
(12, 22, 'Saturday',  230.00),
(12, 22, 'Sunday',    170.00);