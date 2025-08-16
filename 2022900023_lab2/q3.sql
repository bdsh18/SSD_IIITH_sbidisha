use iiith_lab;
DELIMITER //
CREATE PROCEDURE AddSubscriberIfNotExists(IN subName VARCHAR(100))
BEGIN
    DECLARE subCount INT;
    DECLARE nextID INT;

    -- Check if subscriber name already exists
    SELECT COUNT(*) INTO subCount 
    FROM Subscribers 
    WHERE SubscriberName = subName;

    IF subCount = 0 THEN
        -- Get next SubscriberID
        SELECT IFNULL(MAX(SubscriberID), 0) + 1 INTO nextID FROM Subscribers;
        -- Insert new subscriber
        INSERT INTO Subscribers (SubscriberID, SubscriberName, SubscriptionDate)
        VALUES (nextID, subName, CURDATE());
        SELECT CONCAT('Subscriber "', subName, '" added.') AS Result;
    ELSE
        SELECT CONCAT('Subscriber "', subName, '" already exists.') AS Result;
    END IF;
END //

DELIMITER ;
call  AddSubscriberIfNotExists('Bidisha Shaw');