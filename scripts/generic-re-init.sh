accountName=$1
nodeName=$2
orgName=$3
orgCountry=$4
orgState=$5
orgUnit=$6
orgLocality=$7
deviceSlNum=$8
initParamsFile=$9
certName=$1.$2

# sudo apt-get update
# cd ~/hub-admin-home
# git pull
# git reset --hard origin/master
# 
echo "Changing hostname..." 
/hub-admin-home/scripts/generic-set-hostname.sh $accountName $nodeName 
echo "Done changing hostname..." 

echo "Starting certgetter.."



sudo nice -20 docker run -it --rm \
   --name=certgetter \
   -v /hub-admin-home/certs:/certs \
   -v /hub-admin-home:/jars \
   openjdk:8u212-jre-alpine3.9 java \
   -jar /jars/jscepcli-1.1-SNAPSHOT-exe.jar \
   --ca-identifier swiftconnect-ca \
   --challenge passw0rd \
   --dn "UID=$deviceSlNum,CN=$nodeName,O=$accountName" \
   --key-file /certs/node.key \
   --certificate-file /certs/node.crt \
   --url http://pki.swiftsense.biz/ejbca/publicweb/apply/scep/swift/pkiclient.exe



echo "certgetter actions complete..." 

echo "Preparing to update node red hub..."
/hub-admin-home/scripts/generic-update-red-hub.sh $initParamsFile
echo "Done updating node red hub..." 


