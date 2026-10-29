# haproxy_lb

Configure HAProxy as the external API/MCS/ingress load balancer for a compact (3-master) OpenShift cluster

## Table of contents

- [Requirements](#requirements)
- [Default Variables](#default-variables)
  - [haproxy_lb_api_port](#haproxy_lb_api_port)
  - [haproxy_lb_bootstrap_enabled](#haproxy_lb_bootstrap_enabled)
  - [haproxy_lb_bootstrap_ip](#haproxy_lb_bootstrap_ip)
  - [haproxy_lb_bootstrap_name](#haproxy_lb_bootstrap_name)
  - [haproxy_lb_control_plane_hosts](#haproxy_lb_control_plane_hosts)
  - [haproxy_lb_http_port](#haproxy_lb_http_port)
  - [haproxy_lb_https_port](#haproxy_lb_https_port)
  - [haproxy_lb_machine_config_port](#haproxy_lb_machine_config_port)
  - [haproxy_lb_stats_enabled](#haproxy_lb_stats_enabled)
  - [haproxy_lb_stats_port](#haproxy_lb_stats_port)
- [Dependencies](#dependencies)
- [License](#license)
- [Author](#author)

---

## Requirements

- Minimum Ansible version: `2.14`

## Default Variables

### haproxy_lb_api_port

Kubernetes API server port, exposed on the control plane nodes (and bootstrap during install).

#### Default value

```YAML
haproxy_lb_api_port: 6443
```

### haproxy_lb_bootstrap_enabled

Whether the bootstrap node is added to the API server / Machine Config
Server pools. Keep haproxy_lb_bootstrap_name/haproxy_lb_bootstrap_ip set
permanently in the inventory (handy as a record of the bootstrap node's
identity) and flip only this boolean - e.g. `-e haproxy_lb_bootstrap_enabled=true`
for the initial install run, then plain (default false) once the bootstrap
node is destroyed after bootstrap-complete, instead of editing the IP out
of host_vars each time.

#### Default value

```YAML
haproxy_lb_bootstrap_enabled: false
```

### haproxy_lb_bootstrap_ip

IP address of the (temporary) bootstrap node. Only used when
haproxy_lb_bootstrap_enabled is true.

#### Default value

```YAML
haproxy_lb_bootstrap_ip: ''
```

### haproxy_lb_bootstrap_name

Name of the (temporary) bootstrap node. Only used when
haproxy_lb_bootstrap_enabled is true.

#### Default value

```YAML
haproxy_lb_bootstrap_name: bootstrap
```

### haproxy_lb_control_plane_hosts

List of the cluster's control-plane (master) nodes, each as {name, ip}.
Required - used as the backend pool for the API server, the Machine Config
Server, and the ingress (HTTP/HTTPS) traffic, since compute.replicas is 0
and mastersSchedulable is true on a compact (3-master, 0-worker) cluster.

#### Default value

```YAML
haproxy_lb_control_plane_hosts: []
```

### haproxy_lb_http_port

Ingress HTTP port, exposed on the control plane nodes.

#### Default value

```YAML
haproxy_lb_http_port: 80
```

### haproxy_lb_https_port

Ingress HTTPS port, exposed on the control plane nodes.

#### Default value

```YAML
haproxy_lb_https_port: 443
```

### haproxy_lb_machine_config_port

Machine Config Server port, exposed on the control plane nodes (and bootstrap during install).

#### Default value

```YAML
haproxy_lb_machine_config_port: 22623
```

### haproxy_lb_stats_enabled

Expose the HAProxy stats page.

#### Default value

```YAML
haproxy_lb_stats_enabled: true
```

### haproxy_lb_stats_port

Port of the HAProxy stats page, when haproxy_lb_stats_enabled is true.

#### Default value

```YAML
haproxy_lb_stats_port: 8404
```

## Dependencies

None.

## License

GPL-3.0-only

## Author

Yannick Sébastia
