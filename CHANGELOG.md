## Unreleased

### Feat

- **#13**: add libvirt_kvm install vm role
- **#13**: generate coreos iso file
- **#13**: add installation of oc command

### Fix

- **lint**: ansible-lint
- invalid port for private registry

### Refactor

- **#13**: show kubeadmin password
- **#13**: add openshift install client

## 0.1.3 (2026-01-08)

### Feat

- **#8**: add support of ubuntu24 for vagrant_ansible_controller role
- **#8**: add support of ubuntu24 for kind
- **#7**: add missing dependency for awx
- **#7**: add verify sequence for http_server
- **#7**: add verify sequence for irc
- **#7**: add verify sequence for podman

### Fix

- **lint**: EOF
- **#7**: override kind_cni_configfile in molecule test
- **#7**: set fix api server port
- invalid variable name
- **#7**: add helm and kubconfig path
- **lint**: yamllint
- **#7**: add path for kubeconfig
- **#7**: add venv path for python
- **#7**: add dependency for awx
- add a default value for ansible_vagrant playbook
- **lint**: no-role-prefix
- **molecule**: add collections_path
- **#7**: ensure that Git is installed
- **#4**: suppression des références au venv pip
- **lint**: trailing space
- **lint**: autofix

### Refactor

- remove test for kind
- **#7**: dead code
- **#7**: move kind into dedicated role
- **#7**: move kind download in kind.yml file
- **#7**: move helm into dedicated role
- **#7**: move k9s into dedicated role
- move ca-certificates into molecule image
- **#7**: move kubectl into dedicated role
- **#7**: remove output of http_server in verify sequence
- **#8**: add converge patterns in somes roles
- **#4**: suppression de pip (dans l'attente de la mise à jour OS pour avoir community.general.pipx)
- align vagrant_ansible_controller role with helper scripts organization
- remove APT cache update in roles
- **#4**: remove pip venv context

## 0.1.2 (2025-12-17)

### Feat

- **#4**: set Path for pipx

## 0.1.1 (2025-09-17)

### Feat

- add notifications templates for projects
- **awx_provisioning**: add missing attributes
- **awx_provision**: add role on job_templates
- add role to provision awx controller
- **irc**: add irc server for awx notifications training
- add a playbook to configure ansible on lab controller
- **vagrant**: use http_server in ansible_vagrant playbook
- add http_server role
- populate a fake dynamic inventory
- **awx**: add URL of private registry
- **awx**: add private registry
- **podman**: add skopeo package
- add ansible_vagrant playbook
- add awx role installation with kind/podman
- add ansible_virtualenv role
- add ansible_global_configuration role
- add git_server role
- add podman role
- add molecule for zenika.training.vagrant_ansible_controller
- add vagrant_ansible_node role
- add vagrant_ansible_controller role

### Fix

- **awx**: increase retries for waiting AWX
- **lint**: var-naming[no-role-prefix]
- **awx**: use valid organization ID
- **awx_provision**: set default scm_branch to main
- **awx_provision**: set valid role for assignment
- **awx_provision**: invalid vars on team_assignement
- **awx_provision**: invalid test on team_assignment
- **unarchive**: idempotent
- **lint**: comments
- **virtualenv**: use valid user
- **http_server**:  use valid call for systemd
- pin version of collection
- **lint**: new-line-at-end-of-file
- **ci**: ignore .* directory with ansible-lint
- **lint**: new-line-at-end-of-file
- add missing dependencies
- **podman**: force handler
-  use ansible_user_dir with ansible_virtualenv role
- use ansible_user_dir
- use ansible_user_id instead ansible_user
- **molecule**: add network for podman
- add missing tasks for vagrant_ansible_node
- add missing tasks for vagrant_ansible_controller
- **lint**: new-line-at-end-of-file
- add vagrant_ansible_controller_ssh_key
- **lint**: wrong path
- **lint**: use ansible-lint --fix

### Refactor

- **vagrant**: align playbooks's hosts attribute
- **podman**: move install of tree package in ansible_global_configuration role
- use ubuntu molecule image instead debian
