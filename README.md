# lhci-custom-server

---
Unlike the [original Docker image](https://github.com/GoogleChrome/lighthouse-ci/tree/main/docs/recipes/docker-server), here you can use your own configuration.

There is a default configuration, but if you want to override it with yours, then just pass `CONFIG_PATH` environment variable, containing path to your own configuration, into the container:
```
docker container run -e CONFIG_PATH=/data/lighthouserc.json -p 9001:9001 -v lhci-data:/data -d ghcr.io/denidoman/lhci-custom-server:main
```

In the example above we use configuration file placed in `/data/lighthouserc.json`, so of course you need to create this file inside the `lhci-data` persistent volume first.
