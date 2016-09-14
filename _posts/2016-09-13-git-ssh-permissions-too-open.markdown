---
layout: post
title: Git SSH Permissions
---


{::comment}
Need better formatting for <code> blocks
syntax highlighting would be nice
{:/comment}

Your keys might be generated and shared correctly, but git wants to enforce good security practice by demanding that your private key not be writable by other users on your system.

	fkoran@host~/$ git push
	...
	@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	@         WARNING: UNPROTECTED PRIVATE KEY FILE!          @
	@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	Permissions 0770 for '/home/fkoran/.ssh/id_rsa' are too open.
	It is required that your private key files are NOT accessible by others.
	This private key will be ignored.
	Load key "/home/fkoran/.ssh/id_rsa": bad permissions
	Permission denied (publickey).
	fatal: Could not read from remote repository.

	Please make sure you have the correct access rights
	and the repository exists.
	fkoran@host:~/$ ls -l ~/.ssh/id_rsa
	-rwxrwx--- 1 fkoran fkoran 3326 Jan  6  2016 /home/fkoran/.ssh/id_rsa

To fix this, use [chmod](http://linux.die.net/man/1/chmod) to remove write permissions for users in the "group" and "other" categories.


	fkoran@host:~/$ chmod go-w ~/.ssh/id_rsa
	fkoran@host:~/$ ls -l ~/.ssh/id_rsa
	-rwxr-x--- 1 fkoran fkoran 3326 Jan  6  2016 /home/fkoran/.ssh/id_rsa

More detailed information can be found [here](http://bodhizazen.net/Tutorials/SSH_keys#Login)
