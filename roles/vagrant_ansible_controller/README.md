# vagrant_ansible_controller

Configuration d'un controleur Ansible sous Vagrant

## Table of contents

- [Requirements](#requirements)
- [Default Variables](#default-variables)
  - [vagrant_ansible_controller_nodes](#vagrant_ansible_controller_nodes)
  - [vagrant_ansible_controller_ssh_key](#vagrant_ansible_controller_ssh_key)
  - [vagrant_ansible_controller_user](#vagrant_ansible_controller_user)
  - [vagrant_ansible_controller_venv_path](#vagrant_ansible_controller_venv_path)
- [Dependencies](#dependencies)
- [License](#license)
- [Author](#author)

---

## Requirements

- Minimum Ansible version: `2.1`

## Default Variables

### vagrant_ansible_controller_nodes

#### Default value

```YAML
vagrant_ansible_controller_nodes: []
```

### vagrant_ansible_controller_ssh_key

#### Default value

```YAML
vagrant_ansible_controller_ssh_key: ~/.ssh/id_ecdsa
```

### vagrant_ansible_controller_user

#### Default value

```YAML
vagrant_ansible_controller_user: vagrant
```

### vagrant_ansible_controller_venv_path

#### Default value

```YAML
vagrant_ansible_controller_venv_path: '{{ ansible_facts.user_dir }}/.local/pipx/venvs'
```

## Dependencies

None.

## License

GPL-3.0-only

## Author

Yannick Sébastia
