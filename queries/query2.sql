-- ---------------------------------------------------------------------------------------
-- query2.sql  - Danny and Alex
--
-- Query Set 2: Checking In - find available Double rooms at Grand Hotel,
-- then assign one to Mrs. Smith's reservation and add Mr. Smith as a new occupant.
-- ---------------------------------------------------------------------------------------

------ SELECT: Double rooms at Grand Hotel that are currently unoccupied ------

SELECT   Room.RoomNumber
FROM     Room
WHERE    Room.HotelUID = 2
  AND    Room.TypeID   = 22
  AND    Room.RoomNumber NOT IN (
             SELECT Occupies.RoomNumber
             FROM   Occupies
             WHERE  Occupies.HotelUID = 2
         )
ORDER BY Room.RoomNumber;


------ INSERT: register Mr. Smith, assign room, record occupancy --------------

INSERT INTO Occupant (GuestUID, OccupantName)
VALUES (12, 'Robert Smith');

INSERT INTO RoomAssignment (AssignmentID, ReservationID, TypeID, HotelUID, RoomNumber, startDateTime, endDateTime)
VALUES (21, 15, 22, 2, 202, '2026-05-04 15:00:00', NULL);

INSERT INTO OccupantAssignment (AssignmentID, GuestUID, OccupantName)
VALUES (21, 12, 'Robert Smith');

INSERT INTO Occupies (GuestUID, HotelUID, RoomNumber)
VALUES (12, 2, 202);
