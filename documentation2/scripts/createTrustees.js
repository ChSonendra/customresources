const fs = require('fs');
const didpath = "/home/indy_test/documentation2/scripts/version.txt"
const jsonToCsv = (json, headers) => {
  const headerRow = headers.join(",") + "\n";
  let csv = json.reduce((csvString, row) => {
    const values = headers.map(header => {
      const escaped = ('' + row[header]).replace(/"/g, '\\"');
      return `"${escaped}"`;
    });
    return csvString + values.join(",") + "\n";
  }, "");

  csv = headerRow + csv;

  // Write to CSV file
  const fs = require('fs');
  fs.writeFile('/home/indy_test/documentation2/csvfiles/trustees.csv', csv, err => {
    if (err) {
      console.error(err);
      return;
    }
    console.log('File has been created successfully!');
  });
}

let didinput = fs.readFileSync(didpath, 'utf8');
let lines = didinput.split("\n")
let p = []
dids = []
lines.forEach(line => {
  if (line.includes("has been created with")) {
    dids.push(line)
  }
})
for (var i = 0; i < 3; i++) {
  let line = dids[i]
  let lines1 = line.split("\"");
  let name = ''
  if (i == 0) { name = "Trustee1" }
  else if (i == 1) { name = "Trustee2" }
  else if (i == 2) { name = "Trustee3" }
  let data = {
    "Trustee name": name,
    "Trustee DID": lines1[1],
    "Trustee verkey": lines1[3]
  }
  p.push(data)
}
let headers = [
  "Trustee name",
  "Trustee DID",
  "Trustee verkey"
]
console.log(p)
jsonToCsv(p, headers)