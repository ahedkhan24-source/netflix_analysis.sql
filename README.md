# netflix_analysis.sql

# Netflix Movies & TV Shows SQL Data Analysis Project

## Project Overview
This project performs an in-depth exploratory data analysis (EDA) of the Netflix titles catalog using MySQL. It leverages advanced SQL techniques—including Common Table Expressions (CTEs), window functions (`DENSE_RANK()`), string manipulation (`SUBSTRING_INDEX`, `TRIM`), date parsing (`STR_TO_DATE`), and conditional case categorization—to uncover key content distribution patterns, director metrics, and genre insights.

---

## Database & Schema Structure
* **Database Name:** `netflix_db`
* **Primary Table:** `netflix`
* **Key Columns:** `show_id` (Primary Key), `type` (Movie/TV Show), `title`, `director`, `cast_members`, `country`, `date_added`, `release_year`, `rating`, `duration`, `listed_in`, and `description`.

---

## Key Business & Analytical Questions Addressed
1. **Catalog Distribution:** Count and breakdown of total Movies vs. TV Shows.
2. **Targeted Filtering:** Identification of movies released in specific target years (e.g., 2020).
3. **Duration & Metric Extraction:** Locating the longest running movie on the platform using string parsing (`SUBSTRING_INDEX`).
4. **Temporal Analysis:** Finding content added within recent rolling timeframes (last 10 years).
5. **Director & Cast Auditing:** Filtering content by specific directors (e.g., 'S. Shankar') and cast members.
6. **Regional Content Ranking:** Using CTEs and `DENSE_RANK()` to isolate top releasing years for specific countries (e.g., India).
7. **Genre Categorization:** Segmenting content like Documentaries and auditing missing director metadata.
8. **Text Content Classification:** Using `CASE` statements to categorize text descriptions based on keyword flags ('kill'/'violence' vs 'Good').
9. **Rating Frequency Analytics:** Determining the most frequent content ratings partitioned by content type using window ranking.

---

## Repository Structure
```text
├── netflix_analysis.sql     # Complete DDL, database setup, and analytical SQL queries
└── README.md                # Project documentation and summary overview
