# oc_command

Install the OpenShift CLI (oc) and openshift-install binaries

## Table of contents

- [Requirements](#requirements)
- [Default Variables](#default-variables)
  - [oc_command_version](#oc_command_version)
- [Dependencies](#dependencies)
- [License](#license)
- [Author](#author)

---

## Requirements

- Minimum Ansible version: `2.14`

## Default Variables

### oc_command_version

OpenShift client version to install (must match the cluster version).

#### Default value

```YAML
oc_command_version: 4.22.15
```

## Dependencies

None.

## License

GPL-3.0-only

## Author

Yannick Sébastia
