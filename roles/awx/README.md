# awx

Configuration d'un controleur AWX

## Table of content

- [Requirements](#requirements)
- [Default Variables](#default-variables)
  - [awx_admin](#awx_admin)
  - [awx_chart_version](#awx_chart_version)
  - [awx_config](#awx_config)
  - [awx_controller_port](#awx_controller_port)
  - [awx_enable_dependencies](#awx_enable_dependencies)
  - [awx_enable_private_registry](#awx_enable_private_registry)
  - [awx_helm_repo](#awx_helm_repo)
  - [awx_k9s_repo](#awx_k9s_repo)
  - [awx_kind_repo](#awx_kind_repo)
  - [awx_kube_config](#awx_kube_config)
  - [awx_kubectl_repo](#awx_kubectl_repo)
  - [awx_name](#awx_name)
  - [awx_ns](#awx_ns)
  - [awx_package](#awx_package)
  - [awx_pip](#awx_pip)
  - [awx_private_registry](#awx_private_registry)
  - [awx_registry_local_port](#awx_registry_local_port)
  - [awx_virtualenv_directory](#awx_virtualenv_directory)
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
awx_config: '{{ ansible_user_dir }}/.tower_cli.cfg'
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

### awx_enable_private_registry

#### Default value

```YAML
awx_enable_private_registry: true
```

### awx_helm_repo

#### Default value

```YAML
awx_helm_repo: https://get.helm.sh/helm-v3.19.0-linux-amd64.tar.gz
```

### awx_k9s_repo

#### Default value

```YAML
awx_k9s_repo: 
  https://github.com/derailed/k9s/releases/download/v0.50.9/k9s_Linux_amd64.tar.gz
```

### awx_kind_repo

#### Default value

```YAML
awx_kind_repo: https://kind.sigs.k8s.io/dl/v0.30.0/kind-linux-amd64
```

### awx_kube_config

#### Default value

```YAML
awx_kube_config: '{{ ansible_user_dir }}/.kube/config'
```

### awx_kubectl_repo

#### Default value

```YAML
awx_kubectl_repo: https://dl.k8s.io/release/v1.32.0/bin/linux/amd64/kubectl
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
awx_package: [tar, unzip]
```

### awx_pip

#### Default value

```YAML
awx_pip: [kubernetes==33.1.0]
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

### awx_virtualenv_directory

#### Default value

```YAML
awx_virtualenv_directory: '{{ ansible_user_dir }}/.venv/ansible'
```

### awx_workdir

#### Default value

```YAML
awx_workdir: /tmp/awx
```

## Dependencies

- zenika.training.ansible_virtualenv
- zenika.training.podman

## License

GPL-3.0-only

## Author

Yannick Sébastia
