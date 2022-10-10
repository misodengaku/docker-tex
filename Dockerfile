FROM ubuntu:22.04

ENV TZ=Asia/Tokyo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN sed -i -e 's%archive.ubuntu.com/ubuntu%ftp.sakura.ad.jp/pub/linux/ubuntu%g' /etc/apt/sources.list
RUN apt-get update && apt-get install -y wget make python3-pip \
                                 texlive-base texlive-bibtex-extra texlive-binaries texlive-extra-utils \
                                 texlive-font-utils texlive-fonts-extra texlive-fonts-recommended \
                                 texlive-formats-extra texlive-humanities  texlive-lang-japanese \
                                 texlive-latex-base texlive-latex-extra  texlive-latex-recommended latexmk && \
    apt-get clean && rm -rf /var/lib/apt/lists/*
RUN wget http://mirrors.ctan.org/macros/latex/contrib/multirow/multirow.dtx && wget http://mirrors.ctan.org/macros/latex/contrib/multirow/multirow.ins & \
    wget http://mirrors.ctan.org/macros/latex/contrib/booktabs/booktabs.dtx && wget http://mirrors.ctan.org/macros/latex/contrib/booktabs/booktabs.ins & \
    latex multirow.ins && cp multirow.sty /usr/share/texlive/texmf-dist/tex/latex/ & \
    latex booktabs.ins && cp booktabs.sty /usr/share/texlive/texmf-dist/tex/latex/ & \
    mktexlsr  
RUN pip install -U Sphinx