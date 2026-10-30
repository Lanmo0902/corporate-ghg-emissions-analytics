# Corporate GHG Emissions Analytics
### One-page Project Overview

**Project Type:** Climate Data Analytics Portfolio  
**Period:** 2024–2025  
**Tools:** Python (Pandas), SQLite / SQL, Power BI  
**Dataset:** Simulated corporate GHG emissions data

## Project Objective

Analyze corporate GHG emissions, identify major emission sources, evaluate year-over-year changes, and highlight data quality issues that may influence emissions reduction decisions.

## Key Results

| Metric | Result |
|---|---:|
| 2025 Total Emissions | 396.04 tCO₂e |
| Year-over-Year Change | −17.66% |
| Scope 3 Share | 89.54% |
| Purchased Steel Share of Scope 3 | 96.45% |

## Analytical Workflow

**Workflow A — Python & SQL**

Raw CSV → Pandas cleaning and validation → Processed CSV → SQLite → SQL analysis

**Workflow B — Power BI**

Original CSV → Power Query → DAX measures → Dashboard

The two workflows were developed separately and used to analyze the same simulated emissions dataset.

## Key Business Insights

Reported emissions decreased by 17.66% between 2024 and 2025. Scope 3 dominated the reported emissions, with purchased steel representing the largest emission source.

These findings suggest that the company should investigate steel procurement as a potential emissions reduction priority, considering cost, feasibility, and data reliability.

## Limitations

The dataset is simulated and includes incomplete Scope 3 coverage. A 10.00 tCO₂e discrepancy was identified in the 2024 purchased steel record, while a natural gas boiler activity reported in 2024 was absent in 2025. Emission-factor sources and units require further verification.

Consequently, the reported emissions decline should not be interpreted as verified evidence of successful corporate mitigation measures.

## Project Deliverables

- [Power BI Dashboard](../screenshots/dashboard_overview.png)
- [Business Findings & Recommendations](Corporate_Emissions_Business_Findings_v1.md)
- Python cleaning notebook and five standalone SQL queries (available in the project root)

*All findings are based on simulated data for educational and portfolio demonstration purposes.*

