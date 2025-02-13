# somali_customs

Repository for example docker image for article:  

## Get image
You can get it from ghcr or build manualy.

### Get from ghcr.io
```shell
docker pull ghcr.io/the29a/somali_customs:latest
```

### Build manualy

```shell
docker build -t somali_customs .  
```

## Run

```shell
docker run -p 5000:5000 ghcr.io/the29a/somali_customs:latest
```

```shell
docker run -p 5000:5000 somali_customs
```
