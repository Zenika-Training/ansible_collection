# kind

Installation kind

## Table of contents

- [Requirements](#requirements)
- [Default Variables](#default-variables)
  - [kind_api_server_port](#kind_api_server_port)
  - [kind_cni_configfile](#kind_cni_configfile)
  - [kind_enable_dependencies](#kind_enable_dependencies)
  - [kind_enable_private_registry](#kind_enable_private_registry)
  - [kind_exposed_port](#kind_exposed_port)
  - [kind_kube_config](#kind_kube_config)
  - [kind_registry_local_port](#kind_registry_local_port)
  - [kind_repo](#kind_repo)
  - [kind_workdir](#kind_workdir)
- [Dependencies](#dependencies)
- [License](#license)
- [Author](#author)

---

## Requirements

- Minimum Ansible version: `2.1`

## Default Variables

### kind_api_server_port

#### Default value

```YAML
kind_api_server_port: 6443
```

### kind_cni_configfile

#### Default value

```YAML
kind_cni_configfile: '{{ ansible_facts.user_dir }}/.config/cni/net.d/kind.conflist'
```

### kind_enable_dependencies

#### Default value

```YAML
kind_enable_dependencies: true
```

### kind_enable_private_registry

#### Default value

```YAML
kind_enable_private_registry: true
```

### kind_exposed_port

#### Default value

```YAML
kind_exposed_port: 8080
```

### kind_kube_config

#### Default value

```YAML
kind_kube_config: '{{ ansible_facts.user_dir }}/.kube/config'
```

### kind_registry_local_port

#### Default value

```YAML
kind_registry_local_port: 5000
```

### kind_repo

#### Default value

```YAML
kind_repo: https://kind.sigs.k8s.io/dl/v0.31.0/kind-linux-amd64
```

### kind_workdir

#### Default value

```YAML
kind_workdir: /tmp/kind
```

## Dependencies

- zenika.training.podman

## License

GPL-3.0-only

## Author

Yannick Sébastia
