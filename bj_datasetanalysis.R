#BJsales dataset in R contains sales data with a leading indicator and a time series of monthly sales data (150 observations).
#Research Question: Does sales growth follow a predictable trend over time?

#Load dataset
data("BJsales")

#Convert BJsales time series into a data frame.
bj_data <- data.frame(
  Month = 1:length(BJsales),
  Sales = as.numeric(BJsales),
  Leading_Indicator = as.numeric(BJsales.lead)
)

#View first few rows of the dataset
head(bj_data)

#Generate a summary of the dataset.
summary_stats <- summary(bj_data)
print (summary_stats)

#Generate descriptive statistics.
descriptive_stats <-describe(bj_data)
print(descriptive_stats)

#Create a scatter plot of the leading indicator over time.
plot(bj_data$Month, bj_data$Leading_Indicator,
     xlab = "Time (Months)",
     ylab = "Leading Indicator",
     main = "Leading Indicator Over Time",
     col = "blue", pch = 16, type ="b")

#Adding a trend line to analyze the pattern.
abline(lm(bj_data$Leading_Indicator ~ bj_data$Month), col = "red", lwd = 2)

#Save the data to a CSV file.
write.csv(summary_stats, "summary_stats.csv")
write.csv(descriptive_stats, "descriptive_stats.csv")


