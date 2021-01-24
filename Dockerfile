FROM puckel/docker-airflow:1.10.9

ARG AIRFLOW_USER_HOME=/usr/local/airflow
ARG AIRFLOW_HOME=~/airflow/
ENV AIRFLOW_HOME=${AIRFLOW_USER_HOME}

ADD requirements.txt /usr/local/airflow/requirements.txt
ADD scripts /usr/local/airflow/scripts
COPY config/airflow.cfg /usr/local/airflow/airflow.cfg
COPY entrypoint.sh /entrypoint.sh


RUN /usr/local/bin/python -m pip install -r /usr/local/airflow/requirements.txt

ENV TZ Asia/Bangkok

WORKDIR ${AIRFLOW_USER_HOME}
ENTRYPOINT ["/entrypoint.sh"]
