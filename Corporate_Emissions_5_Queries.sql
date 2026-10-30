-- Query 1: Annual GHG Emissions
-- Purpose: Calculate total GHG emissions by reporting year.
-- Unit: tCO2e
SELECT
    Year,
    SUM("Emissions tCO2e") AS total_emissions_tco2e
FROM emissions
GROUP BY Year
ORDER BY Year;

-- Query 2: Annual GHG Emissions by Scope
-- Purpose: Calculate emissions by reporting year and Scope.
-- Unit: tCO2e
SELECT
    Year,scope,
    SUM("Emissions tCO2e") AS total_emissions_tco2e
FROM emissions
GROUP BY Year, scope
ORDER BY Year, scope;
-- Query 3: Annual Emissions Activity Ranking
-- Purpose: Rank activities by their GHG emissions within each year.
-- Unit: tCO2e
WITH activity_summary AS (
    SELECT
        Year,
        "Activity Name",
        SUM("Emissions tCO2e") AS activity_emissions_tco2e
    FROM emissions
    GROUP BY Year, "Activity Name"
)

SELECT
    Year,
    "Activity Name",
    activity_emissions_tco2e,
    ROW_NUMBER() OVER (
        PARTITION BY Year 
        ORDER BY activity_emissions_tco2e DESC
        ) AS Rank

FROM activity_summary
ORDER BY Year, Rank;
-- Query 4: Annual GHG Emissions and lagged comparison
-- Purpose: Compare annual emissions with the previous year.
-- Unit: tCO2e and %
WITH annual_emissions AS (
    SELECT
        Year,
        SUM("Emissions tCO2e") AS annual_emissions_tco2e
    FROM emissions
    GROUP BY Year
)

SELECT
    Year,
    annual_emissions_tco2e,

    LAG(annual_emissions_tco2e) OVER (
        ORDER BY Year
    ) AS previous_year_emissions_tco2e

FROM annual_emissions
ORDER BY Year;
-- Query 5: YoY Change Calculation
-- Purpose: Calculate the year-over-year change in emissions.
WITH annual_emissions AS (
    SELECT
        Year,
        SUM("Emissions tCO2e") AS annual_emissions_tco2e
    FROM emissions
    GROUP BY Year
),

annual_with_previous AS (
    SELECT
        Year,
        annual_emissions_tco2e,
        LAG(annual_emissions_tco2e) OVER (
            ORDER BY Year
        ) AS previous_year_emissions_tco2e
    FROM annual_emissions
)

SELECT
    Year,
    annual_emissions_tco2e,
    previous_year_emissions_tco2e,
    CASE 
        WHEN previous_year_emissions_tco2e IS NOT NULL AND previous_year_emissions_tco2e != 0 THEN
            round(100.0 * (annual_emissions_tco2e - previous_year_emissions_tco2e) / previous_year_emissions_tco2e, 2)
        ELSE NULL
    END AS YoY_change

FROM annual_with_previous
ORDER BY Year;
-- Query 6: Duplicate Record Detection
-- Purpose: Identify potentially duplicated emissions records
-- based on Year, Activity Name, Scope and Business Unit.
SELECT
    Year,
    "Activity Name",
    Scope,
    "Business Unit",
    COUNT(*) AS record_count
FROM emissions

GROUP BY Year, "Activity Name", Scope, "Business Unit"

HAVING COUNT(*) > 1;