FROM quay.io/keboola/docker-base-r-packages:3.2.1-d
MAINTAINER Ondrej Popelka <ondrej.popelka@keboola.com>

WORKDIR /home

# Initialize the transformation runner
COPY . /home/

# Install some commonly used R packages and the R application
RUN Rscript ./init.R

COPY Rconsole /usr/local/src/R/R-3.2.1/etc/

# Run the application
ENTRYPOINT Rscript ./main.R /data/
