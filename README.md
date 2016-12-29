# Kitura-Flex
A sample app running Swift + [Kitura](http://www.kitura.io/) on
[Google App Engine](https://cloud.google.com/appengine/)'s
[Flexible Environment](https://cloud.google.com/appengine/docs/flexible).

# Setup Instructions

## Before you begin
Follow the first three instructions on the [GAE Flex Quickstart](https://cloud.google.com/appengine/docs/flexible/custom-runtimes/quickstart)
to [create a GCP Project](https://console.cloud.google.com), install the
[GCloud SDK](https://cloud.google.com/sdk), and initialize your environment.

## Running Kitura-Flex
Running Swift and Kitura on GAE Flex is as easy as:

```bash
git clone https://github.com/mcdonamp/kitura-flex
cd kitura-flex
gcloud app deploy
```

# Advanced Usage

## Logging

Logs are output to [Google Cloud Logging](https://console.cloud.google.com/logs)
in two phases:
  1. Container Builder > $build_id
  2. GAE Application > $service_name > $version

The first set of logs are useful for debugging the container build and
deployment, while the second are used for monitoring the app in production. Any
log statements from your Kitura app will be forwarded to Cloud Logging.

Continue reading the docs for more info on
[application logging](https://cloud.google.com/appengine/docs/flexible/custom-runtimes/build#logging).

## Lifecycle management
Per [Building GAE Flex Custom Runtimes](https://cloud.google.com/appengine/docs/flexible/custom-runtimes/build)
your application should handle certain lifecycle events, such as `start`, `stop`
, and `health` events.

```swift
// Respond to GAE Health checks (mandatory)
router.all("/_ah/health", handler: health)

// Respond to GAE start, stop requests (optional)
router.all("/_ah/start", handler: start)
router.all("/_ah/stop", handler: stop)
```

Continue reading the docs for more info on
[lifecycle events](https://cloud.google.com/appengine/docs/flexible/custom-runtimes/build#lifecycle_events).

## Tweak `app.yaml`
`app.yaml` currently has the bare minimum required for a GAE Flex app, but can
be configured to do far more than run an app. You can use `app.yaml` to specify
resource allocation, configure health checks, and tune autoscaling params.

Continue reading the docs for more info on
[`app.yaml`](https://cloud.google.com/appengine/docs/flexible/python/configuring-your-app-with-app-yaml).
