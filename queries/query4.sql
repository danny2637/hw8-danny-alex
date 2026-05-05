-- ---------------------------------------------------------------------------------------
-- query4.sql  - Danny and Alex
--
-- Query Set 4: Find the occupants - Find the names of all people (reserver and occupants) staying in a specific room
-- on a specific date, returning each person's name and their role.
-- ---------------------------------------------------------------------------------------

------ SELECT: reserver and occupants for Hotel 1, room 101 on 2025-07-02 ----

SELECT Guest.Name                      AS Name,
       'Reserver'                      AS Role
FROM   Reservation
JOIN   RoomAssignment ON RoomAssignment.ReservationID = Reservation.ReservationID
JOIN   Guest          ON Guest.GuestUID               = Reservation.GuestUID
WHERE  RoomAssignment.HotelUID   = 1
  AND  RoomAssignment.RoomNumber = 101
  AND  '2025-07-02' BETWEEN DATE(RoomAssignment.startDateTime)
                        AND DATE(RoomAssignment.endDateTime)

UNION ALL

SELECT OccupantAssignment.OccupantName AS Name,
       'Occupant'                      AS Role
FROM   OccupantAssignment
JOIN   RoomAssignment ON RoomAssignment.AssignmentID = OccupantAssignment.AssignmentID
WHERE  RoomAssignment.HotelUID   = 1
  AND  RoomAssignment.RoomNumber = 101
  AND  '2025-07-02' BETWEEN DATE(RoomAssignment.startDateTime)
                        AND DATE(RoomAssignment.endDateTime);
