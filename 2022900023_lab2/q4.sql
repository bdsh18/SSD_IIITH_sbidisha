use iiith_lab;

DELIMITER //
CREATE PROCEDURE SendWatchTimeReport()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE subId INT;
    DECLARE cur CURSOR FOR SELECT SubscriberID FROM Subscribers;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO subId;
        IF done THEN
            LEAVE read_loop;
        END IF;
        -- Only call for subscribers who have watched something
        IF EXISTS (SELECT 1 FROM WatchHistory WHERE SubscriberID = subId) THEN
            CALL GetWatchHistoryBySubscriber(subId);
        END IF;
    END LOOP;
    CLOSE cur;
END //

DELIMITER ;
call SendWatchTimeReport();
