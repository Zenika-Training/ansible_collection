# grade

Declarative lab grading role for Zenika training courses

## Table of contents

- [Requirements](#requirements)
- [Default Variables](#default-variables)
  - [grade_fail_on_error](#grade_fail_on_error)
  - [grade_items](#grade_items)
  - [grade_lab_name](#grade_lab_name)
- [Dependencies](#dependencies)
- [License](#license)
- [Author](#author)

---

## Requirements

- Minimum Ansible version: `2.1`

## Default Variables

### grade_fail_on_error

When true, the play fails if any check does not pass. Set to false to always display the full report without failing the play.

**_Type:_** boolean<br />

#### Default value

```YAML
grade_fail_on_error: true
```

### grade_items

 List of checks to evaluate. Each item requires a `type` and a `msg`. Additional fields depend on the check type.

Supported types:
- `file`: passes if the path exists and is a regular file
- `directory`: passes if the path exists and is a directory
- `content`: passes if the file exists and contains the expected string (literal match)
- `yaml`: passes if the YAML file exists and the given key equals the expected value (quote-insensitive)
- `absent`: passes if the path does not exist
- `uri`: passes if the HTTP response matches the expected status code and optional string
- `exec`: passes if the shell command exits with the expected return code and optional output string

All paths support `~` (expanded via `expanduser`).
For `uri` items, `url_username`/`url_password` enable Basic auth; `headers` supports Bearer tokens.
For `exec` items, `rc` sets the expected return code (default: 0); `string` checks stdout+stderr contains the value.

**_Type:_** list<br />

#### Default value

```YAML
grade_items: []
```

#### Example usage

```YAML
  grade_items:
    - type: directory
      path: "~/my.collection/roles/apache"
      msg: "Role apache directory created"
    - type: file
      path: "~/my.collection/roles/apache/tasks/main.yml"
      msg: "File tasks/main.yml present in role apache"
    - type: content
      path: "~/my.collection/roles/apache/tasks/main.yml"
      string: "ansible.builtin.package"
      msg: "Module ansible.builtin.package used"
    - type: yaml
      path: "~/my.collection/roles/apache/vars/main.yml"
      key: "apache_owner"
      value: "www-data"
      msg: "Variable apache_owner set in vars/main.yml"
    - type: absent
      path: "~/my.collection/roles/apache/files/legacy.conf"
      msg: "Obsolete file removed"
    - type: exec
      cmd: "ansible-lint ~/work/web.yml"
      msg: "ansible-lint passe sur web.yml"
    - type: exec
      cmd: "ansible-playbook --syntax-check ~/work/site.yml"
      msg: "Syntaxe du playbook valide"
    - type: exec
      cmd: "bash -c 'exit 42'"
      rc: 42
      msg: "Commande terminée avec le code attendu"
```

### grade_lab_name

Human-readable name of the lab being graded. Displayed in the results header and summary.

**_Type:_** string<br />

#### Default value

```YAML
grade_lab_name: Grade
```

#### Example usage

```YAML
"Lab02 - Ansible Roles"
```

## Dependencies

None.

## License

GPL-3.0-only

## Author

zenika
