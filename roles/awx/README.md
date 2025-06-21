# awx

Configuration d'un controleur AWX

## Table of content

- [Requirements](#requirements)
- [Default Variables](#default-variables)
  - [awx_enable_dependencies](#awx_enable_dependencies)
  - [awx_registry_local_port](#awx_registry_local_port)
  - [awx_virtualenv_directory](#awx_virtualenv_directory)
- [Dependencies](#dependencies)
- [License](#license)
- [Author](#author)

---

## Requirements

- Minimum Ansible version: `2.1`

## Default Variables

### awx_enable_dependencies

#### Default value

```YAML
awx_enable_dependencies: true
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

## Dependencies

- zenika.training.ansible_virtualenv
- zenika.training.podman

## License

GPL-3.0-only

## Author

Yannick Sébastia
