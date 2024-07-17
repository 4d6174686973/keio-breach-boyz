# keio-breach-boyz

Old Repo for Database Systems lecture project.

- Initial idea of this repo was to use code from scalardb as basis for the backend and integrate it into react app frontend
- Problem: Spring Boot integration somehow does not work
- Also I think after trying 1 million things I somehow misconfigured the docker and devcontainer setup, which makes it difficult to further develop

# How to run

### Build Docker Container

Important: To fix context error while rebuilding, delete node_modules and app/node_modules

```sh
docker-compose up --build
```

### Run App

Open frontend dev container and run yarn commands

```sh
yarn
yarn start
```

Website should run on http://localhost:3000/

# Other Notes

### ScalarDB troubleshooting

If this Error occurs

```sh
/usr/bin/env: 'sh\r': No such file or directory
/usr/bin/env: use -[v]S to pass options in shebang lines
```

run this command from root directory

```sh
dos2unix scalardb/gradlew
```

### ScalarDB commands

Clone Repo

```sh
git clone https://github.com/scalar-labs/scalardb.git
```

Getting Started

```sh
cd scalardb/docs/getting-started
java -jar scalardb-schema-loader-3.9.6.jar --config scalardb.properties --schema-file emoney.json --coordinator
```

ScalarDB Sample (same for Multi-Storage Transactions)

```sh
cd scalardb
java -jar scalardb-schema-loader-3.9.6.jar --config database.properties --schema-file schema.json --coordinator
./gradlew run --args="LoadInitialData"
./gradlew run --args="GetCustomerInfo 1"
./gradlew run --args="PlaceOrder 1 1:3,2:2"
./gradlew run --args="GetOrder <ORDER_ID_UUID>"
./gradlew run --args="PlaceOrder 1 5:1"
./gradlew run --args="GetOrders 1"
./gradlew run --args="PlaceOrder 1 3:1,4:1"
./gradlew run --args="Repayment 1 8000"
./gradlew run --args="GetCustomerInfo 1"
./gradlew run --args="PlaceOrder 1 3:1,4:1"
```

# Build Jar File

```sh
./gradlew clean bootJar
```
