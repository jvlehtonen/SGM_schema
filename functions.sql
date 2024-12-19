DELIMITER //

CREATE OR REPLACE FUNCTION foldx_prediction(val integer) RETURNS varchar(20)
BEGIN
  DECLARE pred varchar(20);
  IF val IS NULL THEN SET pred = NULL;
  ELSE
    IF val <= -200 THEN SET pred = 'Stabilizing';
    ELSEIF val <= -50 THEN SET pred = 'Ambiguous';
    ELSEIF 200 <= val THEN SET pred = 'Destabilizing';
    ELSEIF 50 <= val THEN SET pred = 'Ambiguous';
    ELSE SET pred = 'Likely Benign';
    END IF;
  END IF;
  RETURN pred;
END //

CREATE OR REPLACE FUNCTION provean_prediction(val integer) RETURNS varchar(11)
BEGIN
  DECLARE pred varchar(20);
  IF val IS NULL THEN SET pred = NULL;
  ELSE
    IF val <= -250 THEN SET pred = 'Deleterious';
    ELSE SET pred = 'Neutral';
    END IF;
  END IF;
  RETURN pred;
END //

CREATE OR REPLACE FUNCTION rosetta_prediction(val integer) RETURNS varchar(20)
BEGIN
  DECLARE pred varchar(20);
  IF val IS NULL THEN SET pred = NULL;
  ELSE
    IF val <= -200 THEN SET pred = 'Stabilizing';
    ELSEIF val <= -50 THEN SET pred = 'Ambiguous';
    ELSEIF 200 <= val THEN SET pred = 'Destabilizing';
    ELSEIF 50 <= val THEN SET pred = 'Ambiguous';
    ELSE SET pred = 'Likely Benign';
    END IF;
  END IF;
  RETURN pred;
END //

CREATE OR REPLACE FUNCTION foldetta_prediction(val integer) RETURNS varchar(20)
BEGIN
  DECLARE pred varchar(20);
  IF val IS NULL THEN SET pred = NULL;
  ELSE
    IF val <= -200 THEN SET pred = 'Stabilizing';
    ELSEIF val <= -50 THEN SET pred = 'Ambiguous';
    ELSEIF 200 <= val THEN SET pred = 'Destabilizing';
    ELSEIF 50 <= val THEN SET pred = 'Ambiguous';
    ELSE SET pred = 'Likely Benign';
    END IF;
  END IF;
  RETURN pred;
END //

CREATE OR REPLACE FUNCTION premps_prediction(val integer) RETURNS varchar(20)
BEGIN
  DECLARE pred varchar(20);
  IF val IS NULL THEN SET pred = NULL;
  ELSE
    IF val <= -100 THEN SET pred = 'Stabilizing';
    ELSEIF val < -50 THEN SET pred = 'Ambiguous';
    ELSEIF 100 <= val THEN SET pred = 'Destabilizing';
    ELSEIF 50 < val THEN SET pred = 'Ambiguous';
    ELSE SET pred = 'Likely Benign';
    END IF;
  END IF;
  RETURN pred;
END //

CREATE OR REPLACE FUNCTION alphamissense_prediction(val integer) RETURNS varchar(20)
BEGIN
  DECLARE pred varchar(18);
  IF val IS NULL THEN SET pred = NULL;
  ELSE
    IF val < 784 THEN SET pred = 'Likely Benign';
    ELSEIF 955 < val THEN SET pred = 'Likely Pathogenic';
    ELSE SET pred = 'Ambiguous';
    END IF;
  END IF;
  RETURN pred;
END //

CREATE OR REPLACE FUNCTION revel_prediction(val integer) RETURNS varchar(20)
BEGIN
  DECLARE pred varchar(18);
  IF val IS NULL THEN SET pred = NULL;
  ELSE
    IF val < 500 THEN SET pred = 'Likely Benign';
    ELSE SET pred = 'Likely Pathogenic';
    END IF;
  END IF;
  RETURN pred;
END //

DELIMITER ;
