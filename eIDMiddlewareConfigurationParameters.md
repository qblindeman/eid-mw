**Warning: this document is not up to date!**

## Locations ##
There are 2 locations for the parameters:
  * A system-wide location: This is the same for all users on the system.
  * A user-specific location: Each user can have specific value for his parameters in this location.
The absolute location depends on the platform:
  * For Windows, the parameters are in the registry.
    * System-wide: `HKEY_LOCAL_MACHINE\SOFTWARE\BEID`
    * User-specific : `HKEY_CURRENT_USER\Software\BEID`
  * For Mac, the parameters are in configuration files.
    * System-wide : `/usr/local/etc/beid.conf`
    * User-specific : `~/Library/Preferences/beid.conf`
  * For Linux, the parameters are also in configuration files.
    * System-wide : `/usr/local/etc/beid.conf`
    * User-specific : `~/.config/beid.conf`

The parameters are grouped by category. In the Windows registry, each category is a new sub-key. While in Mac/Linux configuration files, each category is a new section (e.g. `[general]`)
## Remarks ##
  * The category and parameter name are always in lower case.
  * There are 2 different types of parameters: "String" and "Number". This type mostly matters for the type of registry value:
    * String: REG\_SZ value
    * Number: DWORD value

## Searching rules ##
The way the middleware get the value of a parameter is always the same.
  1. First, it looks in the user-specific location, if the parameter is defined there, it takes this value.
  1. Else it looks in the system-wide location, and if it’s defined, it takes this value.
  1. Else it uses the (hardcoded) default value.

## Parameters ##
### Category “general” ###
| **Name**              | **Type** | **Default value**   | Usage |
|:----------------------|:---------|:--------------------|:------|
| install\_dirname   | Str    | $home             | Directory where the eID Middleware was installed. _Windows setup fill this value with `<TARGETDIR>`_ |
| install\_sdk\_dirname | Str    | $home             | Directory where the sdk was installed. _Not used_ |
| cache\_dirname       | Str    | $home/.eidmwcache | Cache folder for file read out from the card. _Windows setup fill this value with ] `<TARGETDIR>\.cache` (hidden folder)_ |
| language            | Str    | en                | The language use by the middleware dialogs. The excepted value are “en”, “nl”, “fr” and “de”. _Windows setup fill this value with `<LANGUAGE>`_ |
| card\_transmit\_delay | Num    | 3                 | To avoid communication error, some card reader needs to increase the delay after SCardTransmit |
| card\_connect\_delay  | Num    | 0                 | To improve concurrent access and avoid hanging, we may add a delay before a connection to the card |


### Category “logging” ###
| **Name**                | **Type** | **Default value**   | Usage |
|:------------------------|:---------|:--------------------|:------|
| log\_dirname           | Str    | $home             | Folder containing the log files. _Windows setup fill this value with `<TARGETDIR>\log`._|
| log\_prefix            | Str    | .BEID             | Prefix for the name of the log files |
| log\_filenumber        | Num    | 2                 | Number of log files to keep |
| log\_filesize          | Num    | 100000            | Maximum size of a log file (in byte) |
| log\_level             | Str    | error             | Logging level. The accepted values are (in increasing order) : none, critical, error, warning, info, debug |
| log\_group\_in\_new\_file | Num    | 0                 | The log files can be split by module (cardlayer, eidlib, csp,…) 0 means not split, 1 means split. |

### Category “certificatevalidation” ###
| **Name**                | **Type** | **Default value**   | Usage |
|:------------------------|:---------|:--------------------|:------|
| cert\_allow\_testcard   | Num    | 0                 | 0 means the test card are not known by the MW. 1 means the MW knows the test card (but always ask for confirmation) |
| cert\_validation\_crl   | Num    | 0                 | Crl validation: 0 = not used, 1 = optional, 2 = mandatory. _Windows setup fill this value with 0_. |
| cert\_validation\_ocsp  | Num    | 0                 | Ocsp validation: 0 = not used, 1 = optional, 2 = mandatory. _Windows/Mac setup fill this value with 1_. |

### Category “crl” ###
| **Name**                  | **Type** | **Default value**   | Usage |
|:--------------------------|:---------|:--------------------|:------|
| crl\_service\_download\_nr | Num    | 3                 | Number of crl that can be downloaded in parallel. |
| crl\_download\_timeout    | Num    | 300               | Timeout for the download of one crl. (in second) |
| crl\_cachedir            | Str    | $common/crl       | Folder where the crl ar stored. _Windows setup fill this value with `<TARGETDIR>\eidstore\crl\`. Linux default conf hold this value `/usr/share/beid/crl`_. |
| crl\_cachefile           | Str    | .cache.cdc        | Cache file for the crl to load or keep up to date. (hidden and included in the crl folder) |
| crl\_lockfile            | Str    | .crllock.flg      | File lock (for Windows) by the application in charge of the download of the crl. When several applications use the MW, only one downloads the crl and makes them available to all applications. (The file is hidden and included in the crl folder) |