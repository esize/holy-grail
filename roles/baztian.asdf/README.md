Role Name
=========

![CI](https://github.com/baztian/ansible-asdf/workflows/CI/badge.svg)

Role to download, install and setup [asdf](https://github.com/asdf-vm/asdf).

Set `asdf_shared_user_approach` to `no` if you do not want to install plugins
and versions to `/opt/asdf...` but to the user's home folder.

Installaiton of plugins and apps and how they are configures is inspired by
[cimon-io.asdf](https://galaxy.ansible.com/cimon-io/asdf) Ansible role.

Example Playbook
----------------

    - hosts: servers
      become: yes
      roles:
         - role: baztian.asdf
           vars:
            asdf_plugins:
              - name: terraform
                versions:
                  - 0.12.26
                  - 0.14.2
                global: 0.14.2
              - name: yarn
                versions:
                  - 1.22.10

License
-------

MIT
