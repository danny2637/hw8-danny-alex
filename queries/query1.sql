-- ---------------------------------------------------------------------------------------
-- q1.sql  - Danny and Alex
--
-- Query Set 1: Reservations - find available room types at Sunrise Hotel for
-- July 15-17 2026 with Gold-discounted avg nightly cost, then book a new guest.
-- ---------------------------------------------------------------------------------------

------ SELECT: available room types with Gold-discounted avg nightly cost ------

WITH

SeasonForStay AS (
    SELECT SeasonID
    FROM   Season
    WHERE  HotelUID = 1
      AND  '2026-07-15' BETWEEN StartDate AND EndDate
),

NightlyPrices AS (
    SELECT RoomPrice.TypeID,
           SUM(RoomPrice.Price) AS TwoNightBase
    FROM   RoomPrice
    JOIN   SeasonForStay ON RoomPrice.SeasonID = SeasonForStay.SeasonID
    WHERE  RoomPrice.DayOfTheWeek IN ('Wednesday', 'Thursday')
    GROUP  BY RoomPrice.TypeID
),

TotalRooms AS (
    SELECT Room.TypeID,
           COUNT(*) AS Total
    FROM   Room
    WHERE  Room.HotelUID = 1
    GROUP  BY Room.TypeID
),

BookedRooms AS (
    SELECT  RoomAssignment.TypeID,
            COUNT(DISTINCT RoomAssignment.RoomNumber) AS Booked
    FROM    RoomAssignment
    JOIN    Reservation ON Reservation.ReservationID = RoomAssignment.ReservationID
    WHERE   RoomAssignment.HotelUID     = 1
      AND   Reservation.Check_In_Date  < '2026-07-17'
      AND   Reservation.Check_Out_Date > '2026-07-15'
    GROUP   BY RoomAssignment.TypeID
)

SELECT
    RoomType.TypeID,
    RoomType.Name                                                                          AS RoomType,
    RoomType.Size,
    RoomType.Capacity,
    TotalRooms.Total - COALESCE(BookedRooms.Booked, 0)                                     AS AvailableRooms,
    ROUND(NightlyPrices.TwoNightBase * (1 - (SELECT DiscountPercent FROM GuestCategory WHERE Name = 'Gold') / 100.0) / 2, 2) AS AvgCostPerNight
FROM       RoomType
JOIN       TotalRooms    ON  TotalRooms.TypeID    = RoomType.TypeID
JOIN       NightlyPrices ON  NightlyPrices.TypeID = RoomType.TypeID
LEFT JOIN  BookedRooms   ON  BookedRooms.TypeID   = RoomType.TypeID
WHERE  RoomType.HotelUID = 1
  AND  TotalRooms.Total  > COALESCE(BookedRooms.Booked, 0)
ORDER  BY AvgCostPerNight;


------ INSERT: new Gold guest and Double room reservation ----------------------

INSERT INTO Guest (GuestUID, CategoryID, Name, Identification, Address, HomePhone, MobilePhone)
VALUES (11, 2, 'Alex Thompson', 'TX999', '999 River Rd, Austin TX', '512-999-9999', '512-888-8888');

INSERT INTO Reservation (ReservationID, GuestUID, Check_In_Date, Check_Out_Date, Address, HomePhone, MobilePhone)
VALUES (14, 11, '2026-07-15', '2026-07-17', '999 River Rd, Austin TX', '512-999-9999', '512-888-8888');

INSERT INTO ReservationRoomRequest (ReservationID, TypeID, Quantity)
VALUES (14, 12, 1);

INSERT INTO RoomAssignment (AssignmentID, ReservationID, TypeID, HotelUID, RoomNumber, startDateTime, endDateTime)
VALUES (20, 14, 12, 1, 203, '2026-07-15 15:00:00', NULL);
