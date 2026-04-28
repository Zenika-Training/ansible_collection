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

Target architecture for the RHCOS ISO. Only x86_64 is supported.

#### Default value

```YAML
oc_coreos_arch: x86_64
```

### oc_coreos_cilium_manifests_url

URL of the CLIFE archive (Cilium for OpenShift). Used only when
oc_coreos_ocp_network == 'Cilium'.
Update this URL to change the deployed Cilium version.

#### Default value

```YAML
oc_coreos_cilium_manifests_url: 
  https://docs.isovalent.com/v25.11/public/clife/clife-v1.18.8.tar.gz
```

### oc_coreos_cluster_network_cidr

CIDR of the internal pod network.

#### Default value

```YAML
oc_coreos_cluster_network_cidr: 10.128.0.0/14
```

### oc_coreos_cluster_network_prefix

Per-node subnet size allocated within oc_coreos_cluster_network_cidr.

#### Default value

```YAML
oc_coreos_cluster_network_prefix: 23
```

### oc_coreos_install_disk

Target disk in the VM for the CoreOS installation.
/dev/vda is the standard VirtIO disk on KVM.

#### Default value

```YAML
oc_coreos_install_disk: /dev/vda
```

### oc_coreos_ocp_domain

DNS domain of the cluster (e.g. lab.example.com).
Used to build the required FQDNs: api.<name>.<domain>, *.apps.<name>.<domain>.

#### Default value

```YAML
oc_coreos_ocp_domain: example.com
```

### oc_coreos_ocp_ip

Fixed IP address of the SNO node on the KVM bridge. Required.
IMPORTANT: this variable is NOT ansible_host. Ansible never connects via SSH
to this address — the VM does not exist yet at execution time.
It is only injected into the ignition config (NetworkManager) so that CoreOS
boots with a static IP, and is used to validate DNS entries in the pre-check.
Must be set in host_vars/<cluster_name>.yml.

#### Default value

```YAML
oc_coreos_ocp_ip: ''
```

### oc_coreos_ocp_name

Name of the SNO cluster. Defaults to the Ansible inventory hostname.
Used to name the working directory, manifests and DNS entries.
NOT used to establish an SSH connection: playbooks run locally
(ansible_connection: local set in group_vars/sno.yml of the consumer inventory).

#### Default value

```YAML
oc_coreos_ocp_name: '{{ inventory_hostname }}'
```

### oc_coreos_ocp_network

OpenShift network plugin. Accepted values: OVNKubernetes or Cilium.
Normally set via inventory group membership:
group [ovn] -> OVNKubernetes, group [cilium] -> Cilium (via group_vars/).
For Cilium, CLIFE manifests are downloaded and patched automatically
before the ignition is generated.

#### Default value

```YAML
oc_coreos_ocp_network: OVNKubernetes
```

### oc_coreos_ocp_subnet

KVM bridge subnet in CIDR notation.
Used to compute the node default gateway in the ignition configuration.

#### Default value

```YAML
oc_coreos_ocp_subnet: 192.168.0.0/24
```

### oc_coreos_pull_secret

Red Hat pull secret in JSON format. Required.
Download from: https://console.redhat.com/openshift/create/local
Set in group_vars/all.yml or an Ansible vault.

#### Default value

```YAML
oc_coreos_pull_secret: ''
```

### oc_coreos_service_network

CIDR of the Kubernetes service network (ClusterIP).

#### Default value

```YAML
oc_coreos_service_network: 172.30.0.0/16
```

### oc_coreos_ssh_key

Public SSH key of the workstation, injected into CoreOS via ignition. Required.
Enables SSH access to the node after the first boot.
Retrieve with: cat ~/.ssh/id_*.pub

#### Default value

```YAML
oc_coreos_ssh_key: ''
```

### oc_coreos_work_dir

Local working directory on the Ansible controller (workstation).
Contains the downloaded ISO, generated manifests and the final ignition file.

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
