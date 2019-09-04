FROM tensorflow/tensorflow:latest-gpu-py3-jupyter
RUN apt-get -y update && apt-get install -y --no-install-recommends \
        git libgmp3-dev \
        libsndfile1
RUN git clone --depth=1 https://github.com/ajaypr55/ludwig.git \
    && cd ludwig/ \
    && pip install -r requirements.txt \
    && python -m spacy download en \
    && python setup.py install
# docker build command should be run under root directory of github checkout.
RUN pip3 install tensorflow-model-analysis
RUN pip3 install tfx
RUN pip3 install catboost
RUN pip3 install xgboost
RUN pip3 install flair
RUN pip3 install news-please 

#kaggle-cli lib
RUN pip3 install kaggle-cli
#
RUN pip3 install ipywidgets


RUN jupyter nbextension enable --py widgetsnbextension 
RUN jupyter nbextension install --py --symlink tensorflow_model_analysis 
RUN jupyter nbextension enable --py tensorflow_model_analysis
#RUN ${PIP} install sparkmagic
#RUN jupyter nbextension enable --py --sys-prefix widgetsnbextension
#RUN jupyter-kernelspec install --user $(pip show sparkmagic | grep Location | cut -d" " -f2)/sparkmagic/kernels/sparkkernel
#RUN jupyter-kernelspec install --user $(pip show sparkmagic | grep Location | cut -d" " -f2)/sparkmagic/kernels/pysparkkernel
#RUN jupyter-kernelspec install --user $(pip show sparkmagic | grep Location | cut -d" " -f2)/sparkmagic/kernels/sparkrkernel
#RUN jupyter serverextension enable --py sparkmagic
