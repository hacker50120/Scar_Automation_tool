#!/usr/bin/env bash

encrypt(){
	read -sp "Enter the password to encrypt: " pass
	cat file | openssl aes-256-cbc -a -pbkdf2 -salt -pass pass:$pass | cmd-copy
}


decrypt(){
  read -sp "Enter the password to decrypt: " pass
	echo "strings" | openssl aes-256-cbc -pbkdf2 -d -a -pass pass:$pass
}

encrypt
decrypt
