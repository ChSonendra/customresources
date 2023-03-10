const fs = require('fs');
let keysdata = require('./node_keys.json');
const fileName = './node_keys.json'
const didpath = "/home/indy_test/documentation/version.txt"
const data = [];
let p = []
let node = ''
process.argv.forEach(function (val, index, array) {
  p.push(val)
});

let input = fs.readFileSync(p[3], 'utf8');
input = input.split("Init local keys for node")[1]
let dataa = input.split("-stack Public key is ")[1];
let public_key = dataa.split(" ", 2)[0]
dataa = dataa.split("Verification key is ")[1]
let verification_key = dataa.split(" ")[0]
let BLSkey = dataa.split("Proof of possession for BLS key is ")[0]
let popkey = dataa.split("Proof of possession for BLS key is ")[1]
BLSkey = BLSkey.split("BLS Public key is ")[1].split(" ")[0]
popkey = popkey.split(" ")[0]

let didinput = fs.readFileSync(didpath, 'utf8');
let lines = didinput.split("\n")
dids = []
lines.forEach(line => {
  if (line.includes("has been created with")) {
    dids.push(line)
  }
})
let node_nm = parseInt(p[2].split("e")[1])
let line = dids[node_nm + 2]
let lines1 = line.split("\"");
let f_did = lines1[1];
let f_verkey = lines1[3];
if (node_nm == 1) { nPort = "9701"; cPort = "9702" }
else if (node_nm == 2) { nPort = "9703"; cPort = "9704" }
else if (node_nm == 3) { nPort = "9705"; cPort = "9706" }
else if (node_nm == 4) { nPort = "9707"; cPort = "9708" }
keysdata[p[2]] = {
  "Steward name": p[2],
  "Validator alias": p[2],
  "Node IP address": "34.174.183.175",
  "Node port": nPort,
  "Client IP address": "34.174.183.175",
  "Client port": cPort,
  "Steward DID": f_did,
  "Steward verkey": f_verkey,
  "Validator verkey": verification_key,
  "Validator BLS key": BLSkey,
  "Validator BLS POP": popkey
}
fs.writeFile(fileName, JSON.stringify(keysdata), function writeJSON(err) {
  if (err) return console.log(err);
});