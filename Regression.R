---
  title: "Regression"
output: html_notebook
---
  
  # Introduction
  
  This is about regression. we are going to perform regression analysis using the marketing data of the datarium package in r.

# The data

The marketing data has 200 observations and 4 variables namely: YouTube, facebook, newspaper, and sales.

```{r echo=FALSE, results='hide'}
summary(marketing$youtube)
summary(marketing$facebook)
summary(marketing$newspaper)
summary(marketing$sales)
```

```{r}

```


```{r}
# install packages if not yet installed
library(tidyverse) # loading tidyverse
library(caret) # loading caret
theme_set(theme_bw()) # i do not know
```

```{r}
install.packages("datarium") # installing datarium
library(datarium) # loading datarium
```

```{r}
# Load the data
data("marketing", package = "datarium")
# Inspect the data
sample_n(marketing, 3)
```

```{r}
# Split the data into training and test set
set.seed(123)
training.samples <- marketing$sales %>%
  createDataPartition(p = 0.8, list = FALSE)
train.data  <- marketing[training.samples, ]
test.data <- marketing[-training.samples, ]
```

```{r}
# Build the model
model <- lm(sales ~., data = train.data)
# Summarize the model
summary(model)
# Make predictions
predictions <- model %>% predict(test.data)
# Model performance
# (a) Prediction error, RMSE
RMSE(predictions, test.data$sales)
# (b) R-square
R2(predictions, test.data$sales)
```

```{r}
# predicting with new data
# using the model
youtube <- 0
facebook <- 90
newspaper <- 0
a <- data.frame(youtube, facebook, newspaper)
p <- model %>% predict(a)
p
```
Our model is as follows:
  
  $$\hat{y} = 3.59 + 0.04x_1 + 0.19x_2 + \epsilon$$
  where $\hat{y}$ is sales and $x_1$ is youtube, and $x_2$ is facebook, $\epsilon$ is the error term.



```{r}

```
