#!/bin/bash
# build taobao env
# 2014/12/12 ichengwu

if [ -z "$1" ];then
        echo -e "[ERROR] no svn url\n"
		echo -e "Usage:\n sudo -u admin -H $0 URL\n"
		exit 1
fi

# evn
echo -e "[Prepare] env ...\n"
echo "export HOME=/home/admin" >> ~/.bash_profile

# maven
echo -e "[Prepare] maven ..."
mkdir ~/.m2 2>&1
echo -e '
<settings xmlns="http://maven.apache.org/POM/4.0.0"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 
                      http://maven.apache.org/xsd/settings-1.0.0.xsd">
  <activeProfiles>
        <activeProfile>scmdaily</activeProfile>
  </activeProfiles>
</settings>
' > ~/.m2/settings.xml

# app

echo -e "[Prepare] app ..."
cd /home/admin/work
rm -rf * 2>&1
svn co $1
app=`ls`
echo -e "[Prepare] appp_name:$app"
cd "$app"
touch antx.properties

echo -e "[Prepare] appp_name:$app all evn done!"

while true;
    do
		echo -e "[Build] need set app properties?[y/n]:"
        read var
		if  [ "$var" = "y" ];then
			cd /home/admin/work/$app
			echo -e "[Build] you can run : sudo -u admin -H /home/admin/build.sh for build"
			exit 0
		fi
		if  [ "$var" = "n" ];then
			echo -e "[Build] start..."
			sh /home/admin/build.sh
			echo -e "[Build] done..."
			exit 0
		fi
    done
