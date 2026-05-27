# sno_inventory

Generate an SNO inventory skeleton for zenika.training SNO playbooks

## Table of contents

- [Requirements](#requirements)
- [Default Variables](#default-variables)
  - [sno_inventory_bridge](#sno_inventory_bridge)
  - [sno_inventory_clusters](#sno_inventory_clusters)
  - [sno_inventory_dir](#sno_inventory_dir)
  - [sno_inventory_domain](#sno_inventory_domain)
  - [sno_inventory_kvm_host](#sno_inventory_kvm_host)
  - [sno_inventory_kvm_user](#sno_inventory_kvm_user)
  - [sno_inventory_subnet](#sno_inventory_subnet)
- [Dependencies](#dependencies)
- [License](#license)
- [Author](#author)

---

## Requirements

- Minimum Ansible version: `2.14`

## Default Variables

### sno_inventory_bridge

#### Default value

```YAML
sno_inventory_bridge: br0
```

### sno_inventory_clusters

List of SNO cluster definitions. Each entry is a dict with the following keys:
name (required) : cluster name, used as Ansible inventory hostname
cni (optional) : CNI plugin — "ovn" (default) or "cilium"
ip (optional) : static IP of the node (written to host_vars)
mac (optional) : MAC address of the KVM NIC (written to host_vars)
metallb_ip_ranges (optional): list of IP ranges reserved for MetalLB LoadBalancer
in "start-end" or CIDR notation (written to host_vars)

#### Default value

```YAML
sno_inventory_clusters: []
```

#### Example usage

```YAML
sno_inventory_clusters:
  - name: ocp1
    cni: ovn
    ip: 192.168.17.150
    mac: "52:54:00:d1:a6:8c"
    metallb_ip_ranges:
      - "192.168.17.100-192.168.17.110"
  - name: ocp2
    cni: cilium
    ip: 192.168.17.151
    mac: "52:54:00:d2:b7:9d"
    metallb_ip_ranges:
      - "192.168.17.120-192.168.17.130"
```

### sno_inventory_dir

#### Default value

```YAML
sno_inventory_dir: "{{ lookup('env', 'PWD') }}"
```

### sno_inventory_domain

#### Default value

```YAML
sno_inventory_domain: lab.example.com
```

### sno_inventory_kvm_host

#### Default value

```YAML
sno_inventory_kvm_host: kvm-server
```

### sno_inventory_kvm_user

#### Default value

```YAML
sno_inventory_kvm_user: root
```

### sno_inventory_subnet

#### Default value

```YAML
sno_inventory_subnet: 192.168.0.0/24
```

## Dependencies

None.

## License

Apache-2.0

## Author

zenika
