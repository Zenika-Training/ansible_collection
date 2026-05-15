# oc_coreos

Prepare an RHCOS live ISO for SNO (Single Node OpenShift) with embedded ignition config

## Table of contents

- [Requirements](#requirements)
- [Default Variables](#default-variables)
  - [oc_coreos_arch](#oc_coreos_arch)
  - [oc_coreos_cilium_bpf_masquerade](#oc_coreos_cilium_bpf_masquerade)
  - [oc_coreos_cilium_cni_exclusive](#oc_coreos_cilium_cni_exclusive)
  - [oc_coreos_cilium_manifests_url](#oc_coreos_cilium_manifests_url)
  - [oc_coreos_cilium_socket_lb_host_namespace_only](#oc_coreos_cilium_socket_lb_host_namespace_only)
  - [oc_coreos_cluster_network_cidr](#oc_coreos_cluster_network_cidr)
  - [oc_coreos_cluster_network_prefix](#oc_coreos_cluster_network_prefix)
  - [oc_coreos_controller_host](#oc_coreos_controller_host)
  - [oc_coreos_install_disk](#oc_coreos_install_disk)
  - [oc_coreos_install_retries](#oc_coreos_install_retries)
  - [oc_coreos_ocp_domain](#oc_coreos_ocp_domain)
  - [oc_coreos_ocp_ip](#oc_coreos_ocp_ip)
  - [oc_coreos_ocp_name](#oc_coreos_ocp_name)
  - [oc_coreos_ocp_network](#oc_coreos_ocp_network)
  - [oc_coreos_ocp_subnet](#oc_coreos_ocp_subnet)
  - [oc_coreos_pull_secret_file](#oc_coreos_pull_secret_file)
  - [oc_coreos_service_network](#oc_coreos_service_network)
  - [oc_coreos_ssh_key_file](#oc_coreos_ssh_key_file)
  - [oc_coreos_work_dir](#oc_coreos_work_dir)
- [Dependencies](#dependencies)
- [License](#license)
- [Author](#author)

---

## Requirements

- Minimum Ansible version: `2.14`

## Default Variables

### oc_coreos_arch

Target architecture for the RHCOS ISO. Only x86_64 is supported.

#### Default value

```YAML
oc_coreos_arch: x86_64
```

### oc_coreos_cilium_bpf_masquerade

Enable eBPF-based masquerading (NAT) in Cilium instead of iptables.
Required by Istio Ambient mode (default here).
https://istio.io/latest/docs/ambient/install/platform-prerequisites/#cilium

#### Default value

```YAML
oc_coreos_cilium_bpf_masquerade: true
```

### oc_coreos_cilium_cni_exclusive

Run Cilium as the exclusive CNI plugin.
Set to false (default here) to allow IstioCNI chaining — IstioCNI must insert
its iptables rules after Cilium sets up the network (Istio Ambient prerequisite).
https://istio.io/latest/docs/ambient/install/platform-prerequisites/#cilium

#### Default value

```YAML
oc_coreos_cilium_cni_exclusive: false
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

### oc_coreos_cilium_socket_lb_host_namespace_only

Restrict Cilium socket-level load balancing to the host network namespace only.
When true, the eBPF cgroup/connect4 hook is limited to the host namespace and does
NOT translate ClusterIP → PodIP inside pod cgroups. The ZTunnel then encodes the
original ClusterIP in HBONE, allowing the Waypoint to select the correct route.
Upstream reference: https://docs.cilium.io/en/stable/network/servicemesh/istio/
Note: `cilium config get bpf-lb-sock-hostns-only` returns "Configuration does not
exist" on CLiFE — the parameter is silently effective only when declared in the
CiliumConfig before installation; runtime patches are ignored.
Side effect: confining the hook to the host namespace also neutralises session
affinity inside pods — sessionAffinity: true (CLiFE default) has no observable
effect on Istio Ambient traffic distribution when this parameter is true.

#### Default value

```YAML
oc_coreos_cilium_socket_lb_host_namespace_only: true
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

### oc_coreos_controller_host

Host where openshift-install runs (must hold the work directory and the binary).
Defaults to localhost (the Ansible controller / workstation).
Set to the KVM host name when the controller and the KVM server are the same machine,
or when the ISO was generated directly on the KVM host.
In the sno_libvirt_kvm playbook this is automatically aligned with libvirt_kvm_target_host
unless overridden in the inventory.

#### Default value

```YAML
oc_coreos_controller_host: localhost
```

### oc_coreos_install_disk

Target disk in the VM for the CoreOS installation.
/dev/vda is the standard VirtIO disk on KVM.

#### Default value

```YAML
oc_coreos_install_disk: /dev/vda
```

### oc_coreos_install_retries

Number of times wait-for install-complete is retried before failing.
Each attempt waits up to 40 minutes (the command's internal timeout).
Total maximum wait = retries × 40 min. Default: 4 attempts = 160 minutes.

#### Default value

```YAML
oc_coreos_install_retries: 4
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

### oc_coreos_pull_secret_file

Path to the Red Hat pull secret JSON file on the Ansible controller.
Download the file from: https://console.redhat.com/openshift/create/local
Set in group_vars/all.yml. The file content is loaded at runtime into an
internal variable and never stored in the inventory.

#### Default value

```YAML
oc_coreos_pull_secret_file: ~/pull-secret.json
```

### oc_coreos_service_network

CIDR of the Kubernetes service network (ClusterIP).

#### Default value

```YAML
oc_coreos_service_network: 172.30.0.0/16
```

### oc_coreos_ssh_key_file

Path to the public SSH key file on the Ansible controller.
The key is injected into CoreOS via ignition to allow SSH access after first boot.

#### Default value

```YAML
oc_coreos_ssh_key_file: ~/.ssh/id_rsa.pub
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
