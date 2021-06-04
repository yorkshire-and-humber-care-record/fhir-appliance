This folder contains the corresponding "private" keys which would normally be held centrally and used for:
 - TLS Mutual Authentication
 - JWT token signing
 
 You would not normally have access to these keys
 
 However they are provided here for quickstart testing purposes, so that you can simulate an external system making calls
  ** Evidently these keys are self-signed by a "fake" CA and are not secret or secure **
  ** They are for internal developer demo purposes only and should not be used with an externally connected system **
  - You may prefer to replace all of the keys and certificates in this "shared" area with your own self-signed set
  - For connecting externally to a care record exchange then all keys and certificates will be replaced with a set of securely signed credentials issued by the Onboarding process
  
