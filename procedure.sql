CREATE PROCEDURE FindItemsBoughtByUser(@userID INT)
AS
BEGIN
    SELECT product.product_name
    FROM sales
    JOIN product ON sales.product_id = product.product_id
    WHERE sales.userid = @userID;
END;

EXEC FindItemsBoughtByUser @userID = 1;