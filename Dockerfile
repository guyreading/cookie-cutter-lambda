FROM public.ecr.aws/lambda/python:3.11

WORKDIR /src

COPY setup.py setup.py
COPY setup.cfg setup.cfg
COPY src/app.py ${LAMBDA_TASK_ROOT}
RUN pip install -e . --no-cache-dir

RUN yum -y update
RUN yum -y install wget
RUN yum install -y tar.x86_64
RUN yum install -y gzip
RUN yum clean all

CMD ["src.app.lambda_handler"]