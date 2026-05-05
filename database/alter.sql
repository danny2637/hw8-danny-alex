-- Season -> Hotel
ALTER TABLE Season
    ADD CONSTRAINT fk_season_hotel
    FOREIGN KEY (HotelUID) REFERENCES Hotel(HotelUID);

-- RoomType -> Hotel
ALTER TABLE RoomType
    ADD CONSTRAINT fk_roomtype_hotel
    FOREIGN KEY (HotelUID) REFERENCES Hotel(HotelUID);

-- RoomPrice -> Season
ALTER TABLE RoomPrice
    ADD CONSTRAINT fk_roomprice_season
    FOREIGN KEY (SeasonID) REFERENCES Season(SeasonID);

-- RoomPrice -> RoomType
ALTER TABLE RoomPrice
    ADD CONSTRAINT fk_roomprice_type
    FOREIGN KEY (TypeID) REFERENCES RoomType(TypeID);

-- Room -> Hotel
ALTER TABLE Room
    ADD CONSTRAINT fk_room_hotel
    FOREIGN KEY (HotelUID) REFERENCES Hotel(HotelUID);

-- Room -> RoomType
ALTER TABLE Room
    ADD CONSTRAINT fk_room_type
    FOREIGN KEY (TypeID) REFERENCES RoomType(TypeID);

-- Guest -> GuestCategory
ALTER TABLE Guest
    ADD CONSTRAINT fk_guest_category
    FOREIGN KEY (CategoryID) REFERENCES GuestCategory(CategoryID);

-- Occupant -> Guest
ALTER TABLE Occupant
    ADD CONSTRAINT fk_occupant_guest
    FOREIGN KEY (GuestUID) REFERENCES Guest(GuestUID);

-- Reservation -> Guest
ALTER TABLE Reservation
    ADD CONSTRAINT fk_reservation_guest
    FOREIGN KEY (GuestUID) REFERENCES Guest(GuestUID);

-- ReservationRoomRequest -> Reservation
ALTER TABLE ReservationRoomRequest
    ADD CONSTRAINT fk_rrr_reservation
    FOREIGN KEY (ReservationID) REFERENCES Reservation(ReservationID);

-- ReservationRoomRequest -> RoomType
ALTER TABLE ReservationRoomRequest
    ADD CONSTRAINT fk_rrr_type
    FOREIGN KEY (TypeID) REFERENCES RoomType(TypeID);

-- RoomAssignment -> ReservationRoomRequest
ALTER TABLE RoomAssignment
    ADD CONSTRAINT fk_assignment_request
    FOREIGN KEY (RequestID) REFERENCES ReservationRoomRequest(RequestID);

-- RoomAssignment -> Room
ALTER TABLE RoomAssignment
    ADD CONSTRAINT fk_assignment_room
    FOREIGN KEY (HotelUID, RoomNumber) REFERENCES Room(HotelUID, RoomNumber);

-- Occupies -> Guest
ALTER TABLE Occupies
    ADD CONSTRAINT fk_occupies_guest
    FOREIGN KEY (GuestUID) REFERENCES Guest(GuestUID);

-- Occupies -> Room
ALTER TABLE Occupies
    ADD CONSTRAINT fk_occupies_room
    FOREIGN KEY (HotelUID, RoomNumber) REFERENCES Room(HotelUID, RoomNumber);

-- Services -> Hotel
ALTER TABLE Services
    ADD CONSTRAINT fk_services_hotel
    FOREIGN KEY (HotelUID) REFERENCES Hotel(HotelUID);

-- ServiceUsage -> Reservation
ALTER TABLE ServiceUsage
    ADD CONSTRAINT fk_serviceusage_reservation
    FOREIGN KEY (ReservationID) REFERENCES Reservation(ReservationID);

-- ServiceUsage -> Services
ALTER TABLE ServiceUsage
    ADD CONSTRAINT fk_serviceusage_service
    FOREIGN KEY (ServiceID) REFERENCES Services(ServiceID);

-- Feature_Type -> Hotel
ALTER TABLE Feature_Type
    ADD CONSTRAINT fk_featuretype_hotel
    FOREIGN KEY (HotelUID) REFERENCES Hotel(HotelUID);

-- Feature_Type -> RoomType
ALTER TABLE Feature_Type
    ADD CONSTRAINT fk_featuretype_type
    FOREIGN KEY (TypeID) REFERENCES RoomType(TypeID);

-- Invoice -> Reservation
ALTER TABLE Invoice
    ADD CONSTRAINT fk_invoice_reservation
    FOREIGN KEY (ReservationID) REFERENCES Reservation(ReservationID);