# MySQL-router docker image

We were in need of a solution to connect to an external MariaDB Galera MySQL cluster from our kubernetes setup. For this reason we created this docker image.

## ENV settings / Default settings

```
BIND_ADDRESS     "0.0.0.0"
BIND_PORT        "3306"
ROUTING_STRATEGY "first-available"
DESTINATIONS     ""
```

## Kubernetes deployment example

```yaml
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: mysqlrouter
  namespace: default
  labels:
    app: mysqlrouter
    env: production
spec:
  replicas: 2
  selector:
    matchLabels:
      app: mysqlrouter
  template:
    metadata:
      labels:
        app: mysqlrouter
        env: production
    spec:
      containers:
        - name: mysqlrouter
          image: docker.io/usenetfarm/mysqlrouter:1
          resources:
            requests:
              memory: "64M"
              cpu: 500m
            limits:
              memory: "512M"
              cpu: "1"
          ports:
            - name: mysqlport
              containerPort: 3306
          env:
            - name: DESTINATIONS
              value: '1.2.3.4,5.6.7.8,9.10.11.12:3308'
            - name: ROUTING_STRATEGY
              value: round-robin

```
