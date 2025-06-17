# git_server

Configuration d'un serveur Git

## Table of content

- [Requirements](#requirements)
- [Default Variables](#default-variables)
  - [git_server_branch](#git_server_branch)
  - [git_server_group](#git_server_group)
  - [git_server_path](#git_server_path)
  - [git_server_repos](#git_server_repos)
  - [git_server_ssh_key](#git_server_ssh_key)
  - [git_server_user](#git_server_user)
- [Dependencies](#dependencies)
- [License](#license)
- [Author](#author)

---

## Requirements

- Minimum Ansible version: `2.1`

## Default Variables

### git_server_branch

#### Default value

```YAML
git_server_branch: main
```

### git_server_group

#### Default value

```YAML
git_server_group: git
```

### git_server_path

#### Default value

```YAML
git_server_path: /home/{{ git_server_user }}
```

### git_server_repos

#### Default value

```YAML
git_server_repos: []
```

### git_server_ssh_key

#### Default value

```YAML
git_server_ssh_key: ~/.ssh/id_ecdsa
```

### git_server_user

#### Default value

```YAML
git_server_user: git
```

## Dependencies

None.

## License

GPL-3.0-only

## Author

Yannick Sébastia
