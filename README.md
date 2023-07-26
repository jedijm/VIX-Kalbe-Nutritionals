# Data Science Virtual Internship Experience in Kalbe Nutritionals (Machine Learning Project)
## Project Background
Virtual Intern Experience (VIX) is an internship program from Rakamin Academy in collaboration with companies. As a Data Scientist in Kalbe Nutritionals, there is a new project from inventory and marketing division.
- Inventory Department requests a `Qty` (quantity) forecast from total all products in Kalbe.
  - Goals: To identify estimation of quantity product sales to help inventory team to prepare optimum daily stock of products.
- Marketing Department requests a customer segmentation (cluster) based on each common criterias. 
  - Goals:  To categorize customers into a few clusters. The clusters will be used for a personalized promotion and sales treatment.


**Dataset**: Sales Data in 2022 Provided by Kalbe Nutritionals <br>
**Tools**:
- Python
- Jupyter Notebook
- Tableau
- Dbeaver
- PostgreSQL

The project is divided into 4 subtopics:
1. Data ingestion and Exploratory Data Analysis (EDA) with DBeaver
2. Data Visualization and Dashboard Creation with Tableau
3. Regression Time Series Analysis with ARIMA Model
4. Clustering Analysis with K-Means
   

## 1. Data Ingestion and EDA with DBeaver (SQL)
### 1. Connect with database in PostgreSQL and import data
<p align="center">
  <img src= "https://github.com/jedijm/VIX-Kalbe-Nutritionals/blob/main/asset/tables.png"> <br>
Fig 1. Tables of Dataset
</p> <br>
Fig 1. shows the tables that are ingested into DBeaver and will be used in this project. <br>

### 2. Exploratory Data Analysis

- **Average of Age Based on Marital Status**
<p align="center">
  <img src= "https://github.com/jedijm/VIX-Kalbe-Nutritionals/blob/main/asset/marital_status.png"> <br>
Fig 2. Average of Age Based on the Marital Status
</p> <br>
Fig 2. shows that the married customer age average is higher than the single customer. It also shows that there is a segment of customer that did not fill the marital status.


- **Average of Age Based on the Gender**
<p align="center">
  <img src= "https://github.com/jedijm/VIX-Kalbe-Nutritionals/blob/main/asset/age_avg.png"> <br>
Fig 3. Average of Age Based on the Gender
</p> 

**Gender 0 is Female and 1 is Male.** Fig 3. shows that the female customer average age is 40 and the male customer is 39.


- **Store with the Highest Total Quantity Sales**
<p align="center">
  <img src= "https://github.com/jedijm/VIX-Kalbe-Nutritionals/blob/main/asset/highest_store.png"> <br>
Fig 4. Highest Quantity Sales Store Name
</p> <br>
Fig 4. shows the store with highest quantity sales amongst all stores. Lingga Store has 2777 total quantity sales in 2022. 


- **Product with the Highest Total Amount Sales**
<p align="center">
  <img src= "https://github.com/jedijm/VIX-Kalbe-Nutritionals/blob/main/asset/highest_product.png"> <br>
Fig 5. Highest Total Amount Product
</p>

Figure above shows the best selling product (product with highest `TotalAmount`). Cheese Stick total amount is Rp.27.615.000 in 2022.


## 2. Data Visualization and Dashboard Creation with Tableau 
[Open in Tableau Public](https://public.tableau.com/views/VIX_Kalbe/Dashboard?:language=en-US&publish=yes&:display_count=n&:origin=viz_share_link)
<p align="center">
  <img src= "https://github.com/jedijm/VIX-Kalbe-Nutritionals/blob/main/asset/Dashboard.png"> <br>
Fig 6. Kalbe Nutritionals Sales Data Dashboard in 2022
</p>

It can be summarize from the dashboard above that:
- The monthly `Quantity` sales tends to be higher in the first half of the year, except in February.
- The daily `Total Amount` sales vary through the month with its peak at the first day of the month.
- Store with highest `Total Amount` sales is **Lingga Store** with significant difference with other store and the least is **Buana Indah Store**.
- Product with highest `Quantity` sales is **Thai Tea** and conversely the least is **Cashew**.

## Data Pre-Processing for Machine Learning
Read and merge all the data into one dataset, treat the data:

**Table 1. Data Pre-Processing Treatment** <br>
**No**  |     **Treatment**      |    **Findings**     |    **Actions**     |
:-----: |    ----------------    |    ------------     |--------------------|
1 | Handling Missing Values | 44 missing values in `Marital Status` | Drop the rows due to the insignificant size |
2 | Convert Irrelevant Data Type | 1. `Latitude` & `Longitude` datatype is object <br> 2. Date datatype is object | 1. `Latitude` & `Longitude` is converted to float <br> 2. `Date` is converted to datatime |
3 | Drop Irrelevant Values | `Price_y` and `Price_x` consisted of same values | Drop one column (`Price_y`) |
4 | Duplicated Values | - | - |


## 3. Regression Time Series Analysis with ARIMA Model

**1. Subset the data grouped by `Date` with sum of `Qty`**
<p align="center">
  <img src= "https://github.com/jedijm/VIX-Kalbe-Nutritionals/blob/main/asset/groupby_date.png"> <br>
Fig 6. Regression Data Subset
</p>

**2. Split Data Train and Data Test**
<p align="center">
  <img src= "https://github.com/jedijm/VIX-Kalbe-Nutritionals/blob/main/asset/split_data.png"> <br>
Fig 7. Split Data Train and Data Test
</p>

I used 85:15 ratio of data train and data test to get the best model performance.

**3. Stationary Check**

The data has to be stationary to use ARIMA model.
<p align="center">
  <img src= "https://github.com/jedijm/VIX-Kalbe-Nutritionals/blob/main/asset/stationary_check.png"> <br>
Fig 8. Stationary Check
</p>
P-Value < 0.05 shows that the data is stationary and valid to continue the analysis.


**4. Autocorrelation and Partial Autocorrelation**
<p align="center">
  <img src= "https://github.com/jedijm/VIX-Kalbe-Nutritionals/blob/main/asset/acf_pcf.png"> <br>
Fig 9. Autocorrelation and Partial Autocorrelation
</p>
The Autocorrelation graph (ACF) shows that the p order is 2 because the first and second lag is significantly out of the significant limit,
meanwhile the Partial Autocorrelation graph (PCF) shows that the q order is 3 due to the significant correlation of the first until third lag.

**5. Modelling**

In this section, I use 3 method to build the best ARIMA model specifically to identify the best order (p,d,q):
- Auto-fit ARIMA
- Hyperparameter Tuning (with iteration)
- Manual Hyperparameter Tuning

**Table 2. Hypeparameter Tuning ARIMA Models**

**Methods** | **Order (p,d,q)** | **Evaluation Metrics (MAE, MAPE, RMSE)** |
:-----:     | ----------------  |    --------------------------- |
Auto-fit ARIMA | (1,0,1) | (12.9513, 0.3433, 16.0013) |
Iterative Hyperparameter Tuning | (0, 1, 1) | (12.9755, 0.3443, 16.0214) |
Manual Hyperparameter Tuning | (40, 2, 2) | (11.7652, 0.293, 15.4831) |

<p align="center">
  <img src= "https://github.com/jedijm/VIX-Kalbe-Nutritionals/blob/main/asset/forecast_predict.png"> <br>
Fig 10. Predict data test and validate with real data
</p>

From the table and figure above, it can be concluded that the best model performance is shown by Manual Hyperparameter Tuning. The Evaluation Metrics in Table 2. shows a significant difference with other methods and the line graph shows a more similar pattern of the prediction.

Thus, the ARIMA model with order (40,2,2) is used to forecast data for a month ahead of the data test which is January 1st-31st 2023.


<p align="center">
  <img src= "https://github.com/jedijm/VIX-Kalbe-Nutritionals/blob/main/asset/forecast_sales.png"> <br>
Fig 11. Quantity Sales Forecast in January 2023
</p>

To be more exact, we can see the statistical description of the forecast data:

<p align="center">
  <img src= "https://github.com/jedijm/VIX-Kalbe-Nutritionals/blob/main/asset/describe_forecast.png"> <br>
Fig 12. Forecast data statistical description
</p>

The average of quantity sales forecast in January 2023 is rounded to approximately 44 pcs/day. 

## Recommendation

- Inventory Division
Manage the stocks and inventory space to be adjusted to the forecast.
- Marketing Division
Build a strategy to get higher sales from the forecast.

## 4. Clustering Analysis with K-Means

**1. Subset Data for Clustering Analysis**

<p align="center">
  <img src= "https://github.com/jedijm/VIX-Kalbe-Nutritionals/blob/main/asset/data_cluster.png"> <br>
Fig 13. Subset Data for Clustering Analysis
</p>

In this analysis, the data is selected into these 4 features: `CustomerID`, `TransactionID`, `Quantity`, `TotalAmount`. Because the data cleansing is already done before, we can focus on the clustering analysis directly.

**2. Determine the K for the K-Means Model**

<p align="center">
  <img src= "https://github.com/jedijm/VIX-Kalbe-Nutritionals/blob/main/asset/yellowbrick_elbow.png"> <br>
Fig 14. Elbow Method to determine K
</p>

**3. Silhouette Score**

<p align="center">
  <img src= "https://github.com/jedijm/VIX-Kalbe-Nutritionals/blob/main/asset/silhouette_score.png"> <br>
Fig 15. Silhouette Score Analysis
</p>

From Fig 14. and Fig 15. it can be seen that the best K for K-Means model in this project is 4 (**K = 4**), which means the customers will be divided into 4 clusters.

**4. Distribution Visualization from Each Clusters**

<p align="center">
  <img src= "https://github.com/jedijm/VIX-Kalbe-Nutritionals/blob/main/asset/pairplot_cluster.png"> <br>
Fig 16. Pairplot of the Clusters
</p>

Figure above shows the distribution of clusters from each features. Cluster 3 (purple) dominates in every features while the least is cluster 0 (red).

**5. Characteristics of Each Clusters**

<p align="center">
  <img src= "https://github.com/jedijm/VIX-Kalbe-Nutritionals/blob/main/asset/cluster_table.png"> <br>
Fig 17. Average of each metrics in every clusters
</p>

### Summary & Recommendations
* **Cluster 3** <br>
  - Cluster with the highest number of customers.
  - Customer characteristics rank third in each metric (transaction, quantity, total amount).
<br> **Recommendations**:
    - Build good relationships with customers.
    - Conduct surveys to develop the interests of the most numerous customers.
* **Cluster 2** <br>
  - Customer characteristics rank second highest in each metric.
<br> **Recommendations**:
    - Provide regular promotions to increase transactions.
    - Perform upselling of high-priced products.
* **Cluster 1** <br>
  - Customer characteristics with the lowest values in each metric.
<br> **Recommendations**:
    - Provide significant discounts to increase customer transactions.
    - Offer promotions on transactions with higher quantities.
    - Conduct surveys to identify product development potential.
* **Cluster 0** <br>
  - Cluster with the fewest number of customers.
  - Customer characteristics with the highest values in each metric.
<br> **Recommendations**:
    - Offer loyalty promotions to retain transactions.
    - Conduct customer satisfaction surveys.
    - Perform upselling of higher-priced products.


