ALTER TABLE minions_info
    ADD CONSTRAINT unique_containt -- UQ_id_email, the typo is intentional...
        UNIQUE (id, email),
    ADD CONSTRAINT banana_check -- positive_banana_check
        CHECK ( banana > 0 );