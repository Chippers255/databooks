FROM python:3.8-slim

# update the notebook first
RUN apt-get update && apt-get -y upgrade && apt-get install -y libsnappy-dev && apt-get install gcc -y && apt-get install -y g++ && apt-get clean

# install required python modules
RUN  python3 -m pip install matplotlib seaborn pandas jupyter python-snappy fastparquet numpy xgboost seaborn scikit-learn scipy jupyterlab python-dotenv pyarrow

# export the jupyter lab endpoint
EXPOSE 8888

# run from the correct folder
RUN mkdir /work
WORKDIR /work

# run jupyter lab server
ENTRYPOINT ["jupyter", "lab", "--port=8888", "--no-browser", "--ip='*'", "--NotebookApp.token=''", "--NotebookApp.password='sha1:ca81e648650f:0f68fa18d1fc124bf795f8c3ab594324760864f7'", "--allow-root"]
