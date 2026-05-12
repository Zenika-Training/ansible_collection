# oc_command

Install the OpenShift CLI (oc) and openshift-install binaries

## Table of contents

- [Requirements](#requirements)
- [Default Variables](#default-variables)
  - [oc_command_client](#oc_command_client)
  - [oc_command_install](#oc_command_install)
  - [oc_command_version](#oc_command_version)
- [Dependencies](#dependencies)
- [License](#license)
- [Author](#author)

---

## Requirements

- Minimum Ansible version: `2.14`

## Default Variables

### oc_command_client

Download URL for the OpenShift client (oc) tarball.

#### Default value

```YAML
oc_command_client: https://mirror.openshift.com/pub/openshift-v4/clients/ocp/{{ 
  oc_command_version }}/openshift-client-linux.tar.gz
```

### oc_command_install

Download URL for the openshift-install binary tarball.

#### Default value

```YAML
oc_command_install: https://mirror.openshift.com/pub/openshift-v4/clients/ocp/{{
  oc_command_version }}/openshift-install-linux.tar.gz
```

### oc_command_version

OpenShift client version to install (must match the cluster version).

#### Default value

```YAML
oc_command_version: 4.21.13
```

## Dependencies

None.

## License

GPL-3.0-only

## Author

Yannick Sébastia
