# syntax=docker/dockerfile:1

FROM rocker/tidyverse:4.3

RUN apt-get update && apt-get install -y \
	libcurl4-openssl-dev \
	libssl-dev \
	libxml2-dev \
	libtiff-dev \
	libfreetype6-dev \
	pandoc \
	libfontconfig1-dev \
	libfribidi-dev \
	libharfbuzz-dev \
	default-jdk \
	libglpk-dev \
	libgmp3-dev \
	libglu1-mesa-dev \
	libgl1-mesa-dev \
	imagemagick \
	libmagick++-dev \
	&& rm -rf /var/lib/apt/lists/*
RUN R -e 'install.packages("pak", repos = sprintf("https://r-lib.github.io/p/pak/stable/%s/%s/%s", .Platform[["pkgType"]], R.Version()[["os"]], R.Version()[["arch"]]))'
RUN R -e 'pak::pkg_install(c("cli","sessioninfo","argparse"),upgrade = TRUE,ask = FALSE)' \
	&& R -e 'pak::cache_clean()'
