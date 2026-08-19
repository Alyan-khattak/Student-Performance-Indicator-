# 🎯 Student Performance Indicator

An end-to-end machine learning project that predicts a student's **math score** based on demographic and academic features — built with a modular, production-style ML pipeline.

>production-grade ML project — defines the standard folder structure and pipeline for all future ML projects.

---

## 🚀 Live Demo

**Deployed on Railway:** [student-performance-indicator-production.up.railway.app](https://student-performance-indicator-production.up.railway.app/)

---

## 🐳 Docker

**DockerHub:** [hub.docker.com/r/alyanktk/student-performance-indicator](https://hub.docker.com/repository/docker/alyanktk/student-performance-indicator/general)

```bash
# Pull and run
docker pull alyanktk/student-performance-indicator
docker run -p 5000:5000 alyanktk/student-performance-indicator
```

Visit: http://localhost:5000

---

## 📦 Pipeline

> Data Ingestion → Data Transformation → Model Trainer → Predict Pipeline → Flask App


| Stage | What it does |
|---|---|
| Data Ingestion | Reads CSV, splits 80/20, saves raw/train/test to `artifacts/` |
| Data Transformation | Imputation, OneHotEncoding, StandardScaler — saves `preprocessor.pkl` |
| Model Trainer | Trains 9 models with GridSearchCV, saves best as `model.pkl` |
| Predict Pipeline | Loads pkl files, transforms input, returns prediction |
| Flask App | Web interface — takes form input, returns predicted math score |

---

## 🤖 Models Evaluated

Linear Regression · LassoCV · RidgeCV · KNN · Decision Tree · Random Forest · Gradient Boosting · CatBoost · AdaBoost · XGBoost

**Best Model:** LassoCV — **R² 0.88** on test set

---

## 🛠️ Setup & Run Locally

### 1. Clone the repo
```bash
git clone https://github.com/Alyan-khattak/Student-Performance-Indicator-.git
cd Student-Performance-Indicator-
```

### 2. Create virtual environment
```bash
python -m venv venv
source venv/bin/activate
```

### 3. Install dependencies
```bash
pip install -r requirements.txt
pip install -e .
```

### 4. Run the pipeline
```bash
python src/components/data_ingestion.py
```

### 5. Start the Flask app
```bash
python app.py
```

Visit: http://localhost:5000/predictdata

---

## 📁 Project Structure

```
Student_Performance_Indicator/
├── app.py # Flask web app
├── setup.py # local package install
├── requirements.txt
├── artifacts/ # generated — raw/train/test CSVs + pkl files
├── src/
│ ├── components/
│ │ ├── data_ingestion.py
│ │ ├── data_transformation.py
│ │ └── model_trainer.py
│ ├── pipeline/
│ │ └── predict_pipeline.py
│ ├── exception.py
│ ├── logger.py
│ └── utils.py
└── templates/
├── index.html
└── home.html

```


---

## 🧰 Tech Stack

`Python` `scikit-learn` `XGBoost` `CatBoost` `Flask` `pandas` `numpy` `dill` `Docker`

---

## 👤 Author

**M. Alyan Khattak** — [github.com/Alyan-khattak](https://github.com/Alyan-khattak)
