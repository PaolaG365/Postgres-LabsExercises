CREATE VIEW view_company_chart AS
    SELECT
        cc.full_name,
        cc.job_title
    FROM company_chart AS cc
    WHERE cc.manager_id = 184;