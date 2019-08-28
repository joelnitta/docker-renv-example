my_repos <- BiocManager::repositories()
my_repos["CRAN"] <- "https://cran.rstudio.com/"
options(repos = my_repos)

install.packages("remotes", repos = "https://cran.rstudio.com/")
remotes::install_github("rstudio/renv")
renv::restore(library = "renv")