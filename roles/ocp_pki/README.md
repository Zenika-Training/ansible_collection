# ocp_pki

PKI bootstrap for OpenShift training clusters — generates a shared root CA and per-cluster intermediate CAs, then deploys the cert-manager ClusterIssuer backing secret.


## Table of contents

- [Requirements](#requirements)
- [Default Variables](#default-variables)
  - [ocp_pki_controller_host](#ocp_pki_controller_host)
  - [ocp_pki_intermediate_cn](#ocp_pki_intermediate_cn)
  - [ocp_pki_intermediate_days](#ocp_pki_intermediate_days)
  - [ocp_pki_intermediate_dir](#ocp_pki_intermediate_dir)
  - [ocp_pki_kubeconfig](#ocp_pki_kubeconfig)
  - [ocp_pki_root_ca_cn](#ocp_pki_root_ca_cn)
  - [ocp_pki_root_ca_days](#ocp_pki_root_ca_days)
  - [ocp_pki_root_ca_dir](#ocp_pki_root_ca_dir)
  - [ocp_pki_validate_certs](#ocp_pki_validate_certs)
- [Dependencies](#dependencies)
- [License](#license)
- [Author](#author)

---

## Requirements

- Minimum Ansible version: `2.14`

## Default Variables

### ocp_pki_controller_host

Host where PKI files are generated and stored (must hold the work directories).
Defaults to localhost (the Ansible controller / workstation).
Set to another host (e.g. the KVM hypervisor) when PKI generation runs there.

#### Default value

```YAML
ocp_pki_controller_host: localhost
```

### ocp_pki_intermediate_cn

Common Name of the per-cluster intermediate CA certificate.

#### Default value

```YAML
ocp_pki_intermediate_cn: '{{ inventory_hostname }} Intermediate CA'
```

### ocp_pki_intermediate_days

Validity period of the intermediate CA certificate in days.

#### Default value

```YAML
ocp_pki_intermediate_days: 1825
```

### ocp_pki_intermediate_dir

Directory on the Ansible controller where per-cluster intermediate CA files are stored.
One sub-directory is created per cluster, named after inventory_hostname.

#### Default value

```YAML
ocp_pki_intermediate_dir: '{{ ocp_pki_root_ca_dir }}/{{ inventory_hostname }}'
```

### ocp_pki_kubeconfig

Path to the kubeconfig file of the target cluster on the Ansible controller.
Defaults to the standard path produced by the oc_coreos role after SNO installation.
If the file does not exist at that path, the role falls back to ~/.kube/config.

#### Default value

```YAML
ocp_pki_kubeconfig: /tmp/openshift/{{ inventory_hostname }}/{{ 
  inventory_hostname }}/auth/kubeconfig
```

### ocp_pki_root_ca_cn

Common Name of the shared root CA certificate.

#### Default value

```YAML
ocp_pki_root_ca_cn: Zenika Training Root CA
```

### ocp_pki_root_ca_days

Validity period of the root CA certificate in days.

#### Default value

```YAML
ocp_pki_root_ca_days: 3650
```

### ocp_pki_root_ca_dir

Directory on the Ansible controller where the shared root CA is stored.
Defaults to a pki/ directory next to the inventory directory.
The root CA is generated once and reused across all clusters.

#### Default value

```YAML
ocp_pki_root_ca_dir: '{{ inventory_dir }}/../pki'
```

### ocp_pki_validate_certs

Whether to validate TLS certificates when connecting to the cluster API.
Set to false for training clusters that use self-signed certificates.

#### Default value

```YAML
ocp_pki_validate_certs: false
```

## Dependencies

None.

## License

GPL-3.0-only

## Author

Yannick Sébastia
