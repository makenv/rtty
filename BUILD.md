##

```
bake build-all
```

```
bake \
 --set "*.args.HTTP_PROXY=http://172.17.0.1:4411" \
 --set "*.args.HTTPS_PROXY=http://172.17.0.1:4411" \
 build-all
```

