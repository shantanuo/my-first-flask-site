FROM arm64v8/python:3

RUN curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py \
    | python -

ENV PATH="/root/.poetry/bin:$PATH"

WORKDIR /usr/src/app

COPY static static
COPY templates templates
COPY main.py poetry.lock pyproject.toml ./

RUN poetry install

ENTRYPOINT [ "poetry", "run", "python", "main.py" ]
