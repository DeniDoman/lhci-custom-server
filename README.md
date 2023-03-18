# lhci-custom-server

---
Unlike the [original Docker image](https://github.com/GoogleChrome/lighthouse-ci/tree/main/docs/recipes/docker-server), here you can use your own configuration.

There is no default configuration here, so create `lighthouserc.json`:
```
{
  "ci": {
    "server": {
      "port": 9001,
      "storage": {
        "storageMethod": "sql",
        "sqlDialect": "sqlite",
        "sqlDatabasePath": "/data/lhci.db"
      }
    }
  }
}
```
also create Docker persistent volume:
```
docker volume create lhci-data
```
then copy the configuration to the volume (using temp container):
```
docker run -v lhci-data:/data --name helper busybox true
docker cp lighthouserc.json helper:/data
docker rm helper
```
and finally run lhci-custom-server:
```
docker container run --publish 9001:9001 -v lhci-data:/data --detach ghcr.io/denidoman/lhci-custom-server:main
```
