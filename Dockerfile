FROM public.ecr.aws/lambda/python:3.11

WORKDIR /src

COPY setup.py setup.py
COPY src src
RUN pip install -e . --no-cache-dir

CMD ["app.lambda_handler"]