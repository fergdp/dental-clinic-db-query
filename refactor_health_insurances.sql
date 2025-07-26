-- SQL to refactor health_insurances table and create health_insurance_plans table

-- 1. Create the new health_insurance_plans table
CREATE TABLE health_insurance_plans (
    plan_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    health_insurance_id BIGINT NOT NULL,
    plan_name VARCHAR(100) NOT NULL,
    FOREIGN KEY (health_insurance_id) REFERENCES health_insurances(health_insurance_id) ON DELETE CASCADE,
    UNIQUE (health_insurance_id, plan_name) -- Ensures a health insurance doesn't have duplicate plan names
);

-- 2. Remove the 'plan' column from the health_insurances table
ALTER TABLE health_insurances
DROP COLUMN plan;

-- Optional: Add an index to the foreign key column for performance
CREATE INDEX idx_health_insurance_id ON health_insurance_plans(health_insurance_id);