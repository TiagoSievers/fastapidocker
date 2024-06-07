FROM ubuntu:latest
LABEL authors="sievers"

ENTRYPOINT ["top", "-b"]

#
FROM python:3.10

#
WORKDIR /code

#
COPY ./requirements.txt /code/requirements.txt

#
RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

#
COPY ./main.py /code/

#
CMD ["fastapi", "run", "main.py", "--port", "90"]