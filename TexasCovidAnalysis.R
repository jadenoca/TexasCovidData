  library(readr)
  library(dplyr)
  library(ggplot2)
  
  covid_data = read_csv("TXCovid.csv")
  head(covid_data, 10)
  covid_data <- covid_data %>%
    select(Date_Str, Source, Total, New_Cases, Old_Cases)
  head(covid_data)
  
  houston_data <- covid_data %>%
    filter(Source == "HOU")
  covid_data$Date_Str <- as.Date(covid_data$Date_Str,format = '%m/%d/%Y')
  head(covid_data)
  harris_county <- covid_data %>%
    filter(Source == "HCTX")
  max(harris_county$Date_Str)
  head(harris_county, 200)
  visualization <- ggplot() +
                   geom_point(data = harris_county, aes(x = Date_Str, y = New_Cases, colour = Total),
                              alpha = 0.5, size = 1) +
                   geom_smooth(data = harris_county, aes(x = Date_Str, y = New_Cases), span = 0.25, col = "steelblue") +
                   labs(title = "Reported Harris County COVID-19 new cases per day over time", 
                        subtitle = "From Harris County COVID-19 Data Hub", 
                        x = "Date", y = "New Cases")
  visualization
  