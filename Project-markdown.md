
## 1. Importing data part 1
<p>What an exciting <a href="https://www.fifa.com/womensworldcup/">FIFA Women's World Cup</a>! Congratulations to the <a href="https://www.ussoccer.com/teams/uswnt">US Women's National Team</a> and to all the <a href="https://www.fifa.com/womensworldcup/teams/">national teams</a> who made the tournament such a great event!</p>
<p><img src="https://assets.datacamp.com/production/project_758/img/football_soccer.jpg" alt="football">
<em>Source: <a href="https://commons.wikimedia.org/wiki/File:Football_pictogram.svg">Wikimedia Commons</a></em></p>
<p>Now that the tournament is over, our boss at <em>Crunching Numbers</em> needs to know which match/stadium had the highest attendance during the women's world cup. Thankfully, one of our trusty interns, Bob, already has the data for us. After chatting with Bob about his football (soccer in the US) obsession, we learned that he collected the data by either watching the games or reading the <a href="https://www.fifa.com/womensworldcup/matches/?#groupphase">FIFA Women's World Cup match reports</a>. He manually entered the data into a flat file (.csv) and emailed it to us.</p>
<p>Let's read in the file and explore the raw data!</p>


```R
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

```

    Parsed with column specification:
    cols(
      Round = [31mcol_character()[39m,
      Wk = [31mcol_character()[39m,
      Day = [31mcol_character()[39m,
      Date = [31mcol_character()[39m,
      Time = [34mcol_time(format = "")[39m,
      Home = [31mcol_character()[39m,
      Score = [31mcol_character()[39m,
      PKS = [31mcol_character()[39m,
      Away = [31mcol_character()[39m,
      Attendance = [32mcol_double()[39m,
      Venue = [31mcol_character()[39m,
      Referee = [31mcol_character()[39m,
      Notes = [31mcol_character()[39m
    )



<ol class=list-inline>
	<li>55</li>
	<li>13</li>
</ol>




<ol class=list-inline>
	<li>'spec_tbl_df'</li>
	<li>'tbl_df'</li>
	<li>'tbl'</li>
	<li>'data.frame'</li>
</ol>



    Rows: 55
    Columns: 13
    $ Round      [3m[38;5;246m<chr>[39m[23m "Group stage", "Group stage", "Group stage", "Group stag...
    $ Wk         [3m[38;5;246m<chr>[39m[23m "1", "1", "1", "1", "1", "1", "1", "1", "1", "1", "1", "...
    $ Day        [3m[38;5;246m<chr>[39m[23m "Fri", "Sat", "Sat", "Sat", "Sun", "Sun", "Sun", "Mon", ...
    $ Date       [3m[38;5;246m<chr>[39m[23m "06/07/19", "06/08/19", "06/08/19", "06/08/19", "06/09/1...
    $ Time       [3m[38;5;246m<time>[39m[23m 21:00:00, 15:00:00, 18:00:00, 21:00:00, 13:00:00, 15:30...
    $ Home       [3m[38;5;246m<chr>[39m[23m "France", "Germany", "Spain", "Norway", "Australia", "Br...
    $ Score      [3m[38;5;246m<chr>[39m[23m "4 - 0", "1 - 0", "3 - 1", "3 - 0", "1 - 2", "3 - 0", "2...
    $ PKS        [3m[38;5;246m<chr>[39m[23m NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, ...
    $ Away       [3m[38;5;246m<chr>[39m[23m "Korea Rep", "China PR", "South Africa", "Nigeria", "Ita...
    $ Attendance [3m[38;5;246m<dbl>[39m[23m 45261, 15283, 12044, 11058, 15380, 17668, 13188, 25055, ...
    $ Venue      [3m[38;5;246m<chr>[39m[23m "Parc des Princes", "Roazhon Park", "Stade Oceane", "Sta...
    $ Referee    [3m[38;5;246m<chr>[39m[23m "Claudia Umpierrez", "Marie-Soleil Beaudoin", "Maria Car...
    $ Notes      [3m[38;5;246m<chr>[39m[23m NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, ...
    tibble [55 x 13] (S3: spec_tbl_df/tbl_df/tbl/data.frame)
     $ Round     : chr [1:55] "Group stage" "Group stage" "Group stage" "Group stage" ...
     $ Wk        : chr [1:55] "1" "1" "1" "1" ...
     $ Day       : chr [1:55] "Fri" "Sat" "Sat" "Sat" ...
     $ Date      : chr [1:55] "06/07/19" "06/08/19" "06/08/19" "06/08/19" ...
     $ Time      : 'hms' num [1:55] 21:00:00 15:00:00 18:00:00 21:00:00 ...
      ..- attr(*, "units")= chr "secs"
     $ Home      : chr [1:55] "France" "Germany" "Spain" "Norway" ...
     $ Score     : chr [1:55] "4 - 0" "1 - 0" "3 - 1" "3 - 0" ...
     $ PKS       : chr [1:55] NA NA NA NA ...
     $ Away      : chr [1:55] "Korea Rep" "China PR" "South Africa" "Nigeria" ...
     $ Attendance: num [1:55] 45261 15283 12044 11058 15380 ...
     $ Venue     : chr [1:55] "Parc des Princes" "Roazhon Park" "Stade Oceane" "Stade Auguste-Delaune II" ...
     $ Referee   : chr [1:55] "Claudia Umpierrez" "Marie-Soleil Beaudoin" "Maria Carvajal" "Kate Jacewicz" ...
     $ Notes     : chr [1:55] NA NA NA NA ...
     - attr(*, "spec")=
      .. cols(
      ..   Round = [31mcol_character()[39m,
      ..   Wk = [31mcol_character()[39m,
      ..   Day = [31mcol_character()[39m,
      ..   Date = [31mcol_character()[39m,
      ..   Time = [34mcol_time(format = "")[39m,
      ..   Home = [31mcol_character()[39m,
      ..   Score = [31mcol_character()[39m,
      ..   PKS = [31mcol_character()[39m,
      ..   Away = [31mcol_character()[39m,
      ..   Attendance = [32mcol_double()[39m,
      ..   Venue = [31mcol_character()[39m,
      ..   Referee = [31mcol_character()[39m,
      ..   Notes = [31mcol_character()[39m
      .. )



        Round                Wk                Day                Date          
     Length:55          Length:55          Length:55          Length:55         
     Class :character   Class :character   Class :character   Class :character  
     Mode  :character   Mode  :character   Mode  :character   Mode  :character  
                                                                                
                                                                                
                                                                                
                                                                                
         Time              Home              Score               PKS           
     Length:55         Length:55          Length:55          Length:55         
     Class1:hms        Class :character   Class :character   Class :character  
     Class2:difftime   Mode  :character   Mode  :character   Mode  :character  
     Mode  :numeric                                                            
                                                                               
                                                                               
                                                                               
         Away             Attendance        Venue             Referee         
     Length:55          Min.   :  8009   Length:55          Length:55         
     Class :character   1st Qu.: 13476   Class :character   Class :character  
     Mode  :character   Median : 18934   Mode  :character   Mode  :character  
                        Mean   : 31777                                        
                        3rd Qu.: 22941                                        
                        Max.   :579000                                        
                        NA's   :3                                             
        Notes          
     Length:55         
     Class :character  
     Mode  :character  
                       
                       
                       
                       



```R
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
```

    Parsed with column specification:
    cols(
      Round = [31mcol_character()[39m,
      Wk = [31mcol_character()[39m,
      Day = [31mcol_character()[39m,
      Date = [31mcol_character()[39m,
      Time = [34mcol_time(format = "")[39m,
      Home = [31mcol_character()[39m,
      Score = [31mcol_character()[39m,
      PKS = [31mcol_character()[39m,
      Away = [31mcol_character()[39m,
      Attendance = [32mcol_double()[39m,
      Venue = [31mcol_character()[39m,
      Referee = [31mcol_character()[39m,
      Notes = [31mcol_character()[39m
    )







    2/2 tests passed


## 2. Importing data part 2
<p>Looking at the outputs, we notice a few things about the data. First, we have some <code>NA</code>s to address. Second, most of the columns are of type <code>character</code>. One of the differences between <code>read_csv()</code> (<code>readr</code>) and <code>read.csv()</code> (<code>utils</code>) is how character strings are treated. With <code>read.csv()</code> strings are coerced to factors, while in <code>read_csv()</code> strings are not coerced. Let's import the data again, but this time, we will assign data types to the <code>Round</code>, <code>Date</code>, and <code>Venue</code> columns. </p>
<p><br></p>
<p><strong>Instructor's note</strong>: My apologies for several incorrect spellings. Stade Oceane should be <em>Stade Océane</em>. The correct spellings of the names of the referees are <em>Stéphanie Frappart</em>, <em>Katalin Kulcsár</em>, and <em>Claudia Umpiérrez</em>. Accents are not currently supported in Jupyter Notebook outputs on DataCamp and had to be removed from the data file. </p>


```R
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
```


                 Round         Wk                Day           
     Group stage    :36   Length:55          Length:55         
     Round of 16    : 8   Class :character   Class :character  
     Quarterfinals  : 4   Mode  :character   Mode  :character  
     Semifinals     : 2                                        
     3rd-place match: 1                                        
     Final          : 1                                        
     NA's           : 3                                        
          Date                Time              Home              Score          
     Min.   :2019-06-07   Length:55         Length:55          Length:55         
     1st Qu.:2019-06-12   Class1:hms        Class :character   Class :character  
     Median :2019-06-17   Class2:difftime   Mode  :character   Mode  :character  
     Mean   :2019-06-18   Mode  :numeric                                         
     3rd Qu.:2019-06-23                                                          
     Max.   :2019-07-07                                                          
     NA's   :4                                                                   
         PKS                Away             Attendance    
     Length:55          Length:55          Min.   :  8009  
     Class :character   Class :character   1st Qu.: 13476  
     Mode  :character   Mode  :character   Median : 18934  
                                           Mean   : 31777  
                                           3rd Qu.: 22941  
                                           Max.   :579000  
                                           NA's   :3       
                          Venue      Referee             Notes          
     Parc des Princes        : 7   Length:55          Length:55         
     Roazhon Park            : 7   Class :character   Class :character  
     Stade Oceane            : 7   Mode  :character   Mode  :character  
     Stade Auguste-Delaune II: 6                                        
     Stade du Hainaut        : 6                                        
     (Other)                 :18                                        
     NA's                    : 4                                        


    tibble [55 x 13] (S3: spec_tbl_df/tbl_df/tbl/data.frame)
     $ Round     : Factor w/ 6 levels "Group stage",..: 1 1 1 1 1 1 1 1 1 1 ...
     $ Wk        : chr [1:55] "1" "1" "1" "1" ...
     $ Day       : chr [1:55] "Fri" "Sat" "Sat" "Sat" ...
     $ Date      : Date[1:55], format: "2019-06-07" "2019-06-08" ...
     $ Time      : 'hms' num [1:55] 21:00:00 15:00:00 18:00:00 21:00:00 ...
      ..- attr(*, "units")= chr "secs"
     $ Home      : chr [1:55] "France" "Germany" "Spain" "Norway" ...
     $ Score     : chr [1:55] "4 - 0" "1 - 0" "3 - 1" "3 - 0" ...
     $ PKS       : chr [1:55] NA NA NA NA ...
     $ Away      : chr [1:55] "Korea Rep" "China PR" "South Africa" "Nigeria" ...
     $ Attendance: num [1:55] 45261 15283 12044 11058 15380 ...
     $ Venue     : Factor w/ 9 levels "Parc des Princes",..: 1 2 3 4 5 6 7 1 8 3 ...
     $ Referee   : chr [1:55] "Claudia Umpierrez" "Marie-Soleil Beaudoin" "Maria Carvajal" "Kate Jacewicz" ...
     $ Notes     : chr [1:55] NA NA NA NA ...
     - attr(*, "spec")=
      .. cols(
      ..   Round = [31mcol_factor(levels = NULL, ordered = FALSE, include_na = FALSE)[39m,
      ..   Wk = [31mcol_character()[39m,
      ..   Day = [31mcol_character()[39m,
      ..   Date = [34mcol_date(format = "%m/%d/%y")[39m,
      ..   Time = [34mcol_time(format = "")[39m,
      ..   Home = [31mcol_character()[39m,
      ..   Score = [31mcol_character()[39m,
      ..   PKS = [31mcol_character()[39m,
      ..   Away = [31mcol_character()[39m,
      ..   Attendance = [32mcol_double()[39m,
      ..   Venue = [31mcol_factor(levels = NULL, ordered = FALSE, include_na = FALSE)[39m,
      ..   Referee = [31mcol_character()[39m,
      ..   Notes = [31mcol_character()[39m
      .. )



<table>
<caption>A spec_tbl_df: 55 x 13</caption>
<thead>
	<tr><th scope=col>Round</th><th scope=col>Wk</th><th scope=col>Day</th><th scope=col>Date</th><th scope=col>Time</th><th scope=col>Home</th><th scope=col>Score</th><th scope=col>PKS</th><th scope=col>Away</th><th scope=col>Attendance</th><th scope=col>Venue</th><th scope=col>Referee</th><th scope=col>Notes</th></tr>
	<tr><th scope=col>&lt;fct&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;date&gt;</th><th scope=col>&lt;time&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;fct&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th></tr>
</thead>
<tbody>
	<tr><td>Group stage    </td><td>1   </td><td>Fri</td><td>2019-06-07</td><td>21:00:00</td><td>France      </td><td>4 - 0 </td><td>NA   </td><td>Korea Rep   </td><td> 45261</td><td>Parc des Princes        </td><td>Claudia Umpierrez     </td><td>NA                                              </td></tr>
	<tr><td>Group stage    </td><td>1   </td><td>Sat</td><td>2019-06-08</td><td>15:00:00</td><td>Germany     </td><td>1 - 0 </td><td>NA   </td><td>China PR    </td><td> 15283</td><td>Roazhon Park            </td><td>Marie-Soleil Beaudoin </td><td>NA                                              </td></tr>
	<tr><td>Group stage    </td><td>1   </td><td>Sat</td><td>2019-06-08</td><td>18:00:00</td><td>Spain       </td><td>3 - 1 </td><td>NA   </td><td>South Africa</td><td> 12044</td><td>Stade Oceane            </td><td>Maria Carvajal        </td><td>NA                                              </td></tr>
	<tr><td>Group stage    </td><td>1   </td><td>Sat</td><td>2019-06-08</td><td>21:00:00</td><td>Norway      </td><td>3 - 0 </td><td>NA   </td><td>Nigeria     </td><td> 11058</td><td>Stade Auguste-Delaune II</td><td>Kate Jacewicz         </td><td>NA                                              </td></tr>
	<tr><td>Group stage    </td><td>1   </td><td>Sun</td><td>2019-06-09</td><td>13:00:00</td><td>Australia   </td><td>1 - 2 </td><td>NA   </td><td>Italy       </td><td> 15380</td><td>Stade du Hainaut        </td><td>Melissa Borjas        </td><td>NA                                              </td></tr>
	<tr><td>Group stage    </td><td>1   </td><td>Sun</td><td>NA</td><td>15:30:00</td><td>Brazil      </td><td>3 - 0 </td><td>NA   </td><td>Jamaica     </td><td> 17668</td><td>Stade des Alpes         </td><td>Riem Hussein          </td><td>NA                                              </td></tr>
	<tr><td>Group stage    </td><td>1   </td><td>Sun</td><td>2019-06-09</td><td>18:00:00</td><td>England     </td><td>2 - 1 </td><td>NA   </td><td>Scotland    </td><td> 13188</td><td>Stade de Nice           </td><td>Jana Adamkova         </td><td>NA                                              </td></tr>
	<tr><td>Group stage    </td><td>1   </td><td>Mon</td><td>2019-06-10</td><td>18:00:00</td><td>Argentina   </td><td>0 - 0 </td><td>NA   </td><td>Japan       </td><td> 25055</td><td>Parc des Princes        </td><td>Stephanie Frappart    </td><td>NA                                              </td></tr>
	<tr><td>Group stage    </td><td>1   </td><td>Mon</td><td>2019-06-10</td><td>21:00:00</td><td>Canada      </td><td>1 - 0 </td><td>NA   </td><td>Cameroon    </td><td> 10710</td><td>Stade de la Mosson      </td><td>Ri Hyang Ok           </td><td>NA                                              </td></tr>
	<tr><td>Group stage    </td><td>1   </td><td>Tue</td><td>2019-06-11</td><td>15:00:00</td><td>New Zealand </td><td>0 - 1 </td><td>NA   </td><td>Netherlands </td><td> 10654</td><td>Stade Oceane            </td><td>Edina Alves Batista   </td><td>NA                                              </td></tr>
	<tr><td>Group stage    </td><td>1   </td><td>Tue</td><td>2019-06-11</td><td>18:00:00</td><td>Chile       </td><td>0 - 2 </td><td>NA   </td><td>Sweden      </td><td> 15875</td><td>Roazhon Park            </td><td>Lucila Venegas        </td><td>NA                                              </td></tr>
	<tr><td>Group stage    </td><td>1   </td><td>Tue</td><td>2019-06-11</td><td>21:00:00</td><td>USA         </td><td>13 - 0</td><td>NA   </td><td>Thailand    </td><td> 18591</td><td>Stade Auguste-Delaune II</td><td>Laura Fortunato       </td><td>NA                                              </td></tr>
	<tr><td>NA             </td><td>NA  </td><td>NA </td><td>NA</td><td>      NA</td><td>NA          </td><td>NA    </td><td>NA   </td><td>NA          </td><td>    NA</td><td>NA                      </td><td>NA                    </td><td>NA                                              </td></tr>
	<tr><td>Group stage    </td><td>2   </td><td>Wed</td><td>2019-06-12</td><td>15:00:00</td><td>Nigeria     </td><td>2 - 0 </td><td>NA   </td><td>Korea Rep   </td><td> 11252</td><td>Stade des Alpes         </td><td>Anastasia Pustovoitova</td><td>NA                                              </td></tr>
	<tr><td>Group stage    </td><td>2   </td><td>Wed</td><td>2019-06-12</td><td>18:00:00</td><td>Germany     </td><td>1 - 0 </td><td>NA   </td><td>Spain       </td><td> 20761</td><td>Stade du Hainaut        </td><td>Kateryna Monzul       </td><td>NA                                              </td></tr>
	<tr><td>Group stage    </td><td>2   </td><td>Wed</td><td>2019-06-12</td><td>21:00:00</td><td>France      </td><td>2 - 1 </td><td>NA   </td><td>Norway      </td><td> 34872</td><td>Stade de Nice           </td><td>Bibiana Steinhaus     </td><td>NA                                              </td></tr>
	<tr><td>Group stage    </td><td>2   </td><td>Thu</td><td>2019-06-13</td><td>18:00:00</td><td>Australia   </td><td>3 - 2 </td><td>NA   </td><td>Brazil      </td><td> 17032</td><td>Stade de la Mosson      </td><td>Esther Staubli        </td><td>NA                                              </td></tr>
	<tr><td>Group stage    </td><td>2   </td><td>Thu</td><td>2019-06-13</td><td>21:00:00</td><td>South Africa</td><td>0 - 1 </td><td>NA   </td><td>China PR    </td><td> 20011</td><td>Parc des Princes        </td><td>Katalin Kulcsar       </td><td>NA                                              </td></tr>
	<tr><td>Group stage    </td><td>2   </td><td>Fri</td><td>2019-06-14</td><td>15:00:00</td><td>Japan       </td><td>2 - 1 </td><td>NA   </td><td>Scotland    </td><td> 13201</td><td>Roazhon Park            </td><td>Lidya Tafesse         </td><td>NA                                              </td></tr>
	<tr><td>Group stage    </td><td>2   </td><td>Fri</td><td>2019-06-14</td><td>18:00:00</td><td>Jamaica     </td><td>0 - 5 </td><td>NA   </td><td>Italy       </td><td> 12016</td><td>Stade Auguste-Delaune II</td><td>Anna-Marie Keighley   </td><td>NA                                              </td></tr>
	<tr><td>Group stage    </td><td>2   </td><td>Fri</td><td>2019-06-14</td><td>21:00:00</td><td>England     </td><td>1 - 0 </td><td>NA   </td><td>Argentina   </td><td> 20294</td><td>Stade Oceane            </td><td>Qin Liang             </td><td>NA                                              </td></tr>
	<tr><td>Group stage    </td><td>2   </td><td>Sat</td><td>2019-06-15</td><td>15:00:00</td><td>Netherlands </td><td>3 - 1 </td><td>NA   </td><td>Cameroon    </td><td> 22423</td><td>Stade du Hainaut        </td><td>Casey Reibelt         </td><td>NA                                              </td></tr>
	<tr><td>Group stage    </td><td>2   </td><td>Sat</td><td>2019-06-15</td><td>21:00:00</td><td>Canada      </td><td>2 - 0 </td><td>NA   </td><td>New Zealand </td><td> 14856</td><td>Stade des Alpes         </td><td>Yoshimi Yamashita     </td><td>NA                                              </td></tr>
	<tr><td>Group stage    </td><td>2   </td><td>Sun</td><td>2019-06-16</td><td>15:00:00</td><td>Sweden      </td><td>5 - 1 </td><td>NA   </td><td>Thailand    </td><td>  9354</td><td>Stade de Nice           </td><td>Salma Mukansanga      </td><td>NA                                              </td></tr>
	<tr><td>Group stage    </td><td>2   </td><td>Sun</td><td>2019-06-16</td><td>18:00:00</td><td>USA         </td><td>3 - 0 </td><td>NA   </td><td>Chile       </td><td> 45594</td><td>Parc des Princes        </td><td>Riem Hussein          </td><td>NA                                              </td></tr>
	<tr><td>NA             </td><td>NA  </td><td>NA </td><td>NA</td><td>      NA</td><td>NA          </td><td>NA    </td><td>NA   </td><td>NA          </td><td>    NA</td><td>NA                      </td><td>NA                    </td><td>NA                                              </td></tr>
	<tr><td>Group stage    </td><td>3   </td><td>Mon</td><td>2019-06-17</td><td>18:00:00</td><td>China PR    </td><td>0 - 0 </td><td>NA   </td><td>Spain       </td><td> 11814</td><td>Stade Oceane            </td><td>Edina Alves Batista   </td><td>NA                                              </td></tr>
	<tr><td>Group stage    </td><td>3   </td><td>Mon</td><td>2019-06-17</td><td>18:00:00</td><td>South Africa</td><td>0 - 4 </td><td>NA   </td><td>Germany     </td><td> 15502</td><td>Stade de la Mosson      </td><td>Sandra Braz           </td><td>NA                                              </td></tr>
	<tr><td>Group stage    </td><td>3   </td><td>Mon</td><td>2019-06-17</td><td>21:00:00</td><td>Nigeria     </td><td>0 - 1 </td><td>NA   </td><td>France      </td><td> 28267</td><td>Roazhon Park            </td><td>Melissa Borjas        </td><td>NA                                              </td></tr>
	<tr><td>Group stage    </td><td>3   </td><td>Mon</td><td>2019-06-17</td><td>21:00:00</td><td>Korea Rep   </td><td>1 - 2 </td><td>NA   </td><td>Norway      </td><td> 13034</td><td>Stade Auguste-Delaune II</td><td>Marie-Soleil Beaudoin </td><td>NA                                              </td></tr>
	<tr><td>Group stage    </td><td>3   </td><td>Tue</td><td>2019-06-18</td><td>21:00:00</td><td>Jamaica     </td><td>1 - 4 </td><td>NA   </td><td>Australia   </td><td> 17402</td><td>Stade des Alpes         </td><td>Katalin Kulcsar       </td><td>NA                                              </td></tr>
	<tr><td>Group stage    </td><td>3   </td><td>Tue</td><td>2019-06-18</td><td>21:00:00</td><td>Italy       </td><td>0 - 1 </td><td>NA   </td><td>Brazil      </td><td> 21669</td><td>Stade du Hainaut        </td><td>Lucila Venegas        </td><td>NA                                              </td></tr>
	<tr><td>Group stage    </td><td>3   </td><td>Wed</td><td>2019-06-19</td><td>21:00:00</td><td>Scotland    </td><td>3 - 3 </td><td>NA   </td><td>Argentina   </td><td> 28205</td><td>Parc des Princes        </td><td>Ri Hyang Ok           </td><td>NA                                              </td></tr>
	<tr><td>Group stage    </td><td>3   </td><td>Wed</td><td>2019-06-19</td><td>21:00:00</td><td>Japan       </td><td>0 - 2 </td><td>NA   </td><td>England     </td><td> 14319</td><td>Stade de Nice           </td><td>Claudia Umpierrez     </td><td>NA                                              </td></tr>
	<tr><td>Group stage    </td><td>3   </td><td>Thu</td><td>2019-06-20</td><td>18:00:00</td><td>Netherlands </td><td>2 - 1 </td><td>NA   </td><td>Canada      </td><td> 19277</td><td>Stade Auguste-Delaune II</td><td>Stephanie Frappart    </td><td>NA                                              </td></tr>
	<tr><td>Group stage    </td><td>3   </td><td>Thu</td><td>2019-06-20</td><td>18:00:00</td><td>Cameroon    </td><td>2 - 1 </td><td>NA   </td><td>New Zealand </td><td>  8009</td><td>Stade de la Mosson      </td><td>Kateryna Monzul       </td><td>NA                                              </td></tr>
	<tr><td>Group stage    </td><td>3   </td><td>Thu</td><td>2019-06-20</td><td>21:00:00</td><td>Thailand    </td><td>0 - 2 </td><td>NA   </td><td>Chile       </td><td> 13567</td><td>Roazhon Park            </td><td>Anna-Marie Keighley   </td><td>NA                                              </td></tr>
	<tr><td>Group stage    </td><td>3   </td><td>Thu</td><td>2019-06-20</td><td>21:00:00</td><td>Sweden      </td><td>0 - 2 </td><td>NA   </td><td>USA         </td><td> 22418</td><td>Stade Oceane            </td><td>Anastasia Pustovoitova</td><td>NA                                              </td></tr>
	<tr><td>NA             </td><td>NA  </td><td>NA </td><td>NA</td><td>      NA</td><td>NA          </td><td>NA    </td><td>NA   </td><td>NA          </td><td>    NA</td><td>NA                      </td><td>NA                    </td><td>NA                                              </td></tr>
	<tr><td>Round of 16    </td><td>R16 </td><td>Sat</td><td>2019-06-22</td><td>17:30:00</td><td>Germany     </td><td>3 - 0 </td><td>NA   </td><td>Nigeria     </td><td> 17988</td><td>Stade des Alpes         </td><td>Yoshimi Yamashita     </td><td>NA                                              </td></tr>
	<tr><td>Round of 16    </td><td>R16 </td><td>Sat</td><td>2019-06-22</td><td>21:00:00</td><td>Norway      </td><td>1 - 1 </td><td>4 - 1</td><td>Australia   </td><td> 12229</td><td>Stade de Nice           </td><td>Riem Hussein          </td><td>Norway won on penalty kicks following extra time</td></tr>
	<tr><td>Round of 16    </td><td>R16 </td><td>Sun</td><td>2019-06-23</td><td>17:30:00</td><td>England     </td><td>3 - 0 </td><td>NA   </td><td>Cameroon    </td><td> 20148</td><td>Stade du Hainaut        </td><td>Qin Liang             </td><td>NA                                              </td></tr>
	<tr><td>Round of 16    </td><td>R16 </td><td>Sun</td><td>2019-06-23</td><td>21:00:00</td><td>France      </td><td>2 - 1 </td><td>NA   </td><td>Brazil      </td><td> 23965</td><td>Stade Oceane            </td><td>Marie-Soleil Beaudoin </td><td>Required Extra Time                             </td></tr>
	<tr><td>Round of 16    </td><td>R16 </td><td>Mon</td><td>2019-06-24</td><td>18:00:00</td><td>Spain       </td><td>1 -2  </td><td>NA   </td><td>USA         </td><td> 19633</td><td>Stade Auguste-Delaune II</td><td>Katalin Kulcsar       </td><td>NA                                              </td></tr>
	<tr><td>Round of 16    </td><td>R16 </td><td>Mon</td><td>2019-06-24</td><td>21:00:00</td><td>Sweden      </td><td>1 - 0 </td><td>NA   </td><td>Canada      </td><td> 38078</td><td>Parc des Princes        </td><td>Kate Jacewicz         </td><td>NA                                              </td></tr>
	<tr><td>Round of 16    </td><td>R16 </td><td>Tue</td><td>2019-06-25</td><td>18:00:00</td><td>Italy       </td><td>2 - 0 </td><td>NA   </td><td>China PR    </td><td> 17492</td><td>Stade de la Mosson      </td><td>Edina Alves Batista   </td><td>NA                                              </td></tr>
	<tr><td>Round of 16    </td><td>R16 </td><td>Tue</td><td>2019-06-25</td><td>21:00:00</td><td>Netherlands </td><td>2 - 1 </td><td>NA   </td><td>Japan       </td><td> 21076</td><td>Roazhon Park            </td><td>Melissa Borjas        </td><td>NA                                              </td></tr>
	<tr><td>Quarterfinals  </td><td>QRTF</td><td>Thu</td><td>2019-06-27</td><td>21:00:00</td><td>Norway      </td><td>0 - 3 </td><td>NA   </td><td>England     </td><td> 21111</td><td>Stade Oceane            </td><td>Lucila Venegas        </td><td>NA                                              </td></tr>
	<tr><td>Quarterfinals  </td><td>QRTF</td><td>Fri</td><td>2019-06-28</td><td>21:00:00</td><td>France      </td><td>1 - 2 </td><td>NA   </td><td>USA         </td><td> 45595</td><td>Parc des Princes        </td><td>Kateryna Monzul       </td><td>NA                                              </td></tr>
	<tr><td>Quarterfinals  </td><td>QRTF</td><td>Sat</td><td>2019-06-29</td><td>15:00:00</td><td>Italy       </td><td>0 - 2 </td><td>NA   </td><td>Netherlands </td><td> 22600</td><td>Stade du Hainaut        </td><td>Claudia Umpierrez     </td><td>NA                                              </td></tr>
	<tr><td>Quarterfinals  </td><td>QRTF</td><td>Sat</td><td>2019-06-29</td><td>18:30:00</td><td>Germany     </td><td>1 - 2 </td><td>NA   </td><td>Sweden      </td><td> 25301</td><td>Roazhon Park            </td><td>Stephanie Frappart    </td><td>NA                                              </td></tr>
	<tr><td>Semifinals     </td><td>SMIF</td><td>Tue</td><td>2019-07-02</td><td>21:00:00</td><td>England     </td><td>1 - 2 </td><td>NA   </td><td>USA         </td><td> 53512</td><td>NA                      </td><td>Edina Alves Batista   </td><td>NA                                              </td></tr>
	<tr><td>Semifinals     </td><td>SMIF</td><td>Wed</td><td>2019-07-03</td><td>21:00:00</td><td>Netherlands </td><td>1 - 0 </td><td>NA   </td><td>Sweden      </td><td> 48452</td><td>Groupama Stadium        </td><td>Marie-Soleil Beaudoin </td><td>Required Extra Time                             </td></tr>
	<tr><td>3rd-place match</td><td>3rd </td><td>Sat</td><td>2019-07-06</td><td>17:00:00</td><td>England     </td><td>1 - 2 </td><td>NA   </td><td>Sweden      </td><td> 20316</td><td>Stade de Nice           </td><td>Anastasia Pustovoitova</td><td>NA                                              </td></tr>
	<tr><td>Final          </td><td>FIN </td><td>Sun</td><td>2019-07-07</td><td>17:00:00</td><td>USA         </td><td>2 - 0 </td><td>NA   </td><td>Netherlands </td><td>579000</td><td>Groupama Stadium        </td><td>Stephanie Frappart    </td><td>NA                                              </td></tr>
</tbody>
</table>




```R
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

```






    1/1 tests passed


## 3. Removing rows of NA
<p>We have 55 observations (rows) of 13 variables (columns). Hmmm, we know there were 52 games - why the extra rows? Also <code>Round</code> and <code>Attendance</code> each have three <code>NA</code>, and <code>Date</code> and <code>Venue</code> each have four <code>NA</code>. It looks like we have a few things to fix.</p>
<ul>
<li>Rows of NA</li>
<li>Missing data values</li>
<li>Multiple values in one column (look at <code>Score</code> and <code>PKS</code>)</li>
<li>Column headers are a mix of upper- and lowercase letters</li>
</ul>
<p>The last issue is more of a preference. Having all the column names in the same case will make typing easier.</p>
<p>Great hustle on Bob's part for collecting the information we need, but he gets a yellow card for inserting the rows of <code>NA</code>.  Let's start cleaning the data by putting the column names in lowercase and removing the rows of <code>NA</code>.</p>


```R
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
```


<ol class=list-inline>
	<li>52</li>
	<li>13</li>
</ol>




<table>
<caption>A tibble: 10 x 13</caption>
<thead>
	<tr><th scope=col>round</th><th scope=col>wk</th><th scope=col>day</th><th scope=col>date</th><th scope=col>time</th><th scope=col>home</th><th scope=col>score</th><th scope=col>pks</th><th scope=col>away</th><th scope=col>attendance</th><th scope=col>venue</th><th scope=col>referee</th><th scope=col>notes</th></tr>
	<tr><th scope=col>&lt;fct&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;date&gt;</th><th scope=col>&lt;time&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;fct&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th></tr>
</thead>
<tbody>
	<tr><td>Group stage</td><td>1</td><td>Fri</td><td>2019-06-07</td><td>21:00:00</td><td>France     </td><td>4 - 0</td><td>NA</td><td>Korea Rep   </td><td>45261</td><td>Parc des Princes        </td><td>Claudia Umpierrez    </td><td>NA</td></tr>
	<tr><td>Group stage</td><td>1</td><td>Sat</td><td>2019-06-08</td><td>15:00:00</td><td>Germany    </td><td>1 - 0</td><td>NA</td><td>China PR    </td><td>15283</td><td>Roazhon Park            </td><td>Marie-Soleil Beaudoin</td><td>NA</td></tr>
	<tr><td>Group stage</td><td>1</td><td>Sat</td><td>2019-06-08</td><td>18:00:00</td><td>Spain      </td><td>3 - 1</td><td>NA</td><td>South Africa</td><td>12044</td><td>Stade Oceane            </td><td>Maria Carvajal       </td><td>NA</td></tr>
	<tr><td>Group stage</td><td>1</td><td>Sat</td><td>2019-06-08</td><td>21:00:00</td><td>Norway     </td><td>3 - 0</td><td>NA</td><td>Nigeria     </td><td>11058</td><td>Stade Auguste-Delaune II</td><td>Kate Jacewicz        </td><td>NA</td></tr>
	<tr><td>Group stage</td><td>1</td><td>Sun</td><td>2019-06-09</td><td>13:00:00</td><td>Australia  </td><td>1 - 2</td><td>NA</td><td>Italy       </td><td>15380</td><td>Stade du Hainaut        </td><td>Melissa Borjas       </td><td>NA</td></tr>
	<tr><td>Group stage</td><td>1</td><td>Sun</td><td>NA</td><td>15:30:00</td><td>Brazil     </td><td>3 - 0</td><td>NA</td><td>Jamaica     </td><td>17668</td><td>Stade des Alpes         </td><td>Riem Hussein         </td><td>NA</td></tr>
	<tr><td>Group stage</td><td>1</td><td>Sun</td><td>2019-06-09</td><td>18:00:00</td><td>England    </td><td>2 - 1</td><td>NA</td><td>Scotland    </td><td>13188</td><td>Stade de Nice           </td><td>Jana Adamkova        </td><td>NA</td></tr>
	<tr><td>Group stage</td><td>1</td><td>Mon</td><td>2019-06-10</td><td>18:00:00</td><td>Argentina  </td><td>0 - 0</td><td>NA</td><td>Japan       </td><td>25055</td><td>Parc des Princes        </td><td>Stephanie Frappart   </td><td>NA</td></tr>
	<tr><td>Group stage</td><td>1</td><td>Mon</td><td>2019-06-10</td><td>21:00:00</td><td>Canada     </td><td>1 - 0</td><td>NA</td><td>Cameroon    </td><td>10710</td><td>Stade de la Mosson      </td><td>Ri Hyang Ok          </td><td>NA</td></tr>
	<tr><td>Group stage</td><td>1</td><td>Tue</td><td>2019-06-11</td><td>15:00:00</td><td>New Zealand</td><td>0 - 1</td><td>NA</td><td>Netherlands </td><td>10654</td><td>Stade Oceane            </td><td>Edina Alves Batista  </td><td>NA</td></tr>
</tbody>
</table>




<table>
<caption>A tibble: 10 x 13</caption>
<thead>
	<tr><th scope=col>round</th><th scope=col>wk</th><th scope=col>day</th><th scope=col>date</th><th scope=col>time</th><th scope=col>home</th><th scope=col>score</th><th scope=col>pks</th><th scope=col>away</th><th scope=col>attendance</th><th scope=col>venue</th><th scope=col>referee</th><th scope=col>notes</th></tr>
	<tr><th scope=col>&lt;fct&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;date&gt;</th><th scope=col>&lt;time&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;fct&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th></tr>
</thead>
<tbody>
	<tr><td>Round of 16    </td><td>R16 </td><td>Tue</td><td>2019-06-25</td><td>18:00:00</td><td>Italy      </td><td>2 - 0</td><td>NA</td><td>China PR   </td><td> 17492</td><td>Stade de la Mosson</td><td>Edina Alves Batista   </td><td>NA                 </td></tr>
	<tr><td>Round of 16    </td><td>R16 </td><td>Tue</td><td>2019-06-25</td><td>21:00:00</td><td>Netherlands</td><td>2 - 1</td><td>NA</td><td>Japan      </td><td> 21076</td><td>Roazhon Park      </td><td>Melissa Borjas        </td><td>NA                 </td></tr>
	<tr><td>Quarterfinals  </td><td>QRTF</td><td>Thu</td><td>2019-06-27</td><td>21:00:00</td><td>Norway     </td><td>0 - 3</td><td>NA</td><td>England    </td><td> 21111</td><td>Stade Oceane      </td><td>Lucila Venegas        </td><td>NA                 </td></tr>
	<tr><td>Quarterfinals  </td><td>QRTF</td><td>Fri</td><td>2019-06-28</td><td>21:00:00</td><td>France     </td><td>1 - 2</td><td>NA</td><td>USA        </td><td> 45595</td><td>Parc des Princes  </td><td>Kateryna Monzul       </td><td>NA                 </td></tr>
	<tr><td>Quarterfinals  </td><td>QRTF</td><td>Sat</td><td>2019-06-29</td><td>15:00:00</td><td>Italy      </td><td>0 - 2</td><td>NA</td><td>Netherlands</td><td> 22600</td><td>Stade du Hainaut  </td><td>Claudia Umpierrez     </td><td>NA                 </td></tr>
	<tr><td>Quarterfinals  </td><td>QRTF</td><td>Sat</td><td>2019-06-29</td><td>18:30:00</td><td>Germany    </td><td>1 - 2</td><td>NA</td><td>Sweden     </td><td> 25301</td><td>Roazhon Park      </td><td>Stephanie Frappart    </td><td>NA                 </td></tr>
	<tr><td>Semifinals     </td><td>SMIF</td><td>Tue</td><td>2019-07-02</td><td>21:00:00</td><td>England    </td><td>1 - 2</td><td>NA</td><td>USA        </td><td> 53512</td><td>NA                </td><td>Edina Alves Batista   </td><td>NA                 </td></tr>
	<tr><td>Semifinals     </td><td>SMIF</td><td>Wed</td><td>2019-07-03</td><td>21:00:00</td><td>Netherlands</td><td>1 - 0</td><td>NA</td><td>Sweden     </td><td> 48452</td><td>Groupama Stadium  </td><td>Marie-Soleil Beaudoin </td><td>Required Extra Time</td></tr>
	<tr><td>3rd-place match</td><td>3rd </td><td>Sat</td><td>2019-07-06</td><td>17:00:00</td><td>England    </td><td>1 - 2</td><td>NA</td><td>Sweden     </td><td> 20316</td><td>Stade de Nice     </td><td>Anastasia Pustovoitova</td><td>NA                 </td></tr>
	<tr><td>Final          </td><td>FIN </td><td>Sun</td><td>2019-07-07</td><td>17:00:00</td><td>USA        </td><td>2 - 0</td><td>NA</td><td>Netherlands</td><td>579000</td><td>Groupama Stadium  </td><td>Stephanie Frappart    </td><td>NA                 </td></tr>
</tbody>
</table>




```R
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
```






    2/2 tests passed


## 4. Replacing NA
<p>Excellent! We now have 52 rows. Each row corresponds to a match in the tournament. But, it looks like there are a couple <code>NA</code> still lurking about in <code>date</code> and <code>venue</code>. Using <code>colSums()</code> and <code>is.na()</code> we can check to see how many <code>NA</code> are in each column.</p>
<p><img src="https://assets.datacamp.com/production/project_758/img/colSums_output.png" alt="colSums output"></p>
<p><br></p>
<p>We only have the one <code>NA</code> in <code>date</code> and one <code>NA</code> in <code>venue</code>. We would expect the <code>notes</code> column to have several <code>NA</code>, but what about <code>pks</code>? <code>pks</code> is the column for penalty kicks. It has 51 <code>NA</code>. A good guess would be that only one match ended in penalty kicks, and according to Bob, that is correct. We'll deal with the double data in <code>score</code> and <code>pks</code> shortly. Now we are going to clean <code>date</code> and <code>venue</code>.</p>


```R
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
```


<table>
<caption>A tibble: 1 x 13</caption>
<thead>
	<tr><th scope=col>round</th><th scope=col>wk</th><th scope=col>day</th><th scope=col>date</th><th scope=col>time</th><th scope=col>home</th><th scope=col>score</th><th scope=col>pks</th><th scope=col>away</th><th scope=col>attendance</th><th scope=col>venue</th><th scope=col>referee</th><th scope=col>notes</th></tr>
	<tr><th scope=col>&lt;fct&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;date&gt;</th><th scope=col>&lt;time&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;fct&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th></tr>
</thead>
<tbody>
	<tr><td>Group stage</td><td>1</td><td>Sun</td><td>NA</td><td>15:30:00</td><td>Brazil</td><td>3 - 0</td><td>NA</td><td>Jamaica</td><td>17668</td><td>Stade des Alpes</td><td>Riem Hussein</td><td>NA</td></tr>
</tbody>
</table>




<table>
<caption>A tibble: 1 x 13</caption>
<thead>
	<tr><th scope=col>round</th><th scope=col>wk</th><th scope=col>day</th><th scope=col>date</th><th scope=col>time</th><th scope=col>home</th><th scope=col>score</th><th scope=col>pks</th><th scope=col>away</th><th scope=col>attendance</th><th scope=col>venue</th><th scope=col>referee</th><th scope=col>notes</th></tr>
	<tr><th scope=col>&lt;fct&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;date&gt;</th><th scope=col>&lt;time&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;fct&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th></tr>
</thead>
<tbody>
	<tr><td>Semifinals</td><td>SMIF</td><td>Tue</td><td>2019-07-02</td><td>21:00:00</td><td>England</td><td>1 - 2</td><td>NA</td><td>USA</td><td>53512</td><td>NA</td><td>Edina Alves Batista</td><td>NA</td></tr>
</tbody>
</table>




```R
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
```






    2/2 tests passed


## 5. separate() and replace_na()
<p>All right! The data are looking good, but it is a good idea to get the two data points in <code>score</code> and two data points in <code>pks</code> into their own columns for future data sleuthing.</p>
<p>For this task we're going to employ the functionality of <code>separate()</code>, <code>mutate()</code>, and <code>replace_na()</code>. Look back at the directions in Task 4 to see an example of how <code>mutate()</code> and <code>replace_na()</code> are used together. We'll use the pipe operator, <code>%</code>, to pipe the functions together for readability. </p>


```R
# Separate columns and replace NA (you've got this!)
wwc_3  <- wwc_2  %>% 
  separate(score, c("home_score", "away_score"), sep = "-", convert = TRUE) %>%
  separate(pks, c("home_pks", "away_pks"), sep = "-", convert = TRUE) %>%
  mutate(home_pks = replace_na(home_pks, 0), 
         away_pks = replace_na(away_pks, 0))
# Print the data
wwc_3
```


<table>
<caption>A tibble: 52 x 15</caption>
<thead>
	<tr><th scope=col>round</th><th scope=col>wk</th><th scope=col>day</th><th scope=col>date</th><th scope=col>time</th><th scope=col>home</th><th scope=col>home_score</th><th scope=col>away_score</th><th scope=col>home_pks</th><th scope=col>away_pks</th><th scope=col>away</th><th scope=col>attendance</th><th scope=col>venue</th><th scope=col>referee</th><th scope=col>notes</th></tr>
	<tr><th scope=col>&lt;fct&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;date&gt;</th><th scope=col>&lt;time&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;fct&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th></tr>
</thead>
<tbody>
	<tr><td>Group stage    </td><td>1   </td><td>Fri</td><td>2019-06-07</td><td>21:00:00</td><td>France      </td><td> 4</td><td>0</td><td>0</td><td>0</td><td>Korea Rep   </td><td> 45261</td><td>Parc des Princes        </td><td>Claudia Umpierrez     </td><td>NA                                              </td></tr>
	<tr><td>Group stage    </td><td>1   </td><td>Sat</td><td>2019-06-08</td><td>15:00:00</td><td>Germany     </td><td> 1</td><td>0</td><td>0</td><td>0</td><td>China PR    </td><td> 15283</td><td>Roazhon Park            </td><td>Marie-Soleil Beaudoin </td><td>NA                                              </td></tr>
	<tr><td>Group stage    </td><td>1   </td><td>Sat</td><td>2019-06-08</td><td>18:00:00</td><td>Spain       </td><td> 3</td><td>1</td><td>0</td><td>0</td><td>South Africa</td><td> 12044</td><td>Stade Oceane            </td><td>Maria Carvajal        </td><td>NA                                              </td></tr>
	<tr><td>Group stage    </td><td>1   </td><td>Sat</td><td>2019-06-08</td><td>21:00:00</td><td>Norway      </td><td> 3</td><td>0</td><td>0</td><td>0</td><td>Nigeria     </td><td> 11058</td><td>Stade Auguste-Delaune II</td><td>Kate Jacewicz         </td><td>NA                                              </td></tr>
	<tr><td>Group stage    </td><td>1   </td><td>Sun</td><td>2019-06-09</td><td>13:00:00</td><td>Australia   </td><td> 1</td><td>2</td><td>0</td><td>0</td><td>Italy       </td><td> 15380</td><td>Stade du Hainaut        </td><td>Melissa Borjas        </td><td>NA                                              </td></tr>
	<tr><td>Group stage    </td><td>1   </td><td>Sun</td><td>2019-06-09</td><td>15:30:00</td><td>Brazil      </td><td> 3</td><td>0</td><td>0</td><td>0</td><td>Jamaica     </td><td> 17668</td><td>Stade des Alpes         </td><td>Riem Hussein          </td><td>NA                                              </td></tr>
	<tr><td>Group stage    </td><td>1   </td><td>Sun</td><td>2019-06-09</td><td>18:00:00</td><td>England     </td><td> 2</td><td>1</td><td>0</td><td>0</td><td>Scotland    </td><td> 13188</td><td>Stade de Nice           </td><td>Jana Adamkova         </td><td>NA                                              </td></tr>
	<tr><td>Group stage    </td><td>1   </td><td>Mon</td><td>2019-06-10</td><td>18:00:00</td><td>Argentina   </td><td> 0</td><td>0</td><td>0</td><td>0</td><td>Japan       </td><td> 25055</td><td>Parc des Princes        </td><td>Stephanie Frappart    </td><td>NA                                              </td></tr>
	<tr><td>Group stage    </td><td>1   </td><td>Mon</td><td>2019-06-10</td><td>21:00:00</td><td>Canada      </td><td> 1</td><td>0</td><td>0</td><td>0</td><td>Cameroon    </td><td> 10710</td><td>Stade de la Mosson      </td><td>Ri Hyang Ok           </td><td>NA                                              </td></tr>
	<tr><td>Group stage    </td><td>1   </td><td>Tue</td><td>2019-06-11</td><td>15:00:00</td><td>New Zealand </td><td> 0</td><td>1</td><td>0</td><td>0</td><td>Netherlands </td><td> 10654</td><td>Stade Oceane            </td><td>Edina Alves Batista   </td><td>NA                                              </td></tr>
	<tr><td>Group stage    </td><td>1   </td><td>Tue</td><td>2019-06-11</td><td>18:00:00</td><td>Chile       </td><td> 0</td><td>2</td><td>0</td><td>0</td><td>Sweden      </td><td> 15875</td><td>Roazhon Park            </td><td>Lucila Venegas        </td><td>NA                                              </td></tr>
	<tr><td>Group stage    </td><td>1   </td><td>Tue</td><td>2019-06-11</td><td>21:00:00</td><td>USA         </td><td>13</td><td>0</td><td>0</td><td>0</td><td>Thailand    </td><td> 18591</td><td>Stade Auguste-Delaune II</td><td>Laura Fortunato       </td><td>NA                                              </td></tr>
	<tr><td>Group stage    </td><td>2   </td><td>Wed</td><td>2019-06-12</td><td>15:00:00</td><td>Nigeria     </td><td> 2</td><td>0</td><td>0</td><td>0</td><td>Korea Rep   </td><td> 11252</td><td>Stade des Alpes         </td><td>Anastasia Pustovoitova</td><td>NA                                              </td></tr>
	<tr><td>Group stage    </td><td>2   </td><td>Wed</td><td>2019-06-12</td><td>18:00:00</td><td>Germany     </td><td> 1</td><td>0</td><td>0</td><td>0</td><td>Spain       </td><td> 20761</td><td>Stade du Hainaut        </td><td>Kateryna Monzul       </td><td>NA                                              </td></tr>
	<tr><td>Group stage    </td><td>2   </td><td>Wed</td><td>2019-06-12</td><td>21:00:00</td><td>France      </td><td> 2</td><td>1</td><td>0</td><td>0</td><td>Norway      </td><td> 34872</td><td>Stade de Nice           </td><td>Bibiana Steinhaus     </td><td>NA                                              </td></tr>
	<tr><td>Group stage    </td><td>2   </td><td>Thu</td><td>2019-06-13</td><td>18:00:00</td><td>Australia   </td><td> 3</td><td>2</td><td>0</td><td>0</td><td>Brazil      </td><td> 17032</td><td>Stade de la Mosson      </td><td>Esther Staubli        </td><td>NA                                              </td></tr>
	<tr><td>Group stage    </td><td>2   </td><td>Thu</td><td>2019-06-13</td><td>21:00:00</td><td>South Africa</td><td> 0</td><td>1</td><td>0</td><td>0</td><td>China PR    </td><td> 20011</td><td>Parc des Princes        </td><td>Katalin Kulcsar       </td><td>NA                                              </td></tr>
	<tr><td>Group stage    </td><td>2   </td><td>Fri</td><td>2019-06-14</td><td>15:00:00</td><td>Japan       </td><td> 2</td><td>1</td><td>0</td><td>0</td><td>Scotland    </td><td> 13201</td><td>Roazhon Park            </td><td>Lidya Tafesse         </td><td>NA                                              </td></tr>
	<tr><td>Group stage    </td><td>2   </td><td>Fri</td><td>2019-06-14</td><td>18:00:00</td><td>Jamaica     </td><td> 0</td><td>5</td><td>0</td><td>0</td><td>Italy       </td><td> 12016</td><td>Stade Auguste-Delaune II</td><td>Anna-Marie Keighley   </td><td>NA                                              </td></tr>
	<tr><td>Group stage    </td><td>2   </td><td>Fri</td><td>2019-06-14</td><td>21:00:00</td><td>England     </td><td> 1</td><td>0</td><td>0</td><td>0</td><td>Argentina   </td><td> 20294</td><td>Stade Oceane            </td><td>Qin Liang             </td><td>NA                                              </td></tr>
	<tr><td>Group stage    </td><td>2   </td><td>Sat</td><td>2019-06-15</td><td>15:00:00</td><td>Netherlands </td><td> 3</td><td>1</td><td>0</td><td>0</td><td>Cameroon    </td><td> 22423</td><td>Stade du Hainaut        </td><td>Casey Reibelt         </td><td>NA                                              </td></tr>
	<tr><td>Group stage    </td><td>2   </td><td>Sat</td><td>2019-06-15</td><td>21:00:00</td><td>Canada      </td><td> 2</td><td>0</td><td>0</td><td>0</td><td>New Zealand </td><td> 14856</td><td>Stade des Alpes         </td><td>Yoshimi Yamashita     </td><td>NA                                              </td></tr>
	<tr><td>Group stage    </td><td>2   </td><td>Sun</td><td>2019-06-16</td><td>15:00:00</td><td>Sweden      </td><td> 5</td><td>1</td><td>0</td><td>0</td><td>Thailand    </td><td>  9354</td><td>Stade de Nice           </td><td>Salma Mukansanga      </td><td>NA                                              </td></tr>
	<tr><td>Group stage    </td><td>2   </td><td>Sun</td><td>2019-06-16</td><td>18:00:00</td><td>USA         </td><td> 3</td><td>0</td><td>0</td><td>0</td><td>Chile       </td><td> 45594</td><td>Parc des Princes        </td><td>Riem Hussein          </td><td>NA                                              </td></tr>
	<tr><td>Group stage    </td><td>3   </td><td>Mon</td><td>2019-06-17</td><td>18:00:00</td><td>China PR    </td><td> 0</td><td>0</td><td>0</td><td>0</td><td>Spain       </td><td> 11814</td><td>Stade Oceane            </td><td>Edina Alves Batista   </td><td>NA                                              </td></tr>
	<tr><td>Group stage    </td><td>3   </td><td>Mon</td><td>2019-06-17</td><td>18:00:00</td><td>South Africa</td><td> 0</td><td>4</td><td>0</td><td>0</td><td>Germany     </td><td> 15502</td><td>Stade de la Mosson      </td><td>Sandra Braz           </td><td>NA                                              </td></tr>
	<tr><td>Group stage    </td><td>3   </td><td>Mon</td><td>2019-06-17</td><td>21:00:00</td><td>Nigeria     </td><td> 0</td><td>1</td><td>0</td><td>0</td><td>France      </td><td> 28267</td><td>Roazhon Park            </td><td>Melissa Borjas        </td><td>NA                                              </td></tr>
	<tr><td>Group stage    </td><td>3   </td><td>Mon</td><td>2019-06-17</td><td>21:00:00</td><td>Korea Rep   </td><td> 1</td><td>2</td><td>0</td><td>0</td><td>Norway      </td><td> 13034</td><td>Stade Auguste-Delaune II</td><td>Marie-Soleil Beaudoin </td><td>NA                                              </td></tr>
	<tr><td>Group stage    </td><td>3   </td><td>Tue</td><td>2019-06-18</td><td>21:00:00</td><td>Jamaica     </td><td> 1</td><td>4</td><td>0</td><td>0</td><td>Australia   </td><td> 17402</td><td>Stade des Alpes         </td><td>Katalin Kulcsar       </td><td>NA                                              </td></tr>
	<tr><td>Group stage    </td><td>3   </td><td>Tue</td><td>2019-06-18</td><td>21:00:00</td><td>Italy       </td><td> 0</td><td>1</td><td>0</td><td>0</td><td>Brazil      </td><td> 21669</td><td>Stade du Hainaut        </td><td>Lucila Venegas        </td><td>NA                                              </td></tr>
	<tr><td>Group stage    </td><td>3   </td><td>Wed</td><td>2019-06-19</td><td>21:00:00</td><td>Scotland    </td><td> 3</td><td>3</td><td>0</td><td>0</td><td>Argentina   </td><td> 28205</td><td>Parc des Princes        </td><td>Ri Hyang Ok           </td><td>NA                                              </td></tr>
	<tr><td>Group stage    </td><td>3   </td><td>Wed</td><td>2019-06-19</td><td>21:00:00</td><td>Japan       </td><td> 0</td><td>2</td><td>0</td><td>0</td><td>England     </td><td> 14319</td><td>Stade de Nice           </td><td>Claudia Umpierrez     </td><td>NA                                              </td></tr>
	<tr><td>Group stage    </td><td>3   </td><td>Thu</td><td>2019-06-20</td><td>18:00:00</td><td>Netherlands </td><td> 2</td><td>1</td><td>0</td><td>0</td><td>Canada      </td><td> 19277</td><td>Stade Auguste-Delaune II</td><td>Stephanie Frappart    </td><td>NA                                              </td></tr>
	<tr><td>Group stage    </td><td>3   </td><td>Thu</td><td>2019-06-20</td><td>18:00:00</td><td>Cameroon    </td><td> 2</td><td>1</td><td>0</td><td>0</td><td>New Zealand </td><td>  8009</td><td>Stade de la Mosson      </td><td>Kateryna Monzul       </td><td>NA                                              </td></tr>
	<tr><td>Group stage    </td><td>3   </td><td>Thu</td><td>2019-06-20</td><td>21:00:00</td><td>Thailand    </td><td> 0</td><td>2</td><td>0</td><td>0</td><td>Chile       </td><td> 13567</td><td>Roazhon Park            </td><td>Anna-Marie Keighley   </td><td>NA                                              </td></tr>
	<tr><td>Group stage    </td><td>3   </td><td>Thu</td><td>2019-06-20</td><td>21:00:00</td><td>Sweden      </td><td> 0</td><td>2</td><td>0</td><td>0</td><td>USA         </td><td> 22418</td><td>Stade Oceane            </td><td>Anastasia Pustovoitova</td><td>NA                                              </td></tr>
	<tr><td>Round of 16    </td><td>R16 </td><td>Sat</td><td>2019-06-22</td><td>17:30:00</td><td>Germany     </td><td> 3</td><td>0</td><td>0</td><td>0</td><td>Nigeria     </td><td> 17988</td><td>Stade des Alpes         </td><td>Yoshimi Yamashita     </td><td>NA                                              </td></tr>
	<tr><td>Round of 16    </td><td>R16 </td><td>Sat</td><td>2019-06-22</td><td>21:00:00</td><td>Norway      </td><td> 1</td><td>1</td><td>4</td><td>1</td><td>Australia   </td><td> 12229</td><td>Stade de Nice           </td><td>Riem Hussein          </td><td>Norway won on penalty kicks following extra time</td></tr>
	<tr><td>Round of 16    </td><td>R16 </td><td>Sun</td><td>2019-06-23</td><td>17:30:00</td><td>England     </td><td> 3</td><td>0</td><td>0</td><td>0</td><td>Cameroon    </td><td> 20148</td><td>Stade du Hainaut        </td><td>Qin Liang             </td><td>NA                                              </td></tr>
	<tr><td>Round of 16    </td><td>R16 </td><td>Sun</td><td>2019-06-23</td><td>21:00:00</td><td>France      </td><td> 2</td><td>1</td><td>0</td><td>0</td><td>Brazil      </td><td> 23965</td><td>Stade Oceane            </td><td>Marie-Soleil Beaudoin </td><td>Required Extra Time                             </td></tr>
	<tr><td>Round of 16    </td><td>R16 </td><td>Mon</td><td>2019-06-24</td><td>18:00:00</td><td>Spain       </td><td> 1</td><td>2</td><td>0</td><td>0</td><td>USA         </td><td> 19633</td><td>Stade Auguste-Delaune II</td><td>Katalin Kulcsar       </td><td>NA                                              </td></tr>
	<tr><td>Round of 16    </td><td>R16 </td><td>Mon</td><td>2019-06-24</td><td>21:00:00</td><td>Sweden      </td><td> 1</td><td>0</td><td>0</td><td>0</td><td>Canada      </td><td> 38078</td><td>Parc des Princes        </td><td>Kate Jacewicz         </td><td>NA                                              </td></tr>
	<tr><td>Round of 16    </td><td>R16 </td><td>Tue</td><td>2019-06-25</td><td>18:00:00</td><td>Italy       </td><td> 2</td><td>0</td><td>0</td><td>0</td><td>China PR    </td><td> 17492</td><td>Stade de la Mosson      </td><td>Edina Alves Batista   </td><td>NA                                              </td></tr>
	<tr><td>Round of 16    </td><td>R16 </td><td>Tue</td><td>2019-06-25</td><td>21:00:00</td><td>Netherlands </td><td> 2</td><td>1</td><td>0</td><td>0</td><td>Japan       </td><td> 21076</td><td>Roazhon Park            </td><td>Melissa Borjas        </td><td>NA                                              </td></tr>
	<tr><td>Quarterfinals  </td><td>QRTF</td><td>Thu</td><td>2019-06-27</td><td>21:00:00</td><td>Norway      </td><td> 0</td><td>3</td><td>0</td><td>0</td><td>England     </td><td> 21111</td><td>Stade Oceane            </td><td>Lucila Venegas        </td><td>NA                                              </td></tr>
	<tr><td>Quarterfinals  </td><td>QRTF</td><td>Fri</td><td>2019-06-28</td><td>21:00:00</td><td>France      </td><td> 1</td><td>2</td><td>0</td><td>0</td><td>USA         </td><td> 45595</td><td>Parc des Princes        </td><td>Kateryna Monzul       </td><td>NA                                              </td></tr>
	<tr><td>Quarterfinals  </td><td>QRTF</td><td>Sat</td><td>2019-06-29</td><td>15:00:00</td><td>Italy       </td><td> 0</td><td>2</td><td>0</td><td>0</td><td>Netherlands </td><td> 22600</td><td>Stade du Hainaut        </td><td>Claudia Umpierrez     </td><td>NA                                              </td></tr>
	<tr><td>Quarterfinals  </td><td>QRTF</td><td>Sat</td><td>2019-06-29</td><td>18:30:00</td><td>Germany     </td><td> 1</td><td>2</td><td>0</td><td>0</td><td>Sweden      </td><td> 25301</td><td>Roazhon Park            </td><td>Stephanie Frappart    </td><td>NA                                              </td></tr>
	<tr><td>Semifinals     </td><td>SMIF</td><td>Tue</td><td>2019-07-02</td><td>21:00:00</td><td>England     </td><td> 1</td><td>2</td><td>0</td><td>0</td><td>USA         </td><td> 53512</td><td>Groupama Stadium        </td><td>Edina Alves Batista   </td><td>NA                                              </td></tr>
	<tr><td>Semifinals     </td><td>SMIF</td><td>Wed</td><td>2019-07-03</td><td>21:00:00</td><td>Netherlands </td><td> 1</td><td>0</td><td>0</td><td>0</td><td>Sweden      </td><td> 48452</td><td>Groupama Stadium        </td><td>Marie-Soleil Beaudoin </td><td>Required Extra Time                             </td></tr>
	<tr><td>3rd-place match</td><td>3rd </td><td>Sat</td><td>2019-07-06</td><td>17:00:00</td><td>England     </td><td> 1</td><td>2</td><td>0</td><td>0</td><td>Sweden      </td><td> 20316</td><td>Stade de Nice           </td><td>Anastasia Pustovoitova</td><td>NA                                              </td></tr>
	<tr><td>Final          </td><td>FIN </td><td>Sun</td><td>2019-07-07</td><td>17:00:00</td><td>USA         </td><td> 2</td><td>0</td><td>0</td><td>0</td><td>Netherlands </td><td>579000</td><td>Groupama Stadium        </td><td>Stephanie Frappart    </td><td>NA                                              </td></tr>
</tbody>
</table>




```R
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
```






    4/4 tests passed


## 6. Plotting for outliers
<p>We corrected the <code>NA</code> in the <code>date</code> and <code>venue</code> columns, and separated the <code>score</code> and <code>pks</code> columns to have one score per column. </p>
<p>Now we can take a look at <code>attendance</code> and find the information the boss wants. Let's plot the data to see if there are any outliers. </p>


```R
# Housekeeping for plot size
options(repr.plot.width=6, repr.plot.height=4)

# Load the package
library(ggplot2)

# Make a boxplot of attendance by venue and add the point data
ggplot(wwc_3, aes(x = venue, y = attendance)) +
geom_boxplot() +
geom_jitter(color = "red", size = 0.5) +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) 
```


![png](output_16_0.png)



```R
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
```






    2/2 tests passed


## 7. What to do with the outlier?
<p>Whoa! What’s up with the attendance for Groupama Stadium? One data point is almost 600,000 (6e+05*) while all the other data points are less than 100,000. That does not seem right.  </p>
<p>After chatting with Bob about the outlier and checking the match report, we learned that Bob mistakenly added an extra 0. We can fix that! Let's summarize the attendance by the venue, fix the outlier, and create a new summary table with the updated data.</p>
<p><code>*</code> For fun, add <code>scale_y_continuous(labels = scales::comma)</code> as the last line of the call to <code>ggplot()</code> in Task 6 and see how the y-axis value labels change.</p>


```R
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
```

    `summarise()` ungrouping output (override with `.groups` argument)



<table>
<caption>A tibble: 9 x 4</caption>
<thead>
	<tr><th scope=col>venue</th><th scope=col>nb_of_games</th><th scope=col>min_attendance</th><th scope=col>max_attendance</th></tr>
	<tr><th scope=col>&lt;fct&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>
</thead>
<tbody>
	<tr><td>Parc des Princes        </td><td>7</td><td>20011</td><td> 45595</td></tr>
	<tr><td>Roazhon Park            </td><td>7</td><td>13201</td><td> 28267</td></tr>
	<tr><td>Stade Oceane            </td><td>7</td><td>10654</td><td> 23965</td></tr>
	<tr><td>Stade Auguste-Delaune II</td><td>6</td><td>11058</td><td> 19633</td></tr>
	<tr><td>Stade du Hainaut        </td><td>6</td><td>15380</td><td> 22600</td></tr>
	<tr><td>Stade des Alpes         </td><td>5</td><td>11252</td><td> 17988</td></tr>
	<tr><td>Stade de Nice           </td><td>6</td><td> 9354</td><td> 34872</td></tr>
	<tr><td>Stade de la Mosson      </td><td>5</td><td> 8009</td><td> 17492</td></tr>
	<tr><td>Groupama Stadium        </td><td>3</td><td>48452</td><td>579000</td></tr>
</tbody>
</table>



    `summarise()` ungrouping output (override with `.groups` argument)



<table>
<caption>A tibble: 9 x 4</caption>
<thead>
	<tr><th scope=col>venue</th><th scope=col>nb_of_games</th><th scope=col>min_attendance</th><th scope=col>max_attendance</th></tr>
	<tr><th scope=col>&lt;fct&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>
</thead>
<tbody>
	<tr><td>Parc des Princes        </td><td>7</td><td>20011</td><td>45595</td></tr>
	<tr><td>Roazhon Park            </td><td>7</td><td>13201</td><td>28267</td></tr>
	<tr><td>Stade Oceane            </td><td>7</td><td>10654</td><td>23965</td></tr>
	<tr><td>Stade Auguste-Delaune II</td><td>6</td><td>11058</td><td>19633</td></tr>
	<tr><td>Stade du Hainaut        </td><td>6</td><td>15380</td><td>22600</td></tr>
	<tr><td>Stade des Alpes         </td><td>5</td><td>11252</td><td>17988</td></tr>
	<tr><td>Stade de Nice           </td><td>6</td><td> 9354</td><td>34872</td></tr>
	<tr><td>Stade de la Mosson      </td><td>5</td><td> 8009</td><td>17492</td></tr>
	<tr><td>Groupama Stadium        </td><td>3</td><td>48452</td><td>57900</td></tr>
</tbody>
</table>




```R
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
```

    `summarise()` ungrouping output (override with `.groups` argument)







    2/2 tests passed


## 8. A pretty boxplot
<p>Let's make a boxplot of the attendance by venue again. The first outlier was extreme and might have masked other problems. </p>
<p>This time we will clean up the plot by setting the theme, adding a title, a subtitle, x and y labels, and we will flip the axes to make it easier to read the venue names. We are also going to angle the x-axis text so the numbers will fit within the plot space. And to be fancy, we are going to reorder <code>venue</code> by  the attendance within the plot aesthetics so the venues display in descending order of mean attendance.  </p>


```R
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
```


![png](output_22_0.png)



```R
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
```






    1/1 tests passed


## 9. A pretty line plot
<p>Looks good!</p>
<p>That outlier for Stade de Nice looks a little suspect, but we checked the match reports, and the attendance numbers are correct. The suspect match was <a href="https://www.fifa.com/womensworldcup/matches/match/300438220/#match-liveblog">France vs. Norway</a> - the home nation favorite drew a large crowd wherever they played!</p>
<p>Now that the data are clean, let's plot the attendance at each stadium over time so we can tell the boss which stadium had the highest attendance during the tournament. </p>


```R
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
```


![png](output_25_0.png)



```R
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
```






    1/1 tests passed


## 10. Wrap up
<p>Congratulations! You've made it to the end of the project.</p>
<p>Great job! We have a couple of beautiful plots to give our boss. With a little more code, we can answer her questions: </p>
<ol>
<li>What match had the highest attendance?</li>
<li>In what stadium was the match with the highest attendance played?</li>
</ol>


```R



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
```


```R
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
```






    2/2 tests passed

