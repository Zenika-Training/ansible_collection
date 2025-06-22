# ansible_global_configuration

Configuration globale Ansible

## Table of content

- [Requirements](#requirements)
- [Default Variables](#default-variables)
  - [ansible_global_configuration_nodes](#ansible_global_configuration_nodes)
  - [ansible_global_configuration_public](#ansible_global_configuration_public)
  - [ansible_global_configuration_user](#ansible_global_configuration_user)
- [Dependencies](#dependencies)
- [License](#license)
- [Author](#author)

---

## Requirements

- Minimum Ansible version: `2.1`

## Default Variables

### ansible_global_configuration_nodes

#### Default value

```YAML
ansible_global_configuration_nodes: []
```

### ansible_global_configuration_public

#### Default value

```YAML
ansible_global_configuration_public: '{{ ansible_user_dir }}/public'
```

### ansible_global_configuration_user

#### Default value

```YAML
ansible_global_configuration_user: '{{ ansible_user_id }}'
```

## Dependencies

None.

## License

GPL-3.0-only

## Author

Yannick Sébastia
