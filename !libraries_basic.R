#Loading Basic Libraries 
#Birunda Chelliah

library(utils)
# Allows for easy installation of relevant R Packages
trace(utils:::unpackPkgZip, quote(Sys.sleep(5)), at = which(grepl("Sys.sleep", body(utils:::unpackPkgZip), fixed = TRUE)))

#Purpose of libraries:
  #- Data Wrangling
pkg<-c("ggplot2", "tidyverse", "foreign", "haven", "RODBC", "readxl", "magrittr", 
            "data.table", "lubridate",   "usethis", "here", "svGUI", "svDialogs", "janitor",
            "kableExtra", "conflicted", "gtsummary", "sysfonts", "extrafont", "scales",
          "forcats", "kableExtra", "fs", "odbc", "stringr", "stringi", "devtools")

## Function which installs packages if it is not available in the local machine
install_lib_packages <- function(pkg){
  new.pkg <- pkg[!(pkg %in% installed.packages()[, "Package"])]
  if (length(new.pkg))
    install.packages(new.pkg, dependencies = TRUE, repos = "http://cran.us.r-project.org")
  sapply(pkg, library, character.only = TRUE)
}
install_lib_packages(pkg)

## Run the following code, to work with gtsummary package
#withr::with_libpaths(  remotes::install_github("rstudio/gt", ref = gtsummary::gt_sha))


#External libraries installed directly from github
# remotes::install_github("vankesteren/firatheme")

### Updating libraries packages when R internal is different
 #update.packages(checkBuilt = TRUE)


### Normalizing filepaths
# normalizePath(readClipboard(), winslash = "\\", mustWork = NA)

conflict_prefer("here", "here")
conflict_prefer("filter", "dplyr")
conflict_prefer("between", "dplyr")
conflict_prefer("set_names", "purrr")
conflict_prefer("col_factor", "vroom")
conflict_prefer("year", "lubridate")

## BBC Style formatting libraries
# install.packages('devtools')
# install.packages("pkgload")
# devtools::install_github('bbc/bbplot')


####### Setting up an R profile.

## Setting up an Rprofile which will automatically load libraries and resolve any function conflicts.
## Functional conflicts is when two exactly named functions exist in two different libraries, and R does not know which one you are referring to.
## Solution: make a reference to the function package::function or use the conflict_prefer function to assign pick the right package containing the function. 
## For example, we usually prefer using the filter function from dplyr, so we can say conflict_prefer("filter", "dplyr")

## Every time R starts, it runs through a couple of R scripts. One of these scripts is the .Rprofile. This allows users to customise their particular set-up.

# usethis::edit_r_profile()
# usethis::edit_r_environ()
####### connecting to databases 

####### Setting up Keyring component (also add this to your .Rprofile, so it can be reset when passwords change)
## STORING DATABASE CREDENTIALS
##Here we just need to input the service name and username. An important point to note is that
## setting a username / password combination with keyring means that you can retrieve that password 
## in future R sessions even after your current R session has ended. This is because it is stored in your operating system’s credential store i.e. you only have to set your password with keyring once.


#### Enter your password when prompted for key_set; In order to prevent the password prompts
## everytime you restart R, please comment out the below code after setting it once!

# keyring::key_set_with_value("stg_reps", password=rstudioapi::askForPassword(prompt = "Please enter your password"))
# keyring::key_get("stg_reps") #this will retrieve your stg_reps pw

# keyring::key_set_with_value("stg_reps_pw", password=rstudioapi::askForPassword(prompt = "Please enter your STG_REPS password"))
#
# keyring::key_set_with_value("irdb_pw", password=rstudioapi::askForPassword(prompt = "Please enter your IRDB password"))
#
# keyring::key_set_with_value("adw_pw", password=rstudioapi::askForPassword(prompt = "Please enter your ADW password"))








