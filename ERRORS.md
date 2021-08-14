ERRORS.md

I assembled the issues I faced with some of the packages listed in the README.md

## Neovim

I had to install this module in order for some plugins to work.

If you face the same issue use this command:

For Python 3

>```
>sudo pacman -S --needed python-pip; python3 -m pip install --user --upgrade pynvim
>```

For Python 2

>```
>sudo pacman -S --needed python2-pip; python2 -m pip install --user --upgrade pynvim
>```

## Flutter doctor

In case you face this error when trying to accept the ```android licenses```

>```
>Exception in thread "main" java.lang.NoClassDefFoundError: javax/xml/bind/annotation/XmlSchema
>at com.android.repository.api.SchemaModule$SchemaModuleVersion.<init>(SchemaModule.java:156)
>at com.android.repository.api.SchemaModule.<init>(SchemaModule.java:75)
>at com.android.sdklib.repository.AndroidSdkHandler.<clinit>(AndroidSdkHandler.java:81)
>at com.android.sdklib.tool.sdkmanager.SdkManagerCli.main(SdkManagerCli.java:73)
>at com.android.sdklib.tool.sdkmanager.SdkManagerCli.main(SdkManagerCli.java:48)
>Caused by: java.lang.ClassNotFoundException: javax.xml.bind.annotation.XmlSchema
>at java.base/jdk.internal.loader.BuiltinClassLoader.loadClass(BuiltinClassLoader.java:581)
>at java.base/jdk.internal.loader.ClassLoaders$AppClassLoader.loadClass(ClassLoaders.java:178)
>at java.base/java.lang.ClassLoader.loadClass(ClassLoader.java:522)
>... 5 more
>```

Take a look at this [article](https://edoardovignati.it/solved-flutter-android-licenses-exception) by **edoardo vignati**

## HDMI issue

If you face any issue with HDMI not working just install ```x-on-resize``` from the **AUR** and run this command

>```
>xrandr --output HDMI-1 --auto
>```

Then run this one to give each monitor it's own resolution (some parameters here may vary depending on your ```xrandr``` output)

>```
>xrandr --output LVDS1 --mode 1366x768 --output HDMI1 --mode 1280x1024 --left-of LVDS1
>```
