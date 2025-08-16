use iiith_lab;
DELIMITER //
CREATE PROCEDURE GetWatchHistoryBySubscriber(IN sub_id INT)
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE show_title VARCHAR(100);
    DECLARE watch_time INT;
    DECLARE cur CURSOR FOR
        SELECT s.Title, w.WatchTime
        FROM WatchHistory w
        JOIN Shows s ON w.ShowID = s.ShowID
        WHERE w.SubscriberID = sub_id;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO show_title, watch_time;
        IF done THEN
            LEAVE read_loop;
        END IF;
        -- Print the show title and watch time
        SELECT show_title AS Title, watch_time AS WatchTime;
    END LOOP;
    CLOSE cur;
END //

DELIMITER ;
call GetWatchHistoryBySubscriber(1);