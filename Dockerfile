FROM python:3.9

# Keep Python output unbuffered so logs show up in `docker logs`
ENV PYTHONUNBUFFERED=1
ENV PYTHONDONTWRITEBYTECODE=1

WORKDIR /app/backend

COPY requirements.txt /app/backend
RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y gcc default-libmysqlclient-dev pkg-config \
    && rm -rf /var/lib/apt/lists/*


# Install app dependencies
RUN pip install mysqlclient
RUN pip install --no-cache-dir -r requirements.txt

COPY . /app/backend

EXPOSE 8000
#RUN python manage.py migrate
#RUN python manage.py makemigrations
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
