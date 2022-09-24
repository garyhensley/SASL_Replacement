# SASL_Replacement
 Replacement SASL plugin code for X-Plane 10 payware planes using SASLFree in X-Plane 12.

This is a replacement SASL for older X-Plane 10 payware planes that use SASL v2.  It is fully configurable and allows you to determine which modules and extra features you would like to use.  It is specifically developed to target the Alabeo/Carenado planes from XP10 which were never updated.


# INSTALLATION
1.  Download the latest version of SASL V3 from the SASL website.   https://1-sim.com

2.  Extract the SASLFree directory from the zip file into your plane's "plugins" directory.  There should be a SASLFree directory in the plugins now. 

3.  Download this repository zip file.

4.  Extract the "modules" directory in the zip file into the "SASLFree\data" directory and overwrite all files.

5.  Edit the "settings.json" file in the SASLFree\data\modules\Custom Module directory.  Each module/feature will can be turned on or off by changing the "Load" value for it in the settings file (true or false).

Sample settings files are located in SASLFree\data\modules\Custom Module\sample_settings directory.


# Custom Objects

There are custom objects that can be added to your plane.  They are optional and will not prevent the plugin from working.

To install, copy the directories in the custom objects directory to your plane's objects directory.  Add the objects in the directories in PlaneMaker 12 "Objects".

