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

#### Default value

```YAML
sno_inventory_clusters: []
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
