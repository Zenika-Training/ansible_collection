# libvirt_kvm

Create a KVM libvirt VM for SNO OpenShift from an RHCOS live ISO

## Table of contents

- [Requirements](#requirements)
- [Default Variables](#default-variables)
  - [libvirt_kvm_bridge](#libvirt_kvm_bridge)
  - [libvirt_kvm_cpu_model](#libvirt_kvm_cpu_model)
  - [libvirt_kvm_disk_cache](#libvirt_kvm_disk_cache)
  - [libvirt_kvm_disk_io](#libvirt_kvm_disk_io)
  - [libvirt_kvm_disk_size](#libvirt_kvm_disk_size)
  - [libvirt_kvm_extra_disks](#libvirt_kvm_extra_disks)
  - [libvirt_kvm_extra_networks](#libvirt_kvm_extra_networks)
  - [libvirt_kvm_first_boot_delay](#libvirt_kvm_first_boot_delay)
  - [libvirt_kvm_first_boot_retries](#libvirt_kvm_first_boot_retries)
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

### libvirt_kvm_disk_cache

libvirt disk cache mode (e.g. none, writeback, writethrough). "none" (O_DIRECT, no host page
cache) is the safest default but makes the heavy sequential I/O of a CoreOS install
(install-to-disk, then the machine-config-daemon OS rebase) significantly slower, especially on
an LVM-backed disk under I/O contention. "writeback" uses the host page cache and is markedly
faster for these training lab VMs, at the cost of possible data loss on a host crash/power loss -
an acceptable trade-off for disposable lab clusters, not for anything meant to survive a host
failure.

#### Default value

```YAML
libvirt_kvm_disk_cache: writeback
```

### libvirt_kvm_disk_io

libvirt disk I/O backend (native or threads). virt-install defaults virtio-blk disks to "native"
(Linux AIO), which only works with cache=none or cache=directsync - it refuses to start with
cache=writeback/writethrough. "threads" is required here to pair with libvirt_kvm_disk_cache's
writeback default.

#### Default value

```YAML
libvirt_kvm_disk_io: threads
```

### libvirt_kvm_disk_size

Size of the VM disk in virt-install format (e.g. 120g).

#### Default value

```YAML
libvirt_kvm_disk_size: 120g
```

### libvirt_kvm_extra_disks

Additional raw block devices to attach to the VM beyond the main OS disk, each backed by its own
LVM logical volume (vm_<name>_<item.name>) in libvirt_kvm_vg_pool. The role only creates and
attaches the block device - it never partitions or formats it; populating it (e.g. a day-1 LVMS/
LVM Storage volume group) is out of scope for this role.
List of objects: name (suffix for the LV/device, e.g. "lvms") and size (virt-install/lvol format,
e.g. "10g"). Empty by default - no extra disk.

#### Default value

```YAML
libvirt_kvm_extra_disks: []
```

### libvirt_kvm_extra_networks

Additional NICs to attach to the VM beyond the main libvirt_kvm_bridge interface, each on its own
libvirt virtual network (defined/started/autostarted by this role if not already present) instead
of the host bridge - kept separate from node/API traffic by construction. No <forward> element by
default (fully isolated, no path to the outside host network) - the safest default for a dedicated
inter-cluster link (Submariner/RHSI traffic) that firewall rules can discriminate from node/API
traffic on the same host, and that can be unplugged (virsh net-destroy on the KVM host) to simulate
a network cutoff without losing the primary NIC (API/SSH). Set forward_mode to "nat" or "route"
only if this network must also reach outside the host.
List of objects: name (libvirt network name, also used as its bridge name prefix), ip (gateway
address of the virtual network, e.g. "192.168.200.1"), netmask (e.g. "255.255.255.0"), mac (this
VM's NIC address on that network), forward_mode (optional, see above). Empty by default - no extra
NIC. Several VMs on the same KVM host share the same virtual network by listing the same name/ip/
netmask - defining it twice with identical values is idempotent.

#### Default value

```YAML
libvirt_kvm_extra_networks: []
```

### libvirt_kvm_first_boot_delay

Seconds between each VM status poll during first-boot wait.

#### Default value

```YAML
libvirt_kvm_first_boot_delay: 30
```

### libvirt_kvm_first_boot_retries

Number of status polls before giving up on the first-boot installation.
Each poll waits libvirt_kvm_first_boot_delay seconds.
Total maximum wait = retries × delay. Default: 120 × 30s = 60 minutes.
OCP 4.21+ requires more time due to automatic CPU/memory sizing (autoSizingReserved).

#### Default value

```YAML
libvirt_kvm_first_boot_retries: 120
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

MAC address of the VM NIC. Required - must be set in host_vars or inventory.
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
