# Only run this after making renv.lock by
# running install_packages.R

FROM rocker/verse:3.6.0

RUN apt-get update

COPY ./renv.lock ./

COPY ./renv_restore.R ./

RUN mkdir renv

RUN Rscript renv_restore.R

RUN echo '.libPaths("/renv")' >> /usr/local/lib/R/etc/Rprofile.site