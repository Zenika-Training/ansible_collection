# libvirt_kvm

Création d'une VM KVM libvirt pour SNO OpenShift à partir d'une ISO RHCOS

## Table of contents

- [Requirements](#requirements)
- [Default Variables](#default-variables)
  - [libvirt_kvm_bridge](#libvirt_kvm_bridge)
  - [libvirt_kvm_cpu_model](#libvirt_kvm_cpu_model)
  - [libvirt_kvm_disk_size](#libvirt_kvm_disk_size)
  - [libvirt_kvm_graphics_listen](#libvirt_kvm_graphics_listen)
  - [libvirt_kvm_graphics_type](#libvirt_kvm_graphics_type)
  - [libvirt_kvm_iso_dest_dir](#libvirt_kvm_iso_dest_dir)
  - [libvirt_kvm_iso_src](#libvirt_kvm_iso_src)
  - [libvirt_kvm_mac](#libvirt_kvm_mac)
  - [libvirt_kvm_memory](#libvirt_kvm_memory)
  - [libvirt_kvm_name](#libvirt_kvm_name)
  - [libvirt_kvm_osinfo](#libvirt_kvm_osinfo)
  - [libvirt_kvm_target_host](#libvirt_kvm_target_host)
  - [libvirt_kvm_vcpus](#libvirt_kvm_vcpus)
  - [libvirt_kvm_vg_pool](#libvirt_kvm_vg_pool)
- [Dependencies](#dependencies)
- [License](#license)
- [Author](#author)

---

## Requirements

- Minimum Ansible version: `2.1`

## Default Variables

### libvirt_kvm_bridge

#### Default value

```YAML
libvirt_kvm_bridge: br0
```

### libvirt_kvm_cpu_model

#### Default value

```YAML
libvirt_kvm_cpu_model: host-model
```

### libvirt_kvm_disk_size

#### Default value

```YAML
libvirt_kvm_disk_size: 120g
```

### libvirt_kvm_graphics_listen

#### Default value

```YAML
libvirt_kvm_graphics_listen: 127.0.0.1
```

### libvirt_kvm_graphics_type

#### Default value

```YAML
libvirt_kvm_graphics_type: vnc
```

### libvirt_kvm_iso_dest_dir

#### Default value

```YAML
libvirt_kvm_iso_dest_dir: /var/lib/libvirt/images
```

### libvirt_kvm_iso_src

#### Default value

```YAML
libvirt_kvm_iso_src: /tmp/openshift/{{ libvirt_kvm_name }}/rhcos-live.iso
```

### libvirt_kvm_mac

#### Default value

```YAML
libvirt_kvm_mac: ''
```

### libvirt_kvm_memory

#### Default value

```YAML
libvirt_kvm_memory: 32768
```

### libvirt_kvm_name

#### Default value

```YAML
libvirt_kvm_name: '{{ inventory_hostname }}'
```

### libvirt_kvm_osinfo

#### Default value

```YAML
libvirt_kvm_osinfo: fedora-coreos-stable
```

### libvirt_kvm_target_host

#### Default value

```YAML
libvirt_kvm_target_host: localhost
```

### libvirt_kvm_vcpus

#### Default value

```YAML
libvirt_kvm_vcpus: 8
```

### libvirt_kvm_vg_pool

#### Default value

```YAML
libvirt_kvm_vg_pool: vg_guest
```

## Dependencies

None.

## License

GPL-3.0-only

## Author

Yannick Sébastia
