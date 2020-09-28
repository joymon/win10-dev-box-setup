# Ansible for Win10 dev box setup

It is not feasible to use Ansible to setup Win 10 dev box. Technically it would be possible by pre-installing some other prerequisites. But comparing to the native Choco+PowerShell support, it is not worth investing much time in Ansible to script out the Win 10 dev box setup

Below are some hurdles in using Ansible for Win 10 dev box setup

- Is Ansible native to Windows?
  - No. But it has support for managing Windows machines using PowerShell.
  - [Setting up Windows host machine to be used by Linux control machine](https://docs.ansible.com/ansible/latest/user_guide/windows_setup.html)
- Can Ansible run on Windows?
  - [No (as of v2.10). Only it can manage. The control has to be from Linux. Though it can run from WSL, it is not officially supported](https://docs.ansible.com/ansible/latest/user_guide/windows_faq.html#can-ansible-run-on-windows)
  - Setting up WSL itself a task needs to be automated. So cannot have WSL as prerequisite
  - Another [option is Cygwin](https://geekflare.com/ansible-installation-windows/). But that has to be setup manually (may be can automate via PowerShell) before running Ansible scripts.
- Does Ansible has any plans to run from Windows machine?
  - [No](https://docs.ansible.com/ansible/2.4/intro_windows.html#using-a-windows-control-machine). That is not the goal of the project and even they discourage asking that question.
  - [Technical challenge details from its developer](http://blog.rolpdog.com/2020/03/why-no-ansible-controller-for-windows.html)
  - More links, [1](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#control-node-requirements)

  # What's next

  - Revisit when Windows 10 starts shipping WSL out of the box and WSL is officially supported by Ansible