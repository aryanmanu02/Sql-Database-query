drop table audit_log
create table audit_log (user_id int, product_id int, timestamp datetime)

CREATE TRIGGER SalesAuditTrigger
ON sales
AFTER INSERT
AS
BEGIN
    DECLARE @UserID INT, @ProductID INT;
    SELECT @UserID = i.userid, @ProductID = i.product_id
    FROM INSERTED i;

    INSERT INTO audit_log (user_id, product_id, timestamp)
    VALUES (@UserID, @ProductID, GETDATE());
END;


INSERT INTO sales (userid, product_id) VALUES (2,4);

select * from audit_log

DROP TRIGGER SalesAuditTrigger;