# awx

Configuration d'un controleur AWX

## Table of contents

- [Requirements](#requirements)
- [Default Variables](#default-variables)
  - [awx_enable_dependencies](#awx_enable_dependencies)
  - [awx_registry_local_port](#awx_registry_local_port)
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

## Dependencies

- zenika.training.kubectl
- zenika.training.k9s
- zenika.training.helm
- zenika.training.kind

## License

GPL-3.0-only

## Author

Yannick Sébastia
