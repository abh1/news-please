FROM python:latest@sha256:3a7e9a15b93d6729f06ef9262b57a109366581a90f628e0cdb0181184499cf48

RUN apt-get update && apt-get install -y npm curl git make gcc python-dev libffi-dev musl-dev libxml2-dev libxslt-dev openssl libssl-dev zlib1g-dev libjpeg-dev


# Create app directory
RUN mkdir -p /News_Feed/
WORKDIR /News_Feed/

COPY ./ .

RUN git clone https://github.com/abh1/news-please.git
RUN pip3 install -r requirements.txt
RUN pip3 install pandas==1.4.3
RUN pip3 install s3fs

COPY docker.sh /
RUN chmod +x /docker.sh

CMD ["/docker.sh"]