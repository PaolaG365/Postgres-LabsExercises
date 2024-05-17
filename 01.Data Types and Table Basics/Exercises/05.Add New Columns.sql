ALTER TABLE minions_info
ADD COLUMN email varchar(20),
    ADD COLUMN equipped BOOLEAN NOT NULL -- DEFAULT false;
;