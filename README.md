Building (in the same folder where the Dockerfile is located):
```sh
docker build --no-cache -t chunkers-server .
```

Running:
```sh
docker run -t -i -e CHUNKERS_NAME='my awesome sussy server' --name chunkers-server chunkers-server
```
