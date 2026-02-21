USE lead_scoring;
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE agent_data;
TRUNCATE TABLE agent_quota;
TRUNCATE TABLE applications;
TRUNCATE TABLE leads;
TRUNCATE TABLE marketing_leads;
TRUNCATE TABLE quotes;
SET FOREIGN_KEY_CHECKS = 1;
-- Re-enable foreign key checks after truncating the tables.