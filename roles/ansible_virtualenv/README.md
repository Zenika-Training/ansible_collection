# ansible_virtualenv

Configuration en VirtualEnv de Ansible

## Table of contents

- [Requirements](#requirements)
- [Default Variables](#default-variables)
  - [ansible_virtualenv_packages](#ansible_virtualenv_packages)
  - [ansible_virtualenv_pip](#ansible_virtualenv_pip)
- [Dependencies](#dependencies)
- [License](#license)
- [Author](#author)

---

## Requirements

- Minimum Ansible version: `2.1`

## Default Variables

### ansible_virtualenv_packages

#### Default value

```YAML
ansible_virtualenv_packages:
  - pipx
```

### ansible_virtualenv_pip

#### Default value

```YAML
ansible_virtualenv_pip:
  - ansible-core==2.17.14
  - ansible-lint==25.12.1
  - yamllint==1.37.1
```

## Dependencies

None.

## License

GPL-3.0-only

## Author

Yannick Sébastia
