FROM continuumio/anaconda3:latest

LABEL maintainer="Krzysztof Bruszewski <krzysztof.bruszewski@gmail.com>"

# Installing packages for operating system
RUN apt update -y \
&& apt -y install graphviz

# Updating Anaconda packages
RUN conda update conda -y \
&& conda update anaconda -y \
&& conda update --all -y \
&& python -m pip install --upgrade pip

# Installing additional libraries for Python
RUN pip install psycopg2-binary \
&& pip install https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow_cpu-2.4.0-cp38-cp38-manylinux2010_x86_64.whl \
&& pip install keras

RUN conda install -y -c conda-forge pydotplus \
&& conda install -y -c conda-forge py-xgboost \
&& conda install -y -c conda-forge lightgbm

# Creating a directory for Jupyter Notebooks
RUN mkdir -p /home/notebooks

# Setting working directory
WORKDIR /home/notebooks