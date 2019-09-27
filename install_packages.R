# Install packages to a docker image with packrat

### Initialize renv ###

# Install renv
install.packages("remotes", repos = "https://cran.rstudio.com/")
remotes::install_github("rstudio/renv")

# Initialize renv, but don't let it try to find packages to install itself.

renv::consent(provided = TRUE)

renv::init(
  bare = TRUE,
  force = TRUE,
  restart = FALSE)

renv::activate()

### Setup repositories ###

# Install packages that install packages.
install.packages("BiocManager", repos = "https://cran.rstudio.com/")
install.packages("remotes", repos = "https://cran.rstudio.com/")

# Specify repositories so they get included in
# packrat.lock file.
my_repos <- BiocManager::repositories()
my_repos["CRAN"] <- "https://cran.rstudio.com/"
options(repos = my_repos)

### Install packages ###

# All packages will be installed to
# the project-specific packrat library.

# Here we are just installing one package per repository
# as an example. If you want to install others, just add
# them to the vectors.

# Install CRAN packages
cran_packages <- c("glue")
install.packages(cran_packages)

# Install bioconductor packages
bioc_packages <- c("BiocVersion")
BiocManager::install(bioc_packages)

# Install github packages
github_packages <- c("joelnitta/minimal")
remotes::install_github(github_packages)

### Take snapshot ###

renv::snapshot(type = "simple")
