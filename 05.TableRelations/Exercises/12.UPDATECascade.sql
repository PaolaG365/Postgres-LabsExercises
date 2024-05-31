ALTER TABLE countries_rivers

ADD CONSTRAINT fk_river_id_rivers
    FOREIGN KEY (river_id)
    REFERENCES rivers(id)
    ON UPDATE CASCADE,

ADD CONSTRAINT fk_country_code_countries
    FOREIGN KEY (country_code)
    REFERENCES countries(country_code)
    ON UPDATE CASCADE

--ADD CONSTRAINT pk_countries_rivers
    --ADD PRIMARY KEY (river_id, country_code)
;