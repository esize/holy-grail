set positional-arguments

local:
  ansible-playbook --connection=local --inventory 127.0.0.1, ansible/plays/local.yml

play *ARGS:
  cd ansible && ansible-playbook {{ARGS}} -b run.yml

install:
  ansible-galaxy role install -r ansible/requirements.yml

encrypt:
  cd ansible && ansible-vault encrypt vars/vault.yml

decrypt:
  cd ansible && ansible-vault decrypt vars/vault.yml
