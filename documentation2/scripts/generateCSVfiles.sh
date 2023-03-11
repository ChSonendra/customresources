echo "Collecting keys for node1"
cd ..
txtURL=$PWD
cd scripts
node convertkeysdatatojson.js node1 $txtURL/keys_nodes/node1/keys.txt

sleep 3
echo "Collecting keys for node2"

node convertkeysdatatojson.js node2 $txtURL/keys_nodes/node2/keys.txt

sleep 3
echo "Collecting keys for node3"

node convertkeysdatatojson.js node3 $txtURL/keys_nodes/node3/keys.txt

sleep 3
echo "Collecting keys for node4"
node convertkeysdatatojson.js node4 $txtURL/keys_nodes/node4/keys.txt
sleep 3
echo "Keys successfully collected"
echo "creating csv File for Trustess"
sleep 2

node createTrustees.js
sleep 1
echo "creating csv files for Nodes"
sleep 2
node jsontocsv.js
sleep 2
