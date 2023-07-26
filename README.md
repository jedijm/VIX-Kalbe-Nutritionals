# Data Science Virtual Internship Experience in Kalbe Nutritionals (Machine Learning Project)
## Project Background
Virtual Intern Experience (VIX) is an internship program from Rakamin Academy in collaboration with companies. As a Data Scientist in Kalbe Nutritionals, there is a new project from inventory and marketing division.
- Inventory Department requests a `Qty` (quantity) forecast from total all products in Kalbe.
  - Goals: To identify estimation of quantity product sales to help inventory team to prepare optimum daily stock of products.
- Marketing Department requests a customer segmentation (cluster) based on each common criterias.
  - Goals:  To categorize customers into a few clusters. The clusters will be used for a personalized promotion and sales treatment.

Dataset: Sales Data in 2022 Provided by Kalbe Nutritionals <br>
Tools:
- Python
- Jupyter Notebook
- Tableau
- Dbeaver
- PostgreSQL

The project is divided into 4 subtopics:
1. Data ingestion and Exploratory Data Analysis (EDA) with DBeaver
2. Data Visualization and Creating Dashboard with Tableau
3. Regression Time Series Analysis with ARIMA Model
4. Clustering Analysis
   

## 1. Data Ingestion and EDA with DBeaver (SQL)
1. Connect with database in PostgreSQL and import data:
<p align="center">
  <img src= "https://github.com/jedijm/VIX-Kalbe-Nutritionals/blob/main/asset/tables.png"> <br>
Fig 1. Tables of Dataset
</p> <br>
Fig 1. shows the tables that is ingested into DBeaver and will be used in this project. <br>
2. Exploratory Data Analysis
- Average of Age Based on Marital Status
<p align="center">
  <img src= "https://github.com/jedijm/VIX-Kalbe-Nutritionals/blob/main/asset/marital_status.png"> <br>
Fig 2. Average of Age Based on the Marital Status
</p> <br>
Fig 2. shows that the married customer age average is higher than the single customer. It also shows that there is a segment of customer that did not fill the marital status. <br>
- Average of Age Based on the Gender
<p align="center">
  <img src= "https://github.com/jedijm/VIX-Kalbe-Nutritionals/blob/main/asset/age_avg.png"> <br>
Fig 3. Average of Age Based on the Gender
</p> <br>
Gender 0 is Female and 1 is Male. Fig 3. shows that the female customer average age is 40 and the male customer is 39.

