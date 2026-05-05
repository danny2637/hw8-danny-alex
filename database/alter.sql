ALTER TABLE Season
    ADD CONSTRAINT fk_season_hotel
    FOREIGN KEY (HotelUID) REFERENCES Hotel(HotelUID);

ALTER TABLE RoomType
    ADD CONSTRAINT fk_roomtype_hotel
    FOREIGN KEY (HotelUID) REFERENCES Hotel(HotelUID);

ALTER TABLE RoomPrice
    ADD CONSTRAINT fk_roomprice_season
    FOREIGN KEY (SeasonID) REFERENCES Season(SeasonID);

ALTER TABLE RoomPrice
    ADD CONSTRAINT fk_roomprice_type
    FOREIGN KEY (TypeID) REFERENCES RoomType(TypeID);

ALTER TABLE Room
    ADD CONSTRAINT fk_room_hotel
    FOREIGN KEY (HotelUID) REFERENCES Hotel(HotelUID);

ALTER TABLE Room
    ADD CONSTRAINT fk_room_type
    FOREIGN KEY (TypeID) REFERENCES RoomType(TypeID);

ALTER TABLE HotelFeature
    ADD CONSTRAINT fk_hotelfeature_hotel
    FOREIGN KEY (HotelUID) REFERENCES Hotel(HotelUID);

ALTER TABLE Guest
    ADD CONSTRAINT fk_guest_category
    FOREIGN KEY (CategoryID) REFERENCES GuestCategory(CategoryID);

ALTER TABLE Occupant
    ADD CONSTRAINT fk_occupant_guest
    FOREIGN KEY (GuestUID) REFERENCES Guest(GuestUID);

ALTER TABLE Reservation
    ADD CONSTRAINT fk_reservation_guest
    FOREIGN KEY (GuestUID) REFERENCES Guest(GuestUID);

ALTER TABLE ReservationRoomRequest
    ADD CONSTRAINT fk_rrr_reservation
    FOREIGN KEY (ReservationID) REFERENCES Reservation(ReservationID);

ALTER TABLE ReservationRoomRequest
    ADD CONSTRAINT fk_rrr_type
    FOREIGN KEY (TypeID) REFERENCES RoomType(TypeID);

ALTER TABLE RoomAssignment
    ADD CONSTRAINT fk_assignment_request
    FOREIGN KEY (ReservationID, TypeID) REFERENCES ReservationRoomRequest(ReservationID, TypeID);

ALTER TABLE RoomAssignment
    ADD CONSTRAINT fk_assignment_room
    FOREIGN KEY (HotelUID, RoomNumber) REFERENCES Room(HotelUID, RoomNumber);

ALTER TABLE Occupies
    ADD CONSTRAINT fk_occupies_guest
    FOREIGN KEY (GuestUID) REFERENCES Guest(GuestUID);

ALTER TABLE Occupies
    ADD CONSTRAINT fk_occupies_room
    FOREIGN KEY (HotelUID, RoomNumber) REFERENCES Room(HotelUID, RoomNumber);

ALTER TABLE Services
    ADD CONSTRAINT fk_services_hotel
    FOREIGN KEY (HotelUID) REFERENCES Hotel(HotelUID);

ALTER TABLE ServiceUsage
    ADD CONSTRAINT fk_serviceusage_reservation
    FOREIGN KEY (ReservationID) REFERENCES Reservation(ReservationID);

ALTER TABLE ServiceUsage
    ADD CONSTRAINT fk_serviceusage_service
    FOREIGN KEY (ServiceID) REFERENCES Services(ServiceID);

ALTER TABLE Invoice
    ADD CONSTRAINT fk_invoice_reservation
    FOREIGN KEY (ReservationID) REFERENCES Reservation(ReservationID);

ALTER TABLE OccupantAssignment
    ADD CONSTRAINT fk_occupantassignment_assignment
    FOREIGN KEY (AssignmentID) REFERENCES RoomAssignment(AssignmentID);

ALTER TABLE OccupantAssignment
    ADD CONSTRAINT fk_occupantassignment_occupant
    FOREIGN KEY (GuestUID, OccupantName) REFERENCES Occupant(GuestUID, OccupantName);