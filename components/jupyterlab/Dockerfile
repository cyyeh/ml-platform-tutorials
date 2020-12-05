FROM nvidia/cuda:10.1-cudnn7-runtime-ubuntu18.04

WORKDIR /work

USER root
COPY ./package.list .
RUN apt-get update && cat package.list | grep -vE "^\s*#" | xargs apt-get install -y --no-install-recommends && \
    rm ./package.list && apt-get clean

# install python 3.7.9
ENV TZ=Asia/Taipei
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && \
    apt-get install -y --no-install-recommends make build-essential libssl-dev zlib1g-dev \
    libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev \
    libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev python-openssl \
    git && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN useradd -ms /bin/bash ai
USER ai
WORKDIR /home/ai/work

ENV HOME  /home/ai
ENV PYENV_ROOT $HOME/.pyenv
ENV PATH $PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH
RUN git clone https://github.com/pyenv/pyenv.git ~/.pyenv
RUN pyenv install 3.7.9 && pyenv global 3.7.9

RUN pip install --upgrade pip

USER root
COPY ./requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt && rm requirements.txt
USER ai

CMD ["jupyter", "lab", "--ip=0.0.0.0", "--allow-root", "--no-browser", "--NotebookApp.token=''", "--NotebookApp.password=''"]