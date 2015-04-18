For SSL certificate managment, Google Chrome on Linux uses NSS. No UI is provided to install PKCS11 modules. NSS-tools come to help here.

# Install NSS tools #

  * Debian/Ubuntu: `sudo apt-get install libnss3-tools`
  * Fedora: `su -c "yum install nss-tools"`

# Add beid pkcs11 library #

Close Chrome

Open a terminal window and enter this:
```
# make sure you are in your homedir
cd
modutil -dbdir sql:.pki/nssdb/ -add "Belgium eID" -libfile /usr/lib/libbeidpkcs11.so
# The path to the library depends on distribution and method of installation.
# To find the right path, use the "about-eid-mw" tool. You can copy/paste the path
# from that dialog.

# check if the library was successfully added
modutil -dbdir sql:.pki/nssdb/ -list
```

You should see something like this:
```
Listing of PKCS #11 Modules
-----------------------------------------------------------
  1. NSS Internal PKCS #11 Module
	 slots: 2 slots attached
	status: loaded

	 slot: NSS Internal Cryptographic Services
	token: NSS Generic Crypto Services

	 slot: NSS User Private Key and Certificate Services
	token: NSS Certificate DB

  2. Root Certs
	library name: /home/koen/.pki/nssdb/libnssckbi.so
	 slots: 1 slot attached
	status: loaded

	 slot: NSS Builtin Objects
	token: Builtin Object Token

  3. Belgium eID
	library name: /usr/lib/libbeidpkcs11.so
	 slots: 1 slot attached
	status: loaded

	 slot: SCM SCR 3310 [CCID Interface] (21120503109149) 00 00
	token: BELPIC
-----------------------------------------------------------

```

Now you can start using your eid in Chrome.