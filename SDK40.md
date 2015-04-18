# Introduction #

Version 4.0 of the eID Middleware (the eID Middleware contains libraries used by the eID SDK) and the corresponding eID MW SDK 4.0 have been released.


# Details #

## Downloads ##

Please check the [download section](http://code.google.com/p/eid-mw/downloads/list) for the latest releases

The Eid Middleware 4.0 has been released and can be found here:

&lt;BR&gt;


http://eid.belgium.be/nl/Hoe_installeer_je_de_eID/

&lt;BR&gt;



The 4.0 Eid Sdk can be found here:

&lt;BR&gt;


http://eid-mw.googlecode.com/files/sdk40_1306.zip


## Content ##

This 4.0 eidmw SDK will break radically with the older 2.x and 3.5 SDK API's.

&lt;BR&gt;


We will no longer define our own API, but in fact use the cryptografic token interface standard PKCS#11 v2.11 API.

&lt;BR&gt;


The PKCS#11 v2.11 specification can be found at [RSA ](http://www.rsa.com/rsalabs/node.asp?id=2133)

The PKCS#11 v2.11 API will allow you to check for detected cardreaders and card and will allow to retrieve data from the card (either as full files and certificates, or parsed data within these files e.g. first name), sign data with the card,.. .

Samples on how to use the new API will be provided in the SDK.

&lt;BR&gt;


Some can be found already in our source section at [trunk/doc/sdk/examples](https://code.google.com/p/eid-mw/source/browse/#svn%2Ftrunk%2Fdoc%2Fsdk%2Fexamples)

Automatic signatures checking of the data files or validating certificates will not be done within the PKCS#11 API.

## Compatibility ##

Eidmw 4.0 is compatible with SDK 3.5. A warning message about SDK 3.5 deprecation is shown to the user. Future versions of the eid middleware may drop support for SDK 3.5.<br>
Backwards compatibility with version 3.5 of the SDK is planned in the form of an extra downloadable package from the eid.belgium.be site.<br>
<br>
<BR><br>
<br>
<br>
Backwards compatibility towards version 2.x of the SDK is planned to be dropped.<br>
<br>
<BR><br>
<br>
<br>
Older eidmw releases will not be compatible with the 4.0 Eidmw SDK.<br>
<br>
<BR><br>
<br>
<br>
<br>
<h2>Java applet examples compatibility</h2>

SDK 3.5 contains an example Java applet. This applet accesses the eid middleware libraries installed on the client trough JNI libraries.<br>
<br>
<b>SDK 4.0 will not provide Java examples</b>. Java has evolved over time and smartcard access is  now provided by the JVM. Applets can do smartcard operations right in the JVM. This fact removes the need for client side middleware dependencies.<br>
<br>
Fedict provides and maintains a pure Java eid applet. Around the "eid-applet", other applications are built to ease integration with web based applications. We suggest users of SDK 3.5 Java to move on to this platform.<br>
<br>
More information:<br>
<ul><li>eid-applet (<a href='http://code.google.com/p/eid-applet/'>http://code.google.com/p/eid-applet/</a>)<br>
</li><li>Identifcation and authentication: eid-idp (<a href='http://code.google.com/p/eid-idp'>http://code.google.com/p/eid-idp</a>)<br>
</li><li>Digital signatures: eid-dss (<a href='http://code.google.com/p/eid-dss'>http://code.google.com/p/eid-dss</a>)