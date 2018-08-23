FROM ubuntu:18.04

RUN apt update && apt install -y texlive-lang-cjk xdvik-ja texlive-extra-utils
RUN apt install -y wget
RUN wget http://mirrors.ctan.org/macros/latex/contrib/multirow/multirow.dtx && wget http://mirrors.ctan.org/macros/latex/contrib/multirow/multirow.ins
RUN latex multirow.ins && cp multirow.sty /usr/share/texlive/texmf-dist/tex/latex/
RUN wget http://mirrors.ctan.org/macros/latex/contrib/booktabs/booktabs.dtx && wget http://mirrors.ctan.org/macros/latex/contrib/booktabs/booktabs.ins
RUN latex booktabs.ins && cp booktabs.sty /usr/share/texlive/texmf-dist/tex/latex/
RUN mktexlsr
