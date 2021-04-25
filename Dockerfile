FROM continuumio/anaconda3:latest

LABEL maintainer="Krzysztof Bruszewski <krzysztof.bruszewski@gmail.com>"

# Installing packages for OS
RUN apt update -y \
&& apt -y install graphviz

# Updating Anaconda packages
RUN conda update conda -y \
&& conda update anaconda -y \
&& conda update --all -y \
&& python -m pip install --upgrade pip

# Installing additional libraries
RUN pip install tensorflow \
&& pip install keras

RUN conda install -y cudatoolkit \
&& conda install -y -c conda-forge py-xgboost \
&& conda install -y -c conda-forge lightgbm

# Creating a directory for Jupyter Notebooks
RUN mkdir -p /home/notebooks

WORKDIR /home/notebooks