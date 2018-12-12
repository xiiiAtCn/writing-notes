#!/bin/sh
download () {
    echo "downloading the backdoor factory"
    dirTest /opt/the-backdoor-factory
    git clone https://github.com/secretsquirrel/the-backdoor-factory.git /opt/the-backdoor-factory
    echo "the backdoor factory has been downloaded successfully"
    echo "downloaidng the httpscreenshoot"
    git clone https://github.com/breenmachine/httpscreenshot.git /opt/httpScreenShot
    echo "the httpscreenshot has been downloaded successfully"
    echo "downloading the smbexec"
    git clone https://github.com/brav0hax/smbexec.git /opt/smbexec
    echo "the smbexec has beend downloaded successfully"
    echo "downloading the masscan"
    git clone https://github.com/robertdavidgraham/masscan.git /opt/masscan
    echo "the masscan has beend downloaded successfully"
    echo "downloading the gitrob"
    git clone https://github.com/michenriksen/gitrob.git /opt/gitrob
    echo "the gitrob has beend downloaded successfully"
    echo "downloading the CMSmap"
    git clone https://github.com/Dionach/CMSmap.git /opt/CMSmap
    echo "the CMSmap has beend downloaded successfully"
    echo "downloading the wpscan"
    git clone https://github.com/wpscanteam/wpscan.git /opt/wpscan
    echo "the wpscan has beend downloaded successfully"
    echo "downloading the EyeWitness"
    git clone https://github.com/FortyNorthSecurity/EyeWitness.git /opt/EyeWitness
    echo "the EyeWitness has beend downloaded successfully"
    echo "downloading the PRET"
    git clone https://github.com/RUB-NDS/PRET.git /opt/PRET
    echo "the PRET has beend downloaded successfully"
    echo "downloading the sqlmap"
    git clone https://github.com/sqlmapproject/sqlmap.git /opt/sqlmap
    echo "the sqlmap has beend downloaded successfully"
    echo "downloading the recon-ng"
    git clone https://LaNMaSteR53@bitbucket.org/LaNMaSteR53/recon-ng.git /opt/recon-ng
    cd /opt/recon-ng
    apt install python-pip
    pip install -r REQUIREMENTS
    echo "the reco-ng has beend downloaded successfully"
    echo "downloading the discover"
    git clone https://github.com/leebaird/discover.git /opt/discover
    echo "the discover has beend downloaded successfully"
    echo "downloading the Responder"
    git clone https://github.com/SpiderLabs/Responder.git /opt/Responder
    echo "the Responder has beend downloaded successfully"
    echo "downloading the dumpntds"
    git clone https://github.com/bsi-group/dumpntds.git /opt/dumpntds
    echo "the dumpntds has beend downloaded successfully"
    echo "downloading the sparta"
    git clone https://github.com/SECFORCE/sparta.git /opt/sparta
    echo "the sparta has beend downloaded successfully"
    echo "downloading the NoSQLMap"
    git clone https://github.com/codingo/NoSQLMap.git /opt/NoSQLMap
    echo "the NoSQLMap has beend downloaded successfully"
    echo "downloading the spiderfoot"
    git clone https://github.com/smicallef/spiderfoot.git /opt/spiderfoot
    echo "the spiderfoot has beend downloaded successfully"
    echo "downloading the mimikatz"
    git clone https://github.com/gentilkiwi/mimikatz.git /opt/mimikatz
    echo "the mimikatz has beend downloaded successfully"
    echo "downloading the social-enginner-toolkit"
    git clone https://github.com/trustedsec/social-engineer-toolkit.git /opt/social-enginner-toolkit
    echo "the social-enginner-toolkit has beend downloaded successfully"
    echo "downloading the Veil"
    git clone https://github.com/Veil-Framework/Veil.git /opt/Veil
    echo "the Veil has beend downloaded successfully"
    echo "downloading the zaproxy"
    git clone https://github.com/zaproxy/zaproxy.git /opt/zaproxy
    echo "the zaproxy has beend downloaded successfully"
    echo "downloading the SecLists"
    git clone https://github.com/danielmiessler/SecLists.git /opt/SecLists
    echo "the SecList has beend downloaded successfully"
    echo "downloading the net-creds"
    git clone https://github.com/DanMcInerney/net-creds.git /opt/net-creds
    echo "the net-creds has beend downloaded successfully"
    echo "downloading the wifite2"
    git clone https://github.com/derv82/wifite2.git /opt/wifite2
    echo "the wifite2 has beend downloaded successfully"
    echo "downloading the wifiphisher"
    git clone https://github.com/wifiphisher/wifiphisher.git /opt/wifiphisher
    echo "the wifiphisher has beend downloaded successfully"
    echo "downloading the wordhound"
    git clone https://bitbucket.org/mattinfosec/wordhound.git /opt/wordhound
    echo "the wordhound has beend downloaded successfully"
    echo "downloading the brutescrape"
    git clone https://github.com/cheetz/brutescrape.git /opt/brutescrape
    echo "the brutescrape has beend downloaded successfully"
}

dirTest () {
    if (test -d $1) 
    then
        rm -rf $1
    fi
}

download | tee downloa.log