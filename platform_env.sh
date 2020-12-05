#!/bin/sh

set -a
#===================================================
# Project Environments.
# -------------
APP_DIR=app
DATA_DIR=data
ARTIFACTS_DIR=artifacts

# Notebook Environments.
# -------------
NOTEBOOK_WORKSPACE=/home/ai/work

# Postgres Environments.
# -------------
POSTGRES_USER=admin
POSTGRES_PASSWORD=secret
POSTGRES_STORAGE=logs/postgres_storage

# MLflow Environments.
# -------------
MLFLOW_EXPOSE_PORT=5000
MLFLOW_TRACKING_URI=http://mlflow:${MLFLOW_EXPOSE_PORT}
MLFLOW_TENSORFLOW_MODEL_LOG=True
MLFLOW_TENSORFLOW_AUTO_LOG=True
MLFLOW_LOG_PARAMS=True


# Tensorboard Environments.
# -------------
TENSORBOARD_LOGS_DIR=logs/tensorboard
TENSORBOARD_SCALAR_LOGS=True
TENSORBOARD_IMAGES_DISPLAY=True
TENSORBOARD_CONFUSION_MATRIX=True

#===================================================
set +a