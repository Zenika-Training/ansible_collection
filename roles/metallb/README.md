# metallb

Install and configure MetalLB on an OpenShift SNO cluster via OLM

## Table of contents

- [Requirements](#requirements)
- [Default Variables](#default-variables)
  - [metallb_catalog_source](#metallb_catalog_source)
  - [metallb_catalog_source_namespace](#metallb_catalog_source_namespace)
  - [metallb_channel](#metallb_channel)
  - [metallb_csv_wait_delay](#metallb_csv_wait_delay)
  - [metallb_csv_wait_retries](#metallb_csv_wait_retries)
  - [metallb_ip_ranges](#metallb_ip_ranges)
  - [metallb_kubeconfig](#metallb_kubeconfig)
  - [metallb_l2advertisement_name](#metallb_l2advertisement_name)
  - [metallb_namespace](#metallb_namespace)
  - [metallb_pool_name](#metallb_pool_name)
- [Dependencies](#dependencies)
- [License](#license)
- [Author](#author)

---

## Requirements

- Minimum Ansible version: `2.14`

## Default Variables

### metallb_catalog_source

OLM CatalogSource providing the MetalLB operator package.

#### Default value

```YAML
metallb_catalog_source: redhat-operators
```

### metallb_catalog_source_namespace

Namespace of the OLM CatalogSource.

#### Default value

```YAML
metallb_catalog_source_namespace: openshift-marketplace
```

### metallb_channel

OLM subscription channel for the MetalLB operator.

#### Default value

```YAML
metallb_channel: stable
```

### metallb_csv_wait_delay

Delay in seconds between CSV readiness retries.

#### Default value

```YAML
metallb_csv_wait_delay: 20
```

### metallb_csv_wait_retries

Number of retries while waiting for the MetalLB CSV to reach Succeeded phase.
Each retry waits metallb_csv_wait_delay seconds. Total max wait = retries × delay.

#### Default value

```YAML
metallb_csv_wait_retries: 30
```

### metallb_ip_ranges

List of IP ranges assigned to the MetalLB pool.
Each entry is a range in the form "start-end" or a CIDR.
These IPs must be free on the KVM bridge subnet (not in dnsmasq DHCP range,
not assigned to any host). Two distinct ranges are typically needed when two
SNO clusters share the same bridge: one range per cluster, defined in host_vars.

#### Default value

```YAML
metallb_ip_ranges:
  - 192.168.100.100-192.168.100.110
```

### metallb_kubeconfig

Path to the kubeconfig file of the target cluster on the Ansible controller.
Defaults to the standard path produced by the oc_coreos role after SNO installation.
If the file does not exist at that path, the role falls back to ~/.kube/config,
which is populated by a prior `oc login`. Set to an explicit path in host_vars
to override both behaviours.

#### Default value

```YAML
metallb_kubeconfig: /tmp/openshift/{{ inventory_hostname }}/{{ 
  inventory_hostname }}/auth/kubeconfig
```

### metallb_l2advertisement_name

Name of the MetalLB L2Advertisement resource.

#### Default value

```YAML
metallb_l2advertisement_name: training-l2
```

### metallb_namespace

Namespace where the MetalLB operator and its resources are deployed.

#### Default value

```YAML
metallb_namespace: metallb-system
```

### metallb_pool_name

Name of the MetalLB IPAddressPool resource.

#### Default value

```YAML
metallb_pool_name: training-pool
```

## Dependencies

None.

## License

GPL-3.0-only

## Author

Yannick Sébastia
