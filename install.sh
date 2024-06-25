#!/bin/bash
PARAMETERS=$@;
INSTALLATION="";
SCRIPT_NAME="";

echo "### Logging during installation ###";
echo "";
echo "Select the desired installation type.";
echo "#1 - ONLYOFFICE Workspace Community Edition"
echo "#2 - ONLYOFFICE Workspace Enterprise Edition"
echo "#3 - ONLYOFFICE DocSpace Community Edition"
echo "#4 - ONLYOFFICE DocSpace Enterprise Edition"
echo "";

read -p "Please enter the number: " -n 1 INSTALLATION ;

if  [ "$INSTALLATION" != "" ]; then
	case $INSTALLATION in	

		1 )
			echo "#1 - ONLYOFFICE Workspace Community Edition"
			wget -O workspace-install.sh -N --tries=3 https://download.onlyoffice.com/install/workspace-install.sh
			SCRIPT_NAME="workspace-install.sh"
			shift
		;;

		2 )
			echo "#2 - ONLYOFFICE Workspace Enterprise Edition"
			wget -O workspace-enterprise-install.sh -N --tries=3 wget https://download.onlyoffice.com/install/workspace-enterprise-install.sh
			SCRIPT_NAME="workspace-enterprise-install.sh"
			shift
		;;
		
		3 )
			echo "#3 - ONLYOFFICE DocSpace Community Edition"
			wget -O docspace-install.sh -N --tries=3 http://download.onlyoffice.com/docspace/docspace-install.sh
			SCRIPT_NAME="docspace-install.sh"
			shift
		;;
		
		4 )
			echo "#4 - ONLYOFFICE DocSpace Enterprise Edition"
			wget -O docspace-enterprise-install.sh -N --tries=3 http://download.onlyoffice.com/docspace/docspace-enterprise-install.sh
			SCRIPT_NAME="docspace-enterprise-install.sh"
			shift
		;;

		-? | -h | --help )

		;;

	esac
	shift
fi

if [ "$SCRIPT_NAME" != "" ] ; then

	(	bash ${SCRIPT_NAME} ${PARAMETERS}
		) 2>&1 | tee loginstall_$(date +%Y%m%d_%H%M%S).log

fi