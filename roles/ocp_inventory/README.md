# ocp_inventory

Generate an inventory skeleton for zenika.training SNO or compact cluster playbooks

## Table of contents

- [Requirements](#requirements)
- [Default Variables](#default-variables)
  - [ocp_inventory_bridge](#ocp_inventory_bridge)
  - [ocp_inventory_clusters](#ocp_inventory_clusters)
  - [ocp_inventory_dir](#ocp_inventory_dir)
  - [ocp_inventory_dns_server](#ocp_inventory_dns_server)
  - [ocp_inventory_domain](#ocp_inventory_domain)
  - [ocp_inventory_gateway](#ocp_inventory_gateway)
  - [ocp_inventory_kvm_host](#ocp_inventory_kvm_host)
  - [ocp_inventory_kvm_user](#ocp_inventory_kvm_user)
  - [ocp_inventory_subnet](#ocp_inventory_subnet)
- [Dependencies](#dependencies)
- [License](#license)
- [Author](#author)

---

## Requirements

- Minimum Ansible version: `2.14`

## Default Variables

### ocp_inventory_bridge

#### Default value

```YAML
ocp_inventory_bridge: br0
```

### ocp_inventory_clusters

List of cluster definitions. Each entry is a dict with:
name (required) : cluster name (install-config/DNS name, and Ansible
inventory hostname for a "sno" cluster)
topology (optional) : "sno" (default) or "compact"
cni (optional) : "ovn" (default) or "cilium"
--- sno only ---
ip, mac : node identity (host_vars)
metallb_ip_ranges : optional, list of ranges (host_vars)
--- compact only ---
control_plane_count : optional, defaults to the length of `masters`
memory, vcpus : optional, default 16384 MiB / 4 vCPU per node
bootstrap : {ip, mac} - temporary bootstrap node
masters : list of {name, ip, mac} - 3 by convention
loadbalancer : {name, ip, mac, root_password} - external LB VM
metallb_ip_ranges : optional, list of ranges

#### Default value

```YAML
ocp_inventory_clusters: []
```

#### Example usage

```YAML
ocp_inventory_clusters:
  - name: ocp1
    topology: sno
    cni: ovn
    ip: 192.168.17.150
    mac: "52:54:00:d1:a6:8c"
    metallb_ip_ranges: ["192.168.17.100-192.168.17.110"]
  - name: ocp4
    topology: compact
    cni: ovn
    bootstrap: {ip: 192.168.17.160, mac: "52:54:00:2d:42:3f"}
    masters:
      - {name: master1, ip: 192.168.17.161, mac: "52:54:00:b2:fb:47"}
      - {name: master2, ip: 192.168.17.162, mac: "52:54:00:82:a3:78"}
      - {name: master3, ip: 192.168.17.163, mac: "52:54:00:8e:46:b9"}
    loadbalancer: {name: lb1, ip: 192.168.17.110, mac: "52:54:00:64:07:79"}
    metallb_ip_ranges: ["192.168.17.40-192.168.17.49"]
```

### ocp_inventory_dir

#### Default value

```YAML
ocp_inventory_dir: "{{ lookup('env', 'PWD') }}"
```

### ocp_inventory_dns_server

Default DNS resolver written to a compact cluster's load-balancer
host_vars, when not set per-cluster. Left as a placeholder to fill in if
empty.

#### Default value

```YAML
ocp_inventory_dns_server: ''
```

### ocp_inventory_domain

#### Default value

```YAML
ocp_inventory_domain: lab.example.com
```

### ocp_inventory_gateway

Default gateway written to a compact cluster's load-balancer host_vars,
when not set per-cluster. Left as a placeholder to fill in if empty.

#### Default value

```YAML
ocp_inventory_gateway: ''
```

### ocp_inventory_kvm_host

#### Default value

```YAML
ocp_inventory_kvm_host: kvm-server
```

### ocp_inventory_kvm_user

#### Default value

```YAML
ocp_inventory_kvm_user: root
```

### ocp_inventory_subnet

#### Default value

```YAML
ocp_inventory_subnet: 192.168.0.0/24
```

## Dependencies

None.

## License

Apache-2.0

## Author

zenika
