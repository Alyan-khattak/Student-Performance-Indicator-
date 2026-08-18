# Student Performance Indicator

End-to-end ML project predicting student math scores based on demographic and academic features.

## Setup
```bash
python -m venv venv
source venv/bin/activate
pip install -r requirements.txt
pip install -e .
```

## Run
```bash
python app.py
```
Visit: http://localhost:5000

## Pipeline
Data Ingestion → Data Transformation → Model Trainer → Predict Pipeline → Flask App

## Stack
Python · scikit-learn · XGBoost · CatBoost · Flask · dill