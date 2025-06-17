# vagrant_ansible_node

Configuration d'un noeud Ansible sous Vagrant

## Table of content

- [Requirements](#requirements)
- [Default Variables](#default-variables)
  - [vagrant_ansible_node_controller](#vagrant_ansible_node_controller)
  - [vagrant_ansible_node_lab_group](#vagrant_ansible_node_lab_group)
  - [vagrant_ansible_node_lab_user](#vagrant_ansible_node_lab_user)
  - [vagrant_ansible_node_ssh_key](#vagrant_ansible_node_ssh_key)
- [Dependencies](#dependencies)
- [License](#license)
- [Author](#author)

---

## Requirements

- Minimum Ansible version: `2.1`

## Default Variables

### vagrant_ansible_node_controller

#### Default value

```YAML
vagrant_ansible_node_controller: localhost
```

### vagrant_ansible_node_lab_group

#### Default value

```YAML
vagrant_ansible_node_lab_group: ubuntu
```

### vagrant_ansible_node_lab_user

#### Default value

```YAML
vagrant_ansible_node_lab_user: ubuntu
```

### vagrant_ansible_node_ssh_key

#### Default value

```YAML
vagrant_ansible_node_ssh_key: ~/.ssh/id_ecdsa
```

## Dependencies

None.

## License

GPL-3.0-only

## Author

Yannick Sébastia
