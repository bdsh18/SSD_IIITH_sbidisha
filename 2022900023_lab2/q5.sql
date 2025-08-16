use iiith_lab;


DELIMITER //
CREATE PROCEDURE PrintAllSubscribersWatchHistory()
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
        -- Always call for every subscriber
        CALL GetWatchHistoryBySubscriber(subId);
    END LOOP;
    CLOSE cur;
END //

DELIMITER ;
call PrintAllSubscribersWatchHistory();