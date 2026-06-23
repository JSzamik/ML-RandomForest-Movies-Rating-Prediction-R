# Movie Industry Analytics: Trends, Success Factors & Machine Learning

A comprehensive data science project investigating the evolution of movie genres, financial success metrics, and score predictability in the film industry. The project includes extensive exploratory data analysis (EDA), statistical testing, an advanced modeling pipeline, and an interactive **R Shiny** deployment tool.

Developed by: **Jakub Szamik**


## Project Overview & Structure
This repository combines statistical modeling and deployment code to evaluate movie datasets (originating from Kaggle). The workflow is broken down across key functional modules:

1. **Exploratory & Structural Analysis (`Projekt.qmd`)**: Core code implementing data pipelines, extensive custom visualizations utilizing `patchwork` and `ggplot2`, time-series trend analysis, and geographic performance distribution.
2. **Comprehensive Report (`Raport.qmd`)**: A detailed analytical summary highlighting hypothesis checking, Welch's ANOVA tests for variations in genre scores, cluster analysis for blockbuster vs. indie segments, and structural model evaluation.
3. **Interactive Predictor App (`app.R`)**: A responsive **Shiny** application that allows real-time interactive inference of movie scores based on production inputs (Budget, Runtime, Year, Genre, and expected Votes).


## Key Methodology & Findings
- **Statistical Significance**: Welch's ANOVA test confirms statistically significant variations in average user ratings across major film genres, leading to the rejection of the null hypothesis.
- **Predictive Performance**: A **Random Forest (RF)** regression model was implemented to forecast target ratings. The model achieved an out-of-sample **RMSE of 0.656** and a **MAE of 0.472**. 
- **Feature Importance**: The primary drivers of a movie's final rating optimization were determined to be total `votes` volume, baseline production `budget`, and total `runtime`.
- **Segmentation**: Data clustering safely isolates 4 structural production segments ranging from high-budget studio blockbusters to low-profile independent features.

---

## File Directory Mapping
```text
├── Projekt.qmd          # Complete data processing, pipeline modeling, and advanced viz
├── Raport.qmd           # Structured summary report, statistical testing, and conclusions
├── app.R                # Production-ready Shiny dashboard code for model deployments
├── styles.css           # Visual layout styling definitions for compiled documents
├── movies.csv / .csv    # Cleaned target database consisting of industry variables
├── model_rf.rds         # Saved Random Forest regression model object (binary)
├── genre_levels.rds     # Serialized factors mapping categorical genre levels to the App
└── .gitignore           # Rules ensuring heavy runtime cache/build blocks stay off Git
```

---

## Setup & Execution Instructions

### Prerequisites
Ensure you have **R (>= 4.0)** and **Quarto CLI** installed on your workstation.

### Dependency Management
Install the necessary package requirements by running this block directly inside your R console:
```R
install.packages(c(
  "shiny", "randomForest", "tidyverse", "Metrics", "patchwork", 
  "dplyr", "readr", "leaflet", "htmltools", "countrycode", 
  "rnaturalearth", "rnaturalearthdata", "sf", "scales", 
  "gganimate", "gifski", "broom", "forcats"
))
```

### Launching the Dashboard App
To execute the interactive prediction interface locally, open the repository folder in your console and run:
```R
shiny::runApp("app.R")
```

### Compilation
To generate the final client-facing static HTML documentation pages:
```bash
quarto render Projekt.qmd
quarto render Raport.qmd
```
