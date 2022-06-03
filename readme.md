### Setup

1. Create environment file:
```
cp .env.example .env
```
2. Update .env with your honeycomb api key

### Run
```
docker-compose up
```

### View Metrics
Compare http://localhost:9292/metrics to prom-metrics-demo dataset in Honeycomb.