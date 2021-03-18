accountName=$1
nodeName=$2
orgName=$3
orgCountry=$4
orgState=$5
orgUnit=$6
orgLocality=$7
certName=$1.$2


#-----------------------------
# Setup certificates
#----------------------------
certFolderName=/hub-admin-home/certs/
mkdir -p $certFolderName
sudo mkdir -p /etc/ssl/private 
sudo mkdir -p /etc/ssl/certs

sudo getcert add-scep-ca -c SWIFTSENSE -u http://pki.swiftsense.biz/scep
# sudo getcert stop-tracking -c SWIFTSENSE -i $certName
sudo rm /hub-admin-home/certs/node.key /hub-admin-home/certs/node.crt
sudo getcert list | grep 'Request ID' | cut -d"'" -f 2 | xargs -n 1 sudo getcert stop-tracking -i

# sudo getcert add-scep-ca -c SWIFTSENSE -u http://pki.swiftsense.biz/scep
sudo getcert request -v -w -c SWIFTSENSE -L SecretChallenge \
  -I $certName \
  -T "swiftsense" \
  -D "pki.swiftsense.biz" \
  -D "test.pki.swiftsense.biz" \
  -g 2048 \
  -k $certFolderName/node.key  \
  -f $certFolderName/node.crt \
  -N "CN=$nodeName,O=$accountName,C=$orgCountry,ST=$orgState,L=$orgLocality,OU=$orgUnit"

# sudo install -m 777 -o $USER /etc/ssl/private/$certName.key $certFolderName/node.key && sudo install -m 777 -o $USER /etc/ssl/certs/$certName.crt $certFolderName/node.crt
echo 'Installed certificates into hub folder...' 

