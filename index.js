const express = require('express')
const app = express()

const port = process.env.PORT || 3030;
//import { Web3Storage } from 'web3.storage'


app.get('/', (req, res) => res.send('Hello World! Onexlab updated version 2'))

app.listen(port, (err) => {
    if (err) {
      console.log('Error::', err);
    }
      console.log(`Onexlab app listening on port ${port}`);
  });