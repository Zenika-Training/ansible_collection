# libvirt_kvm

Create a KVM libvirt VM for SNO OpenShift from an RHCOS live ISO

## Table of contents

- [Requirements](#requirements)
- [Default Variables](#default-variables)
  - [libvirt_kvm_bridge](#libvirt_kvm_bridge)
  - [libvirt_kvm_cpu_model](#libvirt_kvm_cpu_model)
  - [libvirt_kvm_disk_size](#libvirt_kvm_disk_size)
  - [libvirt_kvm_graphics_listen](#libvirt_kvm_graphics_listen)
  - [libvirt_kvm_graphics_type](#libvirt_kvm_graphics_type)
  - [libvirt_kvm_iso_dest_dir](#libvirt_kvm_iso_dest_dir)
  - [libvirt_kvm_iso_host](#libvirt_kvm_iso_host)
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

- Minimum Ansible version: `2.14`

## Default Variables

### libvirt_kvm_bridge

Linux bridge interface on the KVM host used for the VM network.

#### Default value

```YAML
libvirt_kvm_bridge: br0
```

### libvirt_kvm_cpu_model

CPU model passed to libvirt. host-model exposes all host CPU features.

#### Default value

```YAML
libvirt_kvm_cpu_model: host-model
```

### libvirt_kvm_disk_size

Size of the VM disk in virt-install format (e.g. 120g).

#### Default value

```YAML
libvirt_kvm_disk_size: 120g
```

### libvirt_kvm_graphics_listen

Address on which the graphics server listens. 127.0.0.1 restricts to localhost.

#### Default value

```YAML
libvirt_kvm_graphics_listen: 127.0.0.1
```

### libvirt_kvm_graphics_type

Graphical display protocol for the VM console (vnc or spice).

#### Default value

```YAML
libvirt_kvm_graphics_type: vnc
```

### libvirt_kvm_iso_dest_dir

Directory on the KVM host where the ISO is copied before boot.

#### Default value

```YAML
libvirt_kvm_iso_dest_dir: /var/lib/libvirt/images
```

### libvirt_kvm_iso_host

Host where the source ISO resides. Defaults to localhost (Ansible controller).
Set to the KVM host name when the ISO was generated directly on the KVM host
(e.g. libvirt_kvm_iso_host: "{{ libvirt_kvm_target_host }}").
Controls both where the pre-check stat runs and whether the copy uses remote_src.

#### Default value

```YAML
libvirt_kvm_iso_host: localhost
```

### libvirt_kvm_iso_src

Path to the RHCOS live ISO on the host identified by libvirt_kvm_iso_host.

#### Default value

```YAML
libvirt_kvm_iso_src: /tmp/openshift/{{ libvirt_kvm_name }}/rhcos-live.iso
```

### libvirt_kvm_mac

MAC address of the VM NIC. Required — must be set in host_vars or inventory.
Used to ensure a predictable static IP via DHCP or DNS.

#### Default value

```YAML
libvirt_kvm_mac: ''
```

### libvirt_kvm_memory

RAM allocated to the VM, in MiB.

#### Default value

```YAML
libvirt_kvm_memory: 32768
```

### libvirt_kvm_name

Name of the VM. Defaults to the Ansible inventory hostname.

#### Default value

```YAML
libvirt_kvm_name: '{{ inventory_hostname }}'
```

### libvirt_kvm_osinfo

OS variant identifier passed to virt-install (--os-variant).

#### Default value

```YAML
libvirt_kvm_osinfo: fedora-coreos-stable
```

### libvirt_kvm_target_host

Ansible inventory hostname of the KVM host. Tasks that must run on the KVM host
are delegated to this host. Override in group_vars with the actual KVM server hostname.

#### Default value

```YAML
libvirt_kvm_target_host: localhost
```

### libvirt_kvm_vcpus

Number of virtual CPUs.

#### Default value

```YAML
libvirt_kvm_vcpus: 8
```

### libvirt_kvm_vg_pool

LVM volume group used to create the VM disk.

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
