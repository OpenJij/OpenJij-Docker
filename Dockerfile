# Ubuntu をベースイメージに
FROM ubuntu:18.04

ENV HOME /root
ENV PYENV_ROOT $HOME/.pyenv
ENV PATH $PYENV_ROOT/bin:$PATH
ENV PATH $PYENV_ROOT/shims:$PATH

RUN apt-get update && apt-get install -y build-essential \
  make wget \
  libffi-dev \
  libssl-dev \
  zlib1g-dev \
  libbz2-dev libreadline-dev libsqlite3-dev \
  git && \
  apt-get clean
RUN git clone https://github.com/pyenv/pyenv.git ~/.pyenv && \
    echo 'eval "$(pyenv init -)"' >> ~/.bashrc && eval "$(pyenv init -)" && \
    pyenv install 3.7.6 && pyenv global 3.7.6
RUN python -m pip install --upgrade pip && \
    pip install cmake numpy scipy matplotlib openjij pyqubo dimod


