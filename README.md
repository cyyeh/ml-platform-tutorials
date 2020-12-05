# ML Platform

idea credit: https://github.com/erdiolmezogullari/ml-fmnist-mlflow-tensorboard

In this case, we used docker container technologies to create the ML platform from scratch.
It consists of four different docker containers (MLflow, JupyterLab, PostgreSQL, TensorBoard) that are already built in `docker-compose.yml`.
Now we installed TensorFlow2.3.1 in JupyterLab.

## Prerequisites

- [Install Docker](https://docs.docker.com/engine/install/)
- [Install docker-compose](https://docs.docker.com/compose/install/)
- If you would like to use GPU, please install [nvidia-docker2](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html#setting-up-nvidia-container-toolkit), and set nvidia as the default runtime
  - add `"default-runtime": "nvidia"` to `/etc/docker/daemon.json` like this:
  ```
  {
    "default-runtime": "nvidia",
    "runtimes": {
        "nvidia": {
            "path": "/usr/bin/nvidia-container-runtime",
            "runtimeArgs": []
        }
    }
  }
  ```
  - execute `sudo systemctl daemon-reload` and `sudo systemctl restart docker`

## Usage

1. Add the training data under the `data` directory.
2. Add training scripts, notebooks under the `app` directory.
3. Experiment artifacts would be stored under the `artifacts` directory.
4. Database logs and Tensorboard logs would be stored under the `logs` directory.

* To start the platform(it will pull the latest images of the ml-platform from [Docker Hub](https://hub.docker.com/r/chihyuyeh/ml-platform)):

        make up

* To stop the platform:

        make stop

* To stop the platform and remove containers:
  
        make down

* To visit JupyterLab, type the following address on your favorite browser:
        
        http://localhost:8888/

* To visit TensorBoard, type the following address on your favorite browser:
    
        http://localhost:6006/
     
* To visit Mlflow, type the following address on your favorite browser:
    
        http://localhost:5000/

* To build the platform(**only needed if you want to customize it**), update the image tag for each service you would like to update in `docker-compose.yml` file and then:

        make up

## Example Project Structure

```
.
├── README.md
├── app
│   ├── cifar10.ipynb
│   └── train-cifar10.py
├── artifacts
├── components
│   ├── jupyterlab
│   ├── mlflow
│   ├── postgres
│   └── tensorboard
├── data
├── docker-compose.yml
├── logs
│   ├── postgres_storage
│   └── tensorboard
├── makefile
├── platform.sh
└── platform_env.sh
```

### Notes on docker image sizes

- Before minimizing docker image sizes
  - ml-platform_jupyterlab: 6.26GB
  - ml-platform_mlflow: 1.15GB
  - ml-platform_tensorboard: 1.47GB
  - ml-platform_postgres: 0.16GB
- After minimizing docker image sizes
  - ml-platform_jupyterlab: 3.7GB(41% reduced)
  - ml-platform_mlflow: 1.09GB(5% reduced)
  - ml-platform_tensorboard: 0.21GB(86% reduced)
  - ml-platform_postgres: 0.16GB(0% reduced)