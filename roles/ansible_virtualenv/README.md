# ansible_virtualenv

Configuration en VirtualEnv de Ansible

## Table of content

- [Requirements](#requirements)
- [Default Variables](#default-variables)
  - [ansible_virtualenv_directory](#ansible_virtualenv_directory)
  - [ansible_virtualenv_packages](#ansible_virtualenv_packages)
  - [ansible_virtualenv_pip](#ansible_virtualenv_pip)
  - [ansible_virtualenv_python_bin](#ansible_virtualenv_python_bin)
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

### ansible_virtualenv_packages

#### Default value

```YAML
ansible_virtualenv_packages:
  - python3-pip
  - python3-venv
  - virtualenv
```

### ansible_virtualenv_pip

#### Default value

```YAML
ansible_virtualenv_pip:
  - ansible-core==2.17.14
  - ansible-lint==25.8.2
  - yamllint==1.37.1
```

### ansible_virtualenv_python_bin

#### Default value

```YAML
ansible_virtualenv_python_bin: python3
```

## Dependencies

None.

## License

GPL-3.0-only

## Author

Yannick Sébastia
