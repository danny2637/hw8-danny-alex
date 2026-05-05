-- ---------------------------------------------------------------------------------------
-- query5.sql  - Danny and Alex
--
-- Query Set 5: Total spending over a year - for guests with at least 2 reservations across
-- at least 2 different hotels in the chain during a one-year period, find their total
-- amount spent at the chain that year.
-- ---------------------------------------------------------------------------------------

------ SELECT: total spending for qualifying guests in 2025 -------------------

WITH

QualifyingGuests AS (
    SELECT   Reservation.GuestUID
    FROM     Reservation
    JOIN     RoomAssignment ON RoomAssignment.ReservationID = Reservation.ReservationID
    WHERE    Reservation.Check_In_Date BETWEEN '2025-01-01' AND '2025-12-31'
    GROUP BY Reservation.GuestUID
    HAVING   COUNT(DISTINCT Reservation.ReservationID) >= 2
         AND COUNT(DISTINCT RoomAssignment.HotelUID)   >= 2
)

SELECT   Guest.Name,
         SUM(Invoice.TotalAmount) AS TotalSpent
FROM     Invoice
JOIN     Reservation      ON  Reservation.ReservationID  = Invoice.ReservationID
JOIN     Guest            ON  Guest.GuestUID             = Reservation.GuestUID
JOIN     QualifyingGuests ON  QualifyingGuests.GuestUID  = Guest.GuestUID
WHERE    Reservation.Check_In_Date BETWEEN '2025-01-01' AND '2025-12-31'
GROUP BY Guest.GuestUID, Guest.Name;
