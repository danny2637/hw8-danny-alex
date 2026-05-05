CREATE TABLE Hotel (
    HotelUID    INT          NOT NULL,
    Name        VARCHAR(100) NOT NULL,
    Street      VARCHAR(150),
    City        VARCHAR(100),
    State       VARCHAR(50),
    Zip         VARCHAR(20),
    PhoneNumber VARCHAR(20),
    PRIMARY KEY (HotelUID)
);

CREATE TABLE Season (
    SeasonID  INT         NOT NULL,
    HotelUID  INT         NOT NULL,
    Name      VARCHAR(50) NOT NULL,
    StartDate DATE        NOT NULL,
    EndDate   DATE        NOT NULL,
    PRIMARY KEY (SeasonID)
);

CREATE TABLE RoomType (
    TypeID   INT          NOT NULL,
    HotelUID INT          NOT NULL,
    Name     VARCHAR(50)  NOT NULL,
    Size     VARCHAR(50),
    Capacity INT,
    PRIMARY KEY (TypeID)
);

CREATE TABLE RoomPrice (
    SeasonID      INT           NOT NULL,
    TypeID        INT           NOT NULL,
    DayOfTheWeek  VARCHAR(10)   NOT NULL,
    Price         DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (SeasonID, TypeID, DayOfTheWeek)
);

CREATE TABLE Room (
    RoomNumber INT NOT NULL,
    HotelUID   INT NOT NULL,
    TypeID     INT NOT NULL,
    Floor      INT,
    PRIMARY KEY (HotelUID, RoomNumber)
);

CREATE TABLE GuestCategory (
    CategoryID      INT          NOT NULL,
    Name            VARCHAR(50)  NOT NULL,
    DiscountPercent DECIMAL(5,2) NOT NULL DEFAULT 0.00,
    PRIMARY KEY (CategoryID)
);

CREATE TABLE Guest (
    GuestUID       INT          NOT NULL,
    CategoryID     INT          NOT NULL,
    Name           VARCHAR(100) NOT NULL,
    Identification VARCHAR(50),
    Address        VARCHAR(200),
    HomePhone      VARCHAR(20),
    MobilePhone    VARCHAR(20),
    PRIMARY KEY (GuestUID)
);

CREATE TABLE Occupant (
    GuestUID     INT          NOT NULL,
    OccupantName VARCHAR(100) NOT NULL,
    PRIMARY KEY (GuestUID, OccupantName)
);

CREATE TABLE Reservation (
    ReservationID  INT          NOT NULL,
    GuestUID       INT          NOT NULL,
    Check_In_Date  DATE         NOT NULL,
    Check_Out_Date DATE         NOT NULL,
    Address        VARCHAR(200),
    HomePhone      VARCHAR(20),
    MobilePhone    VARCHAR(20),
    PRIMARY KEY (ReservationID)
);

CREATE TABLE ReservationRoomRequest (
    RequestID     INT NOT NULL,
    ReservationID INT NOT NULL,
    TypeID        INT NOT NULL,
    Quantity      INT NOT NULL DEFAULT 1,
    PRIMARY KEY (RequestID)
);

CREATE TABLE RoomAssignment (
    AssignmentID  INT       NOT NULL,
    RequestID     INT       NOT NULL,
    HotelUID      INT       NOT NULL,
    RoomNumber    INT       NOT NULL,
    startDateTime TIMESTAMP,
    endDateTime   TIMESTAMP,
    PRIMARY KEY (AssignmentID)
);

CREATE TABLE Occupies (
    GuestUID   INT NOT NULL,
    HotelUID   INT NOT NULL,
    RoomNumber INT NOT NULL,
    PRIMARY KEY (GuestUID, HotelUID, RoomNumber)
);

CREATE TABLE Services (
    ServiceID INT          NOT NULL,
    HotelUID  INT          NOT NULL,
    Name      VARCHAR(100) NOT NULL,
    Price     INT          NOT NULL,
    PRIMARY KEY (ServiceID)
);

CREATE TABLE ServiceUsage (
    UsageID       INT           NOT NULL,
    ReservationID INT           NOT NULL,
    ServiceID     INT           NOT NULL,
    Quantity      INT           NOT NULL DEFAULT 1,
    PriceCharged  DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (UsageID)
);

CREATE TABLE Feature_Type (
    FeatureID INT          NOT NULL,
    HotelUID  INT          NOT NULL,
    TypeID    INT          NOT NULL,
    Name      VARCHAR(100) NOT NULL,
    PRIMARY KEY (FeatureID)
);

CREATE TABLE Invoice (
    InvoiceID     INT           NOT NULL,
    ReservationID INT           NOT NULL,
    IssueDate     DATE          NOT NULL,
    TotalAmount   DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (InvoiceID)
);