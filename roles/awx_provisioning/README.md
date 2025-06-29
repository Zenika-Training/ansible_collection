# awx_provisioning

Provisionnement d'un controleur AWX

## Table of content

- [Requirements](#requirements)
- [Default Variables](#default-variables)
  - [awx_provisioning_config](#awx_provisioning_config)
  - [awx_provisioning_iac](#awx_provisioning_iac)
  - [awx_provisioning_settings](#awx_provisioning_settings)
- [Dependencies](#dependencies)
- [License](#license)
- [Author](#author)

---

## Requirements

- Minimum Ansible version: `2.1`

## Default Variables

### awx_provisioning_config

#### Default value

```YAML
awx_provisioning_config: '{{ ansible_user_dir }}/.tower_cli.cfg'
```

### awx_provisioning_iac

#### Default value

```YAML
awx_provisioning_iac: []
```

### awx_provisioning_settings

#### Default value

```YAML
awx_provisioning_settings: []
```

## Dependencies

None.

## License

GPL-3.0-only

## Author

Yannick Sébastia
