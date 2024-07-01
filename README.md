# keio-breach-boyz
Repo for Database Systems lecture project

1. Clone ScalarDB repository
```sh
git clone https://github.com/scalar-labs/scalardb.git
```

2. Build Docker Container
Important: To fix context error while rebuilding, delete node_modules and app/node_modules
```sh
docker-compose up --build
```

2. Run App
```sh
cd app
yarn
yarn start
```

# How to enter main container

```sh
docker exec -it web-container /bin/sh  
```

# ScalarDB commands
```sh
java -jar scalardb-schema-loader-3.9.6-all.jar --config scalardb.properties --schema-file emoney.json --coordinator
```