# Telco Customer Churn Prediction

Predicting which customers are likely to churn (leave) a telecom company using machine learning.

---

## Project Overview

Customer churn is a critical issue for telecom companies because acquiring new customers is more expensive than retaining existing ones. This project aims to predict customer churn based on a few key features:

- **Contract type** (month-to-month, one year, two year)  
- **Dependents** (Yes/No)  
- **Monthly charges** (numeric)  

We compare two models:

1. **Logistic Regression** – interpretable, provides probability estimates.  
2. **Random Forest** – captures non-linear relationships, may improve churn detection.  

---

## Dataset

- Source: Telco customer database  
- Features used: `contract`, `dependents`, `monthlycharges`  
- Target: `churn` (Yes/No)  
- Number of samples: ~7000  

---

## Data Preprocessing

- Categorical features are **one-hot encoded**.  
- Numerical features are **standardized**.  
- Dataset is split into **80% training / 20% testing**, stratified by churn to maintain class balance.  

---

## Model Training & Evaluation

We train two models and evaluate them using:

- **Accuracy** – overall correctness  
- **Precision & Recall** – performance per class  
- **F1-score** – balance between precision and recall  
- **ROC-AUC** – ability to rank churners above non-churners  

**Key Results:**

| Model                | Recall (Churners) | ROC-AUC |
|---------------------|-----------------|---------|
| Logistic Regression  | 0.42            | 0.79    |
| Random Forest        | 0.50            | 0.72    |

> Logistic Regression ranks customers by churn probability better, while Random Forest identifies slightly more churners but with less reliable probability estimates.

---

## Insights & Recommendations

- Month-to-month contracts and higher monthly charges are associated with higher churn risk.  
- Logistic Regression is better for probability-based targeting.  
- Random Forest can be tuned (class weighting / threshold adjustment) to catch more churners.  
- Future improvements: include more features (tenure, payment method, support tickets), try XGBoost or Gradient Boosting, tune thresholds for business objectives.  

---

## Business Recomendations
- **Target High Risk Customers**: focus on retention campaigns for high risk customers 
- **Prioritise High Churn Segments**: Month to Month and high monthly charges have high risk of churning, so focusing on retetion campaigns for this segment will greatly benefit retention.
