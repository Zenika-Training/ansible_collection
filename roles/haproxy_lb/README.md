# haproxy_lb

Configure HAProxy as the external API/MCS/ingress load balancer for a compact (3-master) OpenShift cluster

## Table of contents

- [Requirements](#requirements)
- [Default Variables](#default-variables)
  - [haproxy_lb_api_port](#haproxy_lb_api_port)
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
- Target host: Debian (or any OS where the `haproxy` package is available via `ansible.builtin.package`)

## Default Variables

### haproxy_lb_api_port

Kubernetes API server port, exposed on the control plane nodes (and bootstrap during install).

#### Default value

```YAML
haproxy_lb_api_port: 6443
```

### haproxy_lb_bootstrap_ip

IP address of the temporary bootstrap node. Set during installation so that
bootstrap joins the API server / Machine Config Server pools; unset (empty
string) once the bootstrap node has been destroyed and re-run the role to
remove it from the pools, as required once bootstrapping completes.

#### Default value

```YAML
haproxy_lb_bootstrap_ip: ''
```

### haproxy_lb_bootstrap_name

Name of the temporary bootstrap node. Only used while the bootstrap node is
still up - see haproxy_lb_bootstrap_ip.

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

#### Example

```YAML
haproxy_lb_control_plane_hosts:
  - { name: master0, ip: 192.168.100.11 }
  - { name: master1, ip: 192.168.100.12 }
  - { name: master2, ip: 192.168.100.13 }
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
