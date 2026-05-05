-- ---------------------------------------------------------------------------------------
-- query3.sql  - Danny and Alex
--
-- Query Set 3: Checking Out - record a room service charge, check the Smiths out of
-- room 202 at Grand Hotel, and generate the billing statement for Mrs. Smith.
-- ---------------------------------------------------------------------------------------

------ INSERT: room service charge for the stay --------------------------------

INSERT INTO ServiceUsage (ReservationID, ServiceID, Quantity, PriceCharged)
VALUES (15, 4, 1, 30.00);


------ UPDATE: record checkout time on room assignment ------------------------

UPDATE RoomAssignment
SET    endDateTime = '2026-05-06 11:00:00'
WHERE  AssignmentID = 21;


------ DELETE: remove Mrs. Smith from current room occupancy ------------------

DELETE FROM Occupies
WHERE  GuestUID   = 12
  AND  HotelUID   = 2
  AND  RoomNumber = 202;


------ INSERT: create invoice for the stay ------------------------------------

INSERT INTO Invoice (InvoiceID, ReservationID, IssueDate, TotalAmount)
VALUES (7, 15, '2026-05-06', 313.50);


------ SELECT: billing statement for Mrs. Smith's stay ------------------------

WITH

SeasonForStay AS (
    SELECT SeasonID
    FROM   Season
    WHERE  HotelUID = 2
      AND  '2026-05-04' BETWEEN StartDate AND EndDate
),

NightlyCost AS (
    SELECT SUM(RoomPrice.Price) AS BaseRoomTotal
    FROM   RoomPrice
    JOIN   SeasonForStay ON RoomPrice.SeasonID = SeasonForStay.SeasonID
    WHERE  RoomPrice.TypeID        = 22
      AND  RoomPrice.DayOfTheWeek IN ('Monday', 'Tuesday')
),

ServiceCharges AS (
    SELECT GROUP_CONCAT(Services.Name SEPARATOR ', ') AS ServicesUsed,
           SUM(ServiceUsage.PriceCharged)             AS ServiceTotal
    FROM   ServiceUsage
    JOIN   Services ON Services.ServiceID = ServiceUsage.ServiceID
    WHERE  ServiceUsage.ReservationID = 15
)

SELECT
    Reservation.Check_In_Date,
    Reservation.Check_Out_Date,
    RoomType.Name                                                                                                    AS RoomType,
    ServiceCharges.ServicesUsed,
    ROUND(NightlyCost.BaseRoomTotal * (1 - GuestCategory.DiscountPercent / 100.0), 2)                               AS RoomCost,
    ServiceCharges.ServiceTotal                                                                                      AS ServiceCost,
    ROUND(NightlyCost.BaseRoomTotal * (1 - GuestCategory.DiscountPercent / 100.0) + ServiceCharges.ServiceTotal, 2) AS TotalCost
FROM       Reservation
JOIN       RoomAssignment  ON  RoomAssignment.ReservationID = Reservation.ReservationID
JOIN       RoomType        ON  RoomType.TypeID              = RoomAssignment.TypeID
JOIN       Guest           ON  Guest.GuestUID               = Reservation.GuestUID
JOIN       GuestCategory   ON  GuestCategory.CategoryID     = Guest.CategoryID
CROSS JOIN NightlyCost
CROSS JOIN ServiceCharges
WHERE  Reservation.ReservationID = 15;
