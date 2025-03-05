# uploader

% upload, transfer, http, wget, curl, certutil, powershell, bitsadmin

## uploader - Upload d'un fichier vers une machine Linux cible en utilisant Wget
#plateform/linux #target/remote #cat/UPLOAD

```
uploader --os Linux --file <chemin_vers_fichier> --payload Wget
```

## uploader - Upload d'un fichier vers une machine Linux cible en utilisant Curl
#plateform/linux #target/remote #cat/UPLOAD

```
uploader --os Linux --file <chemin_vers_fichier> --payload Curl
```

## uploader - Upload d'un fichier vers une machine Windows cible en utilisant Invoke-WebRequest (Iwr)
#plateform/windows #target/remote #cat/UPLOAD

```
uploader --os Windows --file <chemin_vers_fichier> --payload Iwr
```

## uploader - Upload d'un fichier vers une machine Windows cible en utilisant Certutil
#plateform/windows #target/remote #cat/UPLOAD

```
uploader --os Windows --file <chemin_vers_fichier> --payload Certutil
```

## uploader - Upload d'un fichier vers une machine Windows cible en utilisant Bitsadmin
#plateform/windows #target/remote #cat/UPLOAD

```
uploader --os Windows --file <chemin_vers_fichier> --payload Bitsadmin
```

## uploader - Upload d'un fichier vers une machine Windows cible en utilisant Regsvr32
#plateform/windows #target/remote #cat/UPLOAD

```
uploader --os Windows --file <chemin_vers_fichier> --payload Regsvr32
```
