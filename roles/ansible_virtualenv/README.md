# ansible_virtualenv

Configuration en VirtualEnv de Ansible

## Table of content

- [Requirements](#requirements)
- [Default Variables](#default-variables)
  - [ansible_virtualenv_directory](#ansible_virtualenv_directory)
- [Dependencies](#dependencies)
- [License](#license)
- [Author](#author)

---

## Requirements

- Minimum Ansible version: `2.1`

## Default Variables

### ansible_virtualenv_directory

#### Default value

```YAML
ansible_virtualenv_directory: '{{ ansible_user_dir }}/.venv/ansible/'
```

## Dependencies

None.

## License

GPL-3.0-only

## Author

Yannick Sébastia
