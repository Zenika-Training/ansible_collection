# awx

Configuration d'un controleur AWX

## Table of contents

- [Requirements](#requirements)
- [Default Variables](#default-variables)
  - [awx_admin](#awx_admin)
  - [awx_chart_version](#awx_chart_version)
  - [awx_config](#awx_config)
  - [awx_controller_port](#awx_controller_port)
  - [awx_enable_dependencies](#awx_enable_dependencies)
  - [awx_helm](#awx_helm)
  - [awx_kube_config](#awx_kube_config)
  - [awx_name](#awx_name)
  - [awx_ns](#awx_ns)
  - [awx_package](#awx_package)
  - [awx_private_registry](#awx_private_registry)
  - [awx_registry_local_port](#awx_registry_local_port)
  - [awx_venv_path](#awx_venv_path)
  - [awx_workdir](#awx_workdir)
- [Dependencies](#dependencies)
- [License](#license)
- [Author](#author)

---

## Requirements

- Minimum Ansible version: `2.1`

## Default Variables

### awx_admin

#### Default value

```YAML
awx_admin: admin
```

### awx_chart_version

#### Default value

```YAML
awx_chart_version: 3.2.0
```

### awx_config

#### Default value

```YAML
awx_config: '{{ ansible_facts.user_dir }}/.tower_cli.cfg'
```

### awx_controller_port

#### Default value

```YAML
awx_controller_port: 32000
```

### awx_enable_dependencies

#### Default value

```YAML
awx_enable_dependencies: true
```

### awx_helm

#### Default value

```YAML
awx_helm: /usr/local/bin/helm
```

### awx_kube_config

#### Default value

```YAML
awx_kube_config: '{{ ansible_facts.user_dir }}/.kube/config'
```

### awx_name

#### Default value

```YAML
awx_name: awx
```

### awx_ns

#### Default value

```YAML
awx_ns: awx
```

### awx_package

#### Default value

```YAML
awx_package: [git, python3-yaml, tar, unzip]
```

### awx_private_registry

#### Default value

```YAML
awx_private_registry: local-registry
```

### awx_registry_local_port

#### Default value

```YAML
awx_registry_local_port: 5000
```

### awx_venv_path

#### Default value

```YAML
awx_venv_path: '{{ ansible_facts.user_dir }}/.local/pipx/venvs'
```

### awx_workdir

#### Default value

```YAML
awx_workdir: /tmp/awx
```

## Dependencies

- zenika.training.kubectl
- zenika.training.k9s
- zenika.training.helm
- zenika.training.kind

## License

GPL-3.0-only

## Author

Yannick Sébastia
