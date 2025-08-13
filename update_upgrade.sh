version: v1.0
name: Uninstall Fastfetch on Remote Server

agent:
  machine:
    type: e1-standard-2
    os_image: ubuntu2004

blocks:
  - name: SSH to Server & Uninstall Fastfetch
    task:
      secrets:
        - name: ssh-credentials
      jobs:
        - name: Remote Uninstall
          commands:
            - checkout
            - chmod +x uninstall_fastfetch.sh
            - ssh -o StrictHostKeyChecking=no $SSH_USER@$SSH_HOST 'bash -s' < uninstall_fastfetch.sh
