# oc_command

Install the OpenShift CLI (oc), openshift-install and istioctl binaries

## Table of contents

- [Requirements](#requirements)
- [Default Variables](#default-variables)
  - [oc_command_istioctl_enabled](#oc_command_istioctl_enabled)
  - [oc_command_istioctl_version](#oc_command_istioctl_version)
  - [oc_command_version](#oc_command_version)
- [Dependencies](#dependencies)
- [License](#license)
- [Author](#author)

---

## Requirements

- Minimum Ansible version: `2.14`

## Default Variables

### oc_command_istioctl_enabled

Also install istioctl, the Red Hat build distributed with OpenShift Service Mesh 3.

#### Default value

```YAML
oc_command_istioctl_enabled: true
```

### oc_command_istioctl_version

istioctl version to install. Must match the Istio version run by the mesh (`oc get istio -o jsonpath='{.items[*].spec.version}'`),
not the OpenShift version: 1.31.1 is the Istio version of OpenShift Service Mesh 3.5.0.

#### Default value

```YAML
oc_command_istioctl_version: 1.31.1
```

### oc_command_version

OpenShift client version to install (must match the cluster version).

#### Default value

```YAML
oc_command_version: 4.22.22
```

## Dependencies

None.

## License

GPL-3.0-only

## Author

Yannick Sébastia
