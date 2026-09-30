# kind

Installation kind

## Table of contents

- [Requirements](#requirements)
- [Default Variables](#default-variables)
  - [kind_api_server_port](#kind_api_server_port)
  - [kind_enable_dependencies](#kind_enable_dependencies)
  - [kind_enable_private_registry](#kind_enable_private_registry)
  - [kind_exposed_port](#kind_exposed_port)
  - [kind_registry_local_port](#kind_registry_local_port)
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

### kind_registry_local_port

#### Default value

```YAML
kind_registry_local_port: 5000
```

## Dependencies

- zenika.training.podman

## License

GPL-3.0-only

## Author

Yannick Sébastia
