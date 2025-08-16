use iiith_lab;s
DELIMITER //
CREATE PROCEDURE ListAllSubscribers()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE name VARCHAR(100);
    DECLARE cur CURSOR FOR SELECT SubscriberName FROM Subscribers;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO name;
        IF done THEN
            LEAVE read_loop;
        END IF;
        SELECT name AS SubscriberName;
    END LOOP;
    CLOSE cur;
END //
DELIMITER ;
call  ListAllSubscribers();
