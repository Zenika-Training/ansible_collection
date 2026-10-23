# debian_lb_vm

Create a KVM libvirt Debian VM from a network install tree and a preseed file

## Table of contents

- [Requirements](#requirements)
- [Default Variables](#default-variables)
  - [debian_lb_vm_authorized_keys](#debian_lb_vm_authorized_keys)
  - [debian_lb_vm_bridge](#debian_lb_vm_bridge)
  - [debian_lb_vm_cpu_model](#debian_lb_vm_cpu_model)
  - [debian_lb_vm_disk_size](#debian_lb_vm_disk_size)
  - [debian_lb_vm_dns](#debian_lb_vm_dns)
  - [debian_lb_vm_domain](#debian_lb_vm_domain)
  - [debian_lb_vm_first_boot_delay](#debian_lb_vm_first_boot_delay)
  - [debian_lb_vm_first_boot_retries](#debian_lb_vm_first_boot_retries)
  - [debian_lb_vm_gateway](#debian_lb_vm_gateway)
  - [debian_lb_vm_graphics_listen](#debian_lb_vm_graphics_listen)
  - [debian_lb_vm_graphics_type](#debian_lb_vm_graphics_type)
  - [debian_lb_vm_install_tree](#debian_lb_vm_install_tree)
  - [debian_lb_vm_ip](#debian_lb_vm_ip)
  - [debian_lb_vm_mac](#debian_lb_vm_mac)
  - [debian_lb_vm_memory](#debian_lb_vm_memory)
  - [debian_lb_vm_name](#debian_lb_vm_name)
  - [debian_lb_vm_netmask](#debian_lb_vm_netmask)
  - [debian_lb_vm_ntp_server](#debian_lb_vm_ntp_server)
  - [debian_lb_vm_osinfo](#debian_lb_vm_osinfo)
  - [debian_lb_vm_root_password](#debian_lb_vm_root_password)
  - [debian_lb_vm_target_host](#debian_lb_vm_target_host)
  - [debian_lb_vm_user_account](#debian_lb_vm_user_account)
  - [debian_lb_vm_vcpus](#debian_lb_vm_vcpus)
  - [debian_lb_vm_vg_pool](#debian_lb_vm_vg_pool)
  - [debian_lb_vm_work_dir](#debian_lb_vm_work_dir)
- [Dependencies](#dependencies)
- [License](#license)
- [Author](#author)

---

## Requirements

- Minimum Ansible version: `2.14`

## Default Variables

### debian_lb_vm_authorized_keys

List of public SSH keys injected into debian_lb_vm_user_account's authorized_keys.

#### Default value

```YAML
debian_lb_vm_authorized_keys: []
```

### debian_lb_vm_bridge

Linux bridge interface on the KVM host used for the VM network.

#### Default value

```YAML
debian_lb_vm_bridge: br0
```

### debian_lb_vm_cpu_model

CPU model passed to libvirt. host-model exposes all host CPU features.

#### Default value

```YAML
debian_lb_vm_cpu_model: host-model
```

### debian_lb_vm_disk_size

Size of the VM disk in LVM lvol format (e.g. 20g).

#### Default value

```YAML
debian_lb_vm_disk_size: 20g
```

### debian_lb_vm_dns

DNS resolver(s) used by the VM. Required.

#### Default value

```YAML
debian_lb_vm_dns: ''
```

### debian_lb_vm_domain

DNS domain appended to debian_lb_vm_name to form the VM FQDN.

#### Default value

```YAML
debian_lb_vm_domain: example.com
```

### debian_lb_vm_first_boot_delay

Seconds between each VM status poll during first-boot wait.

#### Default value

```YAML
debian_lb_vm_first_boot_delay: 15
```

### debian_lb_vm_first_boot_retries

Number of status polls before giving up on the first-boot installation.
Each poll waits debian_lb_vm_first_boot_delay seconds.

#### Default value

```YAML
debian_lb_vm_first_boot_retries: 60
```

### debian_lb_vm_gateway

Default gateway for the VM. Required.

#### Default value

```YAML
debian_lb_vm_gateway: ''
```

### debian_lb_vm_graphics_listen

Address on which the graphics server listens. 127.0.0.1 restricts to localhost.

#### Default value

```YAML
debian_lb_vm_graphics_listen: 127.0.0.1
```

### debian_lb_vm_graphics_type

Graphical display protocol for the VM console (vnc or spice).

#### Default value

```YAML
debian_lb_vm_graphics_type: vnc
```

### debian_lb_vm_install_tree

URL of the Debian network installer tree (used as `location` by virt-install).
Must match debian_lb_vm_osinfo's release (e.g. a bookworm tree for debian12).

#### Default value

```YAML
debian_lb_vm_install_tree: http://ftp.fr.debian.org/debian/dists/stable/main/installer-amd64/
```

### debian_lb_vm_ip

Static IP address of the VM, in the same VLAN as the OpenShift lab VMs.
Required - injected into the preseed (netcfg) and used for the post-install summary.

#### Default value

```YAML
debian_lb_vm_ip: ''
```

### debian_lb_vm_mac

MAC address of the VM NIC. Required - must be set in host_vars or inventory.

#### Default value

```YAML
debian_lb_vm_mac: ''
```

### debian_lb_vm_memory

RAM allocated to the VM, in MiB.

#### Default value

```YAML
debian_lb_vm_memory: 2048
```

### debian_lb_vm_name

Name of the VM. Defaults to the Ansible inventory hostname.

#### Default value

```YAML
debian_lb_vm_name: '{{ inventory_hostname }}'
```

### debian_lb_vm_netmask

Netmask applied to debian_lb_vm_ip during installation.

#### Default value

```YAML
debian_lb_vm_netmask: 255.255.255.0
```

### debian_lb_vm_ntp_server

NTP server used during installation (clock-setup).

#### Default value

```YAML
debian_lb_vm_ntp_server: 0.debian.pool.ntp.org
```

### debian_lb_vm_osinfo

OS variant identifier passed to virt-install (--os-variant).

#### Default value

```YAML
debian_lb_vm_osinfo: debian12
```

### debian_lb_vm_root_password

Clear-text root password injected into the preseed. Required - set in an
encrypted host_vars/group_vars file (ansible-vault), never committed in clear.

#### Default value

```YAML
debian_lb_vm_root_password: ''
```

### debian_lb_vm_target_host

Ansible inventory hostname of the KVM host. Tasks that must run on the KVM host
are delegated to this host. Override in group_vars with the actual KVM server hostname.

#### Default value

```YAML
debian_lb_vm_target_host: localhost
```

### debian_lb_vm_user_account

Login of the non-root sudo user created during installation.

#### Default value

```YAML
debian_lb_vm_user_account: linux
```

### debian_lb_vm_vcpus

Number of virtual CPUs.

#### Default value

```YAML
debian_lb_vm_vcpus: 2
```

### debian_lb_vm_vg_pool

LVM volume group used to create the VM disk.

#### Default value

```YAML
debian_lb_vm_vg_pool: vg_guest
```

### debian_lb_vm_work_dir

Directory on debian_lb_vm_target_host where the generated preseed file is written
before being injected into the installer initrd.

#### Default value

```YAML
debian_lb_vm_work_dir: /root/debian_lb_vm/{{ debian_lb_vm_name }}
```

## Dependencies

None.

## License

GPL-3.0-only

## Author

Yannick Sébastia
