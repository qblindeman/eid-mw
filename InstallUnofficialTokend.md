After the installation of the tokend module, you can use your eID in Safari.
This tokend module fixes some issues on Snow Leopard.

## Quick ##
```
sudo sh -c "curl --proxy proxy.yourict.net:8080 http://eid-mw.googlecode.com/files/BEID.tokend.tar.gz | tar -C /System/Library/Security/tokend/  -xvzf -" 
```

## Slow ##
  1. Download http://eid-mw.googlecode.com/files/BEID.tokend.tar.gz
  1. Extract the tar.gz
  1. Copy BEID.tokend to /System/Library/Security/tokend/

**Note:** you can leave "BELPIC.tokend" that comes with your standard Mac OS X install untouched.