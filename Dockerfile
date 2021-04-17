FROM python:3.8-slim

# update the notebook first
RUN apt-get update && apt-get -y upgrade

# install required python modules
RUN  python3 -m pip install python-dotenv numpy scipy matplotlib pandas seaborn jupyter jupyterlab

# export the jupyter lab endpoint
EXPOSE 8888

# run jupyter lab server
ENTRYPOINT ["jupyter", "lab", "--port=8888", "--no-browser", "--ip=0.0.0.0", "--allow-root"]
