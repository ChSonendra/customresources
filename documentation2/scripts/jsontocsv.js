const fs = require('fs');
let data = require('../jsonfiles/node_keys.json');
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
    fs.writeFile('../csvfiles/stewards.csv', csv, err => {
        if (err) {
            console.error(err);
            return;
        }
        console.log('File has been created successfully!');
    });
}
const headers = [
    "Steward name",
    "Validator alias",
    "Node IP address",
    "Node port",
    "Client IP address",
    "Client port",
    "Steward DID",
    "Steward verkey",
    "Validator verkey",
    "Validator BLS key",
    "Validator BLS POP"
]

const nodes = Object.keys(data).map(nodeName => ({
    'Steward name': data[nodeName]['Steward name'],
    'Validator alias': data[nodeName]['Validator alias'],
    'Node IP address': data[nodeName]['Node IP address'],
    'Node port': data[nodeName]['Node port'],
    'Client IP address': data[nodeName]['Client IP address'],
    'Client port': data[nodeName]['Client port'],
    'Steward DID': data[nodeName]['Steward DID'],
    'Steward verkey': data[nodeName]['Steward verkey'],
    'Validator verkey': data[nodeName]['Validator verkey'],
    'Validator BLS key': data[nodeName]['Validator BLS key'],
    'Validator BLS POP': data[nodeName]['Validator BLS POP'],
}));
jsonToCsv(nodes, headers)