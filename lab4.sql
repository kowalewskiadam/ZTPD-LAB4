
--A

CREATE TABLE FIGURY(
    ID NUMBER(1) PRIMARY KEY,
    KSZTALT MDSYS.SDO_GEOMETRY
);

--B

insert into figury values(1, MDSYS.SDO_GEOMETRY(
    2003,
    NULL,
    NULL,
    MDSYS.SDO_ELEM_INFO_ARRAY(1,1003,4),
    MDSYS.SDO_ORDINATE_ARRAY(5,3, 7,5, 5,7)
));

insert into figury values(2, MDSYS.SDO_GEOMETRY(
    2003,
    NULL,
    NULL,
    MDSYS.SDO_ELEM_INFO_ARRAY(1,1003,3),
    MDSYS.SDO_ORDINATE_ARRAY(1,1, 5,5)
));

insert into figury values(3, MDSYS.SDO_GEOMETRY(
    2002,
    NULL,
    NULL,
    MDSYS.SDO_ELEM_INFO_ARRAY(1,4,2, 1,2,1, 5,2,2),
    MDSYS.SDO_ORDINATE_ARRAY(3,2, 6,2, 7,3, 8,2, 7,1)
));

--C

insert into figury values(4, MDSYS.SDO_GEOMETRY(
    2002,
    NULL,
    NULL,
    MDSYS.SDO_ELEM_INFO_ARRAY(1,4,2, 1,2,1, 1,2,2),
    MDSYS.SDO_ORDINATE_ARRAY(3,2, 6,2, 7,3, 8,2, 7,1)
));

--D

select id, SDO_GEOM.VALIDATE_GEOMETRY_WITH_CONTEXT(ksztalt, 0.01) as VAL from figury;


--E

DELETE FROM FIGURY WHERE SDO_GEOM.VALIDATE_GEOMETRY_WITH_CONTEXT(ksztalt, 0.01) <> 'TRUE';

--F

COMMIT;
