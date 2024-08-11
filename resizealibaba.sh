  167  sudo apt-get update
  168  sudo apt-get install cloud-guest-utils
  169  sudo growpart /dev/nvme0n1 3
  170  sudo resize2fs /dev/nvme0n1p3
