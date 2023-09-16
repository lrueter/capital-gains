FROM python:3

WORKDIR /usr/src/app

#COPY requirements.txt ./
#RUN pip install --no-cache-dir -r requirements.txt
RUN pip install capital-gains

COPY . .

#CMD [ "./capital-gains -t input/example.csv > output/example.txt" ]