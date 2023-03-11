const fs = require('fs');
let keysdata = require('../jsonfiles/node_keys.json');
const fileName = '../jsonfiles/node_keys.json'
const didpath = "./version.txt"
const data = [];
let p = []
let node = ''

process.argv.forEach(function (val, index, array) {
  p.push(val)
});
console.log(p[3])
async function generatejson() {
console.log("fcfvgfvg");
let input = JSON.stringify(fs.readFileSync(p[3], 'utf8'))
const liness = input.trim().split('\\r');
liness.forEach(line => {
  console.log("line ==== "+line);
});
let public_key = liness[4].split(" ")[4]
let verification_key = liness[5].split(" ")[4]
let BLSkey = liness[9].split(" ")[5]
let popkey = liness[10].split(" ")[8]
// console.log(" v fdvfgv gfvgfvgfv "+public_key)
// console.log("plane ======= "+fs.readFileSync(p[3]))
// input = JSON.stringify(input)
// console.log("before correction ============ "+input)
// input = input.replace(/\r?\n|\r/gm, "");
// console.log("after correction ============ "+input)
// input = input.split("Init local keys for node")[1]
// console.log("input2"+input)
// let dataa = input.split("Public key is ")[1];
// console.log("data = "+dataa)
// let public_key = dataa.split("\\r\\n")[0]
// console.log("public public_key "+public_key);
// dataa = input.split("Verification key is ")[1]
// let verification_key = dataa.split("\\r\\n")[0]
// console.log("verification key == "+verification_key)
// let BLSkey = dataa.split("Proof of possession for BLS key is ")[0]
// let popkey = dataa.split("Proof of possession for BLS key is ")[1]
// BLSkey = BLSkey.split("BLS Public key is ")[1].split("\\r\\n")[0]
// popkey = popkey.split("\\r\\n")[0]
// console.log("BLSKey = "+BLSkey)
// console.log("popkey = "+popkey)

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
console.log("did = "+f_did)
console.log("verkey = "+f_verkey)
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
console.log(keysdata[p[2]])
fs.writeFile(fileName, JSON.stringify(keysdata), function writeJSON(err) {
  if (err) return console.log(err);
});
}
generatejson();