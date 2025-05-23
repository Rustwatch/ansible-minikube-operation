#!/bin/bash
######################################################
#                                                    #
#   Initial Script for terraform and ansible setup   #
#                                                    #
######################################################

key_directory="./keys"
[ -d "${key_directory}" ] || (echo "Creating ${key_directory}" && mkdir ${key_directory})
([ -f "${key_directory}/id_rsa" ] && [ -f "${key_directory}/id_rsa.pub" ]) || ( echo "Creating SSH Keys for further deployment" && ssh-keygen -t rsa -b 4096 -N "${ssh_key}" -f ${key_directory}/id_rsa )
[ -f "${key_directory}/ansible_vault.pass" ] || (echo "Creating ${key_directory}/ansible_vault.pass" && LC_ALL=C tr -dc '[:alnum:]' < /dev/urandom | head -c${1:-256} > ${key_directory}/ansible_vault.pass)


#********Sadly i dont know if ansible supports keyphrases for the passfiles. I will keep those for the time beeing as comment
##ansible_groupvars="./group_vars/all"
##vault_varsfile="vault.yml"
##ssh_key="$(LC_ALL=C tr -dc '[:alnum:]' < /dev/urandom | head -c${1:-256})"
##([ -f "${key_directory}/id_rsa" ] && [ -f "${key_directory}/id_rsa.pub" ]) || ( echo "Creating SSH Keys for further deployment" && ssh-keygen -t rsa -b 4096 -N "${ssh_key}" -f ${key_directory}/id_rsa )
##[ -f "${ansible_groupvars}/vault.yml" ] || (echo "Creating ./group_vars/all/vault.yml" && echo "vault_ssh_keyfile_password: \"${ssh_key}\"" > ${ansible_groupvars}/vault.yml)
##ansible-vault encrypt --encrypt-vault-id=default --vault-password-file=${key_directory}/ansible_vault.pass ${ansible_groupvars}/vault.yml
#********

echo "Install ansible and snappy (-> snappy for terraform installtion) https://snapcraft.io/install/terraform/opensuse"
sudo transaction-update pkg install snapd ansible
