from ubuntu
run apt-get update -qq
run DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata
run apt-get install nodejs -qq
run apt-get install make -qq
run apt-get install npm -qq
run apt-get install wget -qq
# ...first add the Cloud Foundry Foundation public key and package repository to your system
run wget -q -O - https://packages.cloudfoundry.org/debian/cli.cloudfoundry.org.key | apt-key add
run echo "deb https://packages.cloudfoundry.org/debian stable main" | tee /etc/apt/sources.list.d/cloudfoundry-cli.list
# ...then, update your local package index, then finally install the cf CLI
run apt-get update -qq
run apt-get install cf-cli -qq
run npm config set @sap:registry https://npm.sap.com -g
run npm install -g mbt --unsafe-perm=true --allow-root
run cf install-plugin multiapps
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
