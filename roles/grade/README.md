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
- `content`: passes if the file exists and contains the expected string
- `absent`: passes if the path does not exist

All paths support `~` (expanded via `expanduser`).

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
    - type: absent
      path: "~/my.collection/roles/apache/files/legacy.conf"
      msg: "Obsolete file removed"
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
"Lab02 — Ansible Roles"
```

## Dependencies

None.

## License

GPL-3.0-only

## Author

zenika
