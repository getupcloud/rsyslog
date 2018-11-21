# Rsyslog Chart

[Rsyslog](https://www.rsyslog.com/) is the rocket-fast system for log processing.


## Chart Details

This chart will do the following:

* Create a PersistentVolumeClaim to persist log files (one per source host)
* Install a deployment that provisions a single rsyslog pod
* Expose a service `syslog`


## Installing the Chart

To install the chart with the release name `my-release`:

```bash
$ git clone https://github.com/getupcloud/rsyslog.git
$ helm install --name my-release rsyslog/chart
```


## Configuration

The following table lists the configurable parameters of the Rsyslog chart and the default values.

| Parameter                   | Description                            | Default                 |
| -----------------------     | -------------------------------------- | ----------------------- |
| `image.rsyslog.repository`  | Image repo name for container          | `getupcloud/rsyslog`    |
| `image.rsyslog.tag`         | Image tag for container                | `latest`                |
| `image.pullPolicy`          | Image pull policy                      | `Always`                |
| `podAnnotations`            | Optional pod annotations               | `{}`                    |
| `storage.size`              | PersistentVolumeClaim size             | `50Gi`                  |
| `storage.storageClassName`  | PersistentVolumeClaim storageClassName | `gp2`                   |
| `resources.limits.cpu`      | CPU limit                              | `50m`                   |
| `resources.limits.memory`   | Memory limit                           | `256Mi`                 |
| `resources.requests.cpu`    | CPU request                            | `10m`                   |
| `resources.requests.memory` | Memory request                         | `128Mi`                 |
| | | |

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. For example,

```bash
$ helm install --name my-release -f my-values.yaml chart/
```
