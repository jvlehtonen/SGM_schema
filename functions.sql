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


CREATE OR REPLACE FUNCTION prediction_reduced(method varchar(15), val decimal(7,4)) RETURNS varchar(20)
BEGIN
  DECLARE pred varchar(20);
  SET pred = (SELECT p.reduced FROM predictions AS p WHERE p.method = method AND val < p.threshold ORDER BY p.threshold ASC LIMIT 1);
  RETURN pred;
END //


CREATE OR REPLACE FUNCTION variant2resnum(val varchar(6)) RETURNS smallint(5) unsigned
BEGIN
  DECLARE resnum int;
  SET resnum = SUBSTRING( val, 2, LENGTH(val)-2 );
  RETURN resnum;
END //


CREATE OR REPLACE FUNCTION later_residue(val varchar(20)) RETURNS varchar(6)
BEGIN
  DECLARE res varchar(6);
  DECLARE one varchar(6);
  DECLARE two varchar(6);
  DECLARE commapos int;
  DECLARE rone int;
  DECLARE rtwo int;
  SET commapos = locate(', ', val);
  IF 0 < commapos
  THEN
    SET one = substring(val, 1, commapos - 1);
    SET rone = variant2resnum(one);
    SET two = substring(val, commapos + 2);
    SET rtwo = variant2resnum(two);
    IF rone < rtwo
    THEN SET res = two;
    ELSE SET res = one;
    END IF;
  ELSE SET res = val;
  END IF;
  RETURN res;
END //


DELIMITER ;
