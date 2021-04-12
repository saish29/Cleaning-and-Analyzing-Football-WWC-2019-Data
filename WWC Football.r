
# In this project code scaffolding will only be given for functions that were not 
# explained in the prerequisite courses. Look at the hints if you need help.

# Load the packages
library(dplyr)
library(readr)

# Read in the data from the datasets folder

wwc_raw <- read_csv("datasets/2019_WWCFIFA_summary.csv")

# Check the dimensions and structure of the data
dim(wwc_raw)
class(wwc_raw)
glimpse(wwc_raw)
str(wwc_raw)
summary(wwc_raw)


#These packages need to be loaded in the first @tests cell
library(testthat) 
library(IRkernel.testthat)

soln_wwc_raw <- read_csv("datasets/2019_WWCFIFA_summary.csv")

run_tests({
    test_that("the correct package is loaded", {
        expect_true("readr" %in% .packages(), 
                    info = "Did you load the readr package?")
        expect_true("dplyr" %in% .packages(), 
                    info = "Did you load the dplyr package?")
    })
    test_that("the dataset is loaded correctly", {
        expect_identical(colnames(wwc_raw), colnames(soln_wwc_raw), 
                         info = "It does not look like the dataset was loaded correctly. Check the hint if you are unsure of the problem")
        expect_equal(wwc_raw, soln_wwc_raw, 
                     info =  "It does not look like the dataset was loaded correctly. Check the hint if you are unsure of the problem")
    })
})

# Read in the data specifying column types
wwc_raw <- read_csv("datasets/2019_WWCFIFA_summary.csv",
                col_types = cols(
                                Round = col_factor(),
                                Date = col_date(format = "%m/%d/%y"),
                                Venue =  col_factor()
                                  )
                 )

# Look at the summary and structure of the data
summary(wwc_raw)
str(wwc_raw)

# Print the dataset
wwc_raw

soln_wwc_raw <- read_csv("datasets/2019_WWCFIFA_summary.csv",
                  col_types = cols(
                                  Round = col_factor(),
                                  Date = col_date(format = "%m/%d/%y"),
                                  Venue = col_factor()
                                  )
                 )

run_tests({
    test_that("the dataset is loaded correctly", {
        expect_identical(colnames(wwc_raw), colnames(soln_wwc_raw), 
                         info = "It does not look like the dataset was loaded correctly. Check the hint if you are unsure of the problem")
        expect_equal(wwc_raw, soln_wwc_raw, 
                     info =  "It does not look like the dataset was loaded correctly. Check the hint if you are unsure of the problem")
    })
})


# load the package
library(tidyr)

# Remove rows of NA
wwc_1  <- wwc_raw  %>% 
 rename_all(tolower)  %>% 
 filter(!is.na(round))

# Get the dimensions and inspect the first 10 and last 10 rows
dim(wwc_1)
head(wwc_1, 10)
tail(wwc_1, 10)

soln_wwc_1  <- soln_wwc_raw  %>% 
 rename_all(tolower)  %>% 
 filter(!is.na(round))

run_tests({
    test_that("the tidyr package is loaded", {
        expect_true("tidyr" %in% .packages(), 
                    info = "Did you load the tidyr package?")
        })
    test_that("wwc_ is correct", {
        expect_equal(wwc_1, soln_wwc_1, 
            info = "wwc_1 is not correct. Check the hint for possible solutions.")
    })
})

# Housekeeping
wwc_2  <- wwc_1

# Find, view, and replace NA in column date
index_date  <- which(is.na(wwc_2$date))
wwc_2[index_date, ]
wwc_2$date[index_date]  <- "2019-06-09"

# Find, view, and replace NA in column venue
index_venue  <- which(is.na(wwc_2$venue))
wwc_2[index_venue, ]
wwc_2$venue[index_venue]  <- "Groupama Stadium"

# Housekeeping
soln_wwc_2 <- soln_wwc_1

# Find and replace NA in column date
soln_index_date  <- which(is.na(soln_wwc_2$date))
soln_wwc_2$date[soln_index_date] <- "2019-06-09"

# Find and replace NA in column venue
soln_index_venue  <- which(is.na(soln_wwc_2$venue))
soln_wwc_2$venue[soln_index_venue] <- "Groupama Stadium"

run_tests({
    test_that("ind_dt is correct", {
        expect_equal(index_date, soln_index_date, 
            info = "ind_dt is not correct. Check the hint to make sure you used which() and is.na() correctly.")
        expect_equal(index_venue, soln_index_venue, 
            info = "ind_vn is not correct. Check the hint to make sure you used which() and is.na() correctly.")
    })
   test_that("wwc_2 is correct", {
       expect_equal(wwc_2, soln_wwc_2, 
            info = "wwc_2 is not correct. Check the hint to make sure you filled in the NAs correctly.")
   })
})

# Separate columns and replace NA (you've got this!)
wwc_3  <- wwc_2  %>% 
  separate(score, c("home_score", "away_score"), sep = "-", convert = TRUE) %>%
  separate(pks, c("home_pks", "away_pks"), sep = "-", convert = TRUE) %>%
  mutate(home_pks = replace_na(home_pks, 0), 
         away_pks = replace_na(away_pks, 0))
# Print the data
wwc_3

soln_wwc_3  <- soln_wwc_2  %>% 
  separate(score, c("home_score", "away_score"), sep =  "-", convert = TRUE)  %>% 
  separate(pks, c("home_pks", "away_pks"), sep = "-", convert = TRUE)  %>% 
  mutate(home_pks = replace_na(home_pks, 0),
         away_pks = replace_na(away_pks, 0))


run_tests({
    test_that("home_score was created and is type double", {
        expect_true("home_score" %in% names(wwc_3), 
                    info = "It looks like home_score is not a column name. Please check the hint.")
        expect_type(wwc_3$home_score, "double")
        expect_equal(sum(wwc_3$home_score), sum(soln_wwc_3$home_score),
                     info = "home_score does not sum to the correct value. Please check the hint.")
        })
    test_that("away_score was created and is type integer", {
        expect_true("away_score" %in% names(wwc_3), 
                    info = "It looks like away_score is not a column name. Please check the hint.")
        expect_true(class(wwc_3$away_score) == "integer",
                     info = "away_score should be an integer.\nNo need to call replace_na() on away_score and home_score.\n Please check the hint.")
        expect_equal(sum(wwc_3$away_score), sum(soln_wwc_3$away_score),
                     info = "away_score does not sum to the correct value. Please check the hint.")
        })
    test_that("home_pks was created and is type double", {
        expect_true("home_pks" %in% names(wwc_3), 
                    info = "It looks like home_pks is not a column name. Please check the hint.")
        expect_type(wwc_3$home_pks, "double")
        expect_equal(sum(wwc_3$home_pks), sum(soln_wwc_3$home_pks),
                     info = "home_pks does not sum to the correct value. Please check the hint.")
        })
    test_that("away_pks was created and is type double", {
        expect_true("away_pks" %in% names(wwc_3), 
                    info = "It looks like away_pks is not a column name. Please check the hint.")
        expect_type(wwc_3$away_pks, "double")
        expect_equal(sum(wwc_3$away_pks), sum(soln_wwc_3$away_pks),
                     info = "away_pks does not sum to the correct value. Please check the hint.")
        })
})

# Housekeeping for plot size
options(repr.plot.width=6, repr.plot.height=4)

# Load the package
library(ggplot2)

# Make a boxplot of attendance by venue and add the point data
ggplot(wwc_3, aes(x = venue, y = attendance)) +
geom_boxplot() +
geom_jitter(color = "red", size = 0.5) +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) 

p  <-  last_plot()

soln_p  <- ggplot(soln_wwc_3, aes(venue, attendance)) +
  geom_boxplot() +
  geom_jitter(color = "red", size = 0.5) +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) 

run_tests({
    test_that("The ggplot2 package is loaded", {
        expect_true("ggplot2" %in% .packages(), 
                    info = "Did you load the ggplot2 package?")
        })
    test_that("the plot is correct", {
        expect_identical(deparse(p$mapping$x),deparse(soln_p$mapping$x),
            info = "The x aesthetic is incorrect. Did you map it to venue? Please check the hint for a possible solution.")
        expect_identical(deparse(p$mapping$y),deparse(soln_p$mapping$y),
            info = "The y aesthetic is incorrect. Did you map it to attendance? Please check the hint for a possible solution.") 
        expect_identical(class(p$layers[[1]]$geom)[1],class(soln_p$layers[[1]]$geom)[1],
            info = "The boxplot geometry is missing. Please check the hint for a possible solution.")            
    })
})

# Print the number of games played at each venue, and the min and max attendance at each venue
wwc_3  %>% 
  group_by(venue)  %>% 
  summarize(nb_of_games = n(), 
           min_attendance = min(attendance), 
           max_attendance = max(attendance))

# Correct the outlier
wwc_4  <- wwc_3  %>% 
  mutate(attendance = replace(attendance, which(attendance == 579000), 57900))

# Print the updated summary table
wwc_venue_summary  <- wwc_4 %>% 
  group_by(venue)  %>% 
  summarize(nb_of_games = n(), 
           min_attendance = min(attendance), 
           max_attendance = max(attendance))

# Print an updated summary table 
wwc_venue_summary

soln_wwc_4  <- soln_wwc_3  %>% 
  mutate(attendance = replace(attendance, which(attendance == 579000), 57900))

soln_wwc_venue_summary  <- soln_wwc_4 %>% 
  group_by(venue)  %>% 
  summarize(nb_of_games = n(), 
           min_attendance = min(attendance), 
           max_attendance = max(attendance))

run_tests({
    test_that("wwc_4 was correctly updated", {
        expect_equal(sum(wwc_4$attendance), sum(soln_wwc_4$attendance), 
            info = "The attendance column of wwc_4 is not correct. Please check the hint." )
    })
    test_that("wwc_venue_summary is correct", {
        expect_equal(ncol(wwc_venue_summary), 4,
                     info = "wwc_venue_summary does not have the correct number of columns. Please check the hint.")
        expect_equal(max(wwc_venue_summary$attendace), max(soln_wwc_venue_summary$attendace), 
            info = "The attendance column of wwc_4 is not correct. Please check the hint." )
    })
})

# Housekeeping for plot size
options(repr.plot.width=6, repr.plot.height=4)

# Prettier boxplot of attendance data by venue
wwc_4  %>% 
  ggplot(aes(x = forcats::fct_reorder(venue, attendance), y = attendance)) +
    geom_boxplot() +
    geom_jitter(color = "red", size = 0.5) +
    coord_flip() +
    theme(axis.text.x = element_text(angle = 45, , hjust = 1)) +
    labs(title = "Distribution of attendance by stadium",
         subtitle = "2019 FIFA Women's World Cup",
         x = "Stadium", 
         y = "Attendance")

p  <- last_plot()

soln_4_bp  <- soln_wwc_4  %>% 
  ggplot(aes(forcats::fct_reorder(venue, attendance), attendance)) +
  geom_boxplot() +
  geom_jitter(color = "red", size = 0.5) +
  coord_flip() +
  theme(axis.text.x = element_text(angle = 45, , hjust = 1)) +
  labs(title = "Distribution of attendance by stadium",
       subtitle = "2019 FIFA Women's World Cup",
       x = "Stadium", 
       y = "Attendance")

run_tests({
    test_that("the plot is correct", {
        expect_identical(deparse(p$mapping$y),deparse(soln_4_bp$mapping$y),
            info = "The y aesthetic is incorrect. Did you map it to attendance? Please check the hint.") 
        expect_identical(class(p$layers[[1]]$geom)[1],class(soln_p$layers[[1]]$geom)[1],
            info = "The boxplot geometry is missing. Please check the hint for a possible solution.") 
        expect_identical(class(p$layers[[2]]$geom)[1],class(soln_p$layers[[2]]$geom)[1],
            info = "The point geometry is missing. Please check the hint for a possible solution.") 
    })
})

# Housekeeping for plot size
options(repr.plot.width=6, repr.plot.height=4)

# Line plot of attendance over time
wwc_4  %>% 
  ggplot(aes(date, attendance, color = venue)) +
   geom_line() +
  theme_minimal() +
  theme(legend.position = "bottom",
       legend.text = element_text(size = 8)) +
  guides(col = guide_legend(nrow = 3)) +
  labs(title = "Stadium attendance during the tournament",
       subtitle = "2019 FIFA Women's World Cup",
       x = "Date", 
       y = "Attendance",
      color = "") 

p  <-  last_plot()

soln_4_lp  <- soln_wwc_4  %>% 
  ggplot(aes(date, attendance, color = venue)) +
  geom_line() +
  theme(legend.position = "bottom",
       legend.text = element_text(size = 8)) +
  guides(col = guide_legend(nrow = 3)) +
  labs(title = "Stadium attendance during the tournament",
       subtitle = "2019 FIFA Women's World Cup",
       x = "Date", 
       y = "Attendance",
      color = "") 

run_tests({
    test_that("the plot is correct", {
        expect_identical(deparse(p$mapping$x),deparse(soln_4_lp$mapping$x),
            info = "The x aesthetic is incorrect. Did you map it to date? Please check the hint for a possible solution.")
        expect_identical(deparse(p$mapping$y),deparse(soln_4_lp$mapping$y),
            info = "The y aesthetic is incorrect. Did you map it to attendance? Please check the hint for a possible solution.")
         expect_identical(deparse(p$mapping$colour),deparse(soln_4_lp$mapping$colour),
            info = "The color aesthetic is incorrect. Did you map it to venue? Please check the hint for a possible solution.") 
        expect_identical(class(p$layers[[1]]$geom)[1],class(soln_4_lp$layers[[1]]$geom)[1],
            info = "The line geometry is missing. Please check the hint for a possible solution.")            
    })
})




# What match had the higest attendance?
# A: wk = SMIF, England vs. USA
# B: wk = FIN, USA vs. Netherlands
# C: wk = SMIF, Netherlands vs. Sweden

ans_1  <- "B"

# In what stadium was the match with the highest attendance played?
# A: Groupama Stadium
# B: Parc des Princes
# C: Stade des Alpes

ans_2  <- "A"

run_tests({
    test_that("ans_1 is correct", {
        expect_true(ans_1 == "B", 
            info = "The correct answer is B, the Final between the USA and the Netherlands had the greatest attendance.")
    })
    test_that("ans_2 is correct", {
        expect_true(ans_2 == "A", 
            info = "The correct answer is A, Groupama Stadium.")
    })
})
