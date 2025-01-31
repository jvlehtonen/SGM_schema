DELIMITER //

CREATE OR REPLACE FUNCTION point_mutation(val varchar(6)) RETURNS char(2)
BEGIN
  DECLARE src char(1);
  DECLARE dst char(1);
  SET src = LEFT(val, 1);
  SET dst = RIGHT(val, 1);
  RETURN CONCAT(src, dst);
END //


CREATE OR REPLACE FUNCTION prediction_text(method varchar(15), val decimal(7,4)) RETURNS varchar(20)
BEGIN
  DECLARE pred varchar(20);
  SET pred = (SELECT p.description FROM predictions AS p WHERE p.method = method AND val < p.threshold ORDER BY p.threshold ASC LIMIT 1);
  RETURN pred;
END //


DELIMITER ;
