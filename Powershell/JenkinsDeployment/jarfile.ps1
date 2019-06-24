$name = ""
$path = ""
$target = ""
$runPath = "$name"

cd $path
cd $target

nssm stop $name
nssm.exe remove $name confirm

copy *jar-with-dependencies.jar $runPath\$name.jar

nssm.exe install $name java "-jar $runPath\$name.jar"
nssm.exe start $name
