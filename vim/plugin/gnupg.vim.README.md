# gnupg.vim

Created by: James McCoy
Script type: utility

### DESCRIPTION
This script implements transparent editing of gpg encrypted files. The filename
must have a ".gpg", ".pgp" or ".asc" suffix. When opening such a file the 
ontent is decrypted, when opening a new file the script will ask for the
recipients of the encrypted file. The file content will be encrypted to all
recipients before it is written. The script turns off viminfo and swapfile to
increase security. 

### RESOURCES
  - https://github.com/jamessan/vim-gnupg
  - http://www.vim.org/scripts/script.php?script_id=3645

