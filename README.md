# ansible-minikube-operation

## Intro
I want to acomplish to create a whole "operations" environment via minikube and ansible in opensuse.
The only "work" a user that executes that repository has is to read and configurate the wanted variables and vaults.

## The ansible playbooks
### 1st securing the os
A secure operating system is the key for a secure environment. A general recommendation of "whats best" is in mho not to 100% possible. 
But i will try to also consider this in creating this playbook

### 2nd installing minikube
Here comes the keyplayer for my poc. with minikube i have a small environment to test and play my scenario up and down.
the general recommendation is to use a kubernetes cluster but since this poc happens on a notebook with 4 CPU cores and 16GB ram i am fairly limited ;)

### 3rd installing coreDNS
A dns i out of question. So here i will present coreDNS to you. A nice DNS which will provide every virtual hostname for the containers.

### 4rd installing cert-manager
A certificate managment will be a key player since i want to have a fully secure environment and avoid to use unencrypted channels

### 5th installing identity management
To have a solid entry point i will use kanidm to have a low cost idm

### More to come in the future
sine this roadmap will consume some time i will just keep it like this. Rest Assured, there will be more to come in the future!
