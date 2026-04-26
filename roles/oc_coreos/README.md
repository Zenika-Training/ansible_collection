# oc_coreos

Préparation ISO RHCOS SNO (Single Node OpenShift) avec ignition embarqué

## Table of contents

- [Requirements](#requirements)
- [Default Variables](#default-variables)
  - [oc_coreos_arch](#oc_coreos_arch)
  - [oc_coreos_cilium_manifests_url](#oc_coreos_cilium_manifests_url)
  - [oc_coreos_cluster_network_cidr](#oc_coreos_cluster_network_cidr)
  - [oc_coreos_cluster_network_prefix](#oc_coreos_cluster_network_prefix)
  - [oc_coreos_install_disk](#oc_coreos_install_disk)
  - [oc_coreos_ocp_domain](#oc_coreos_ocp_domain)
  - [oc_coreos_ocp_ip](#oc_coreos_ocp_ip)
  - [oc_coreos_ocp_name](#oc_coreos_ocp_name)
  - [oc_coreos_ocp_network](#oc_coreos_ocp_network)
  - [oc_coreos_ocp_subnet](#oc_coreos_ocp_subnet)
  - [oc_coreos_pull_secret](#oc_coreos_pull_secret)
  - [oc_coreos_service_network](#oc_coreos_service_network)
  - [oc_coreos_ssh_key](#oc_coreos_ssh_key)
  - [oc_coreos_work_dir](#oc_coreos_work_dir)
- [Dependencies](#dependencies)
- [License](#license)
- [Author](#author)

---

## Requirements

- Minimum Ansible version: `2.1`

## Default Variables

### oc_coreos_arch

#### Default value

```YAML
oc_coreos_arch: x86_64
```

### oc_coreos_cilium_manifests_url

#### Default value

```YAML
oc_coreos_cilium_manifests_url: 
  https://docs.isovalent.com/v25.11/public/clife/clife-v1.18.8.tar.gz
```

### oc_coreos_cluster_network_cidr

#### Default value

```YAML
oc_coreos_cluster_network_cidr: 10.128.0.0/14
```

### oc_coreos_cluster_network_prefix

#### Default value

```YAML
oc_coreos_cluster_network_prefix: 23
```

### oc_coreos_install_disk

#### Default value

```YAML
oc_coreos_install_disk: /dev/vda
```

### oc_coreos_ocp_domain

#### Default value

```YAML
oc_coreos_ocp_domain: example.com
```

### oc_coreos_ocp_ip

#### Default value

```YAML
oc_coreos_ocp_ip: ''
```

### oc_coreos_ocp_name

#### Default value

```YAML
oc_coreos_ocp_name: '{{ inventory_hostname }}'
```

### oc_coreos_ocp_network

#### Default value

```YAML
oc_coreos_ocp_network: OVNKubernetes
```

### oc_coreos_ocp_subnet

#### Default value

```YAML
oc_coreos_ocp_subnet: 192.168.0.0/24
```

### oc_coreos_pull_secret

#### Default value

```YAML
oc_coreos_pull_secret: ''
```

### oc_coreos_service_network

#### Default value

```YAML
oc_coreos_service_network: 172.30.0.0/16
```

### oc_coreos_ssh_key

#### Default value

```YAML
oc_coreos_ssh_key: ''
```

### oc_coreos_work_dir

#### Default value

```YAML
oc_coreos_work_dir: /tmp/openshift/{{ oc_coreos_ocp_name }}
```

## Dependencies

None.

## License

GPL-3.0-only

## Author

Yannick Sébastia
