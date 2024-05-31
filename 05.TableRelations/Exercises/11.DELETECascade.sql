ALTER TABLE
    countries
ADD CONSTRAINT fk_currency_code_currencies
    FOREIGN KEY (currency_code)
    REFERENCES currencies(currency_code)
    ON DELETE CASCADE,
ADD CONSTRAINT fk_continent_code_continents
    FOREIGN KEY (continent_code)
    REFERENCES continents(continent_code)
    ON DELETE CASCADE;
