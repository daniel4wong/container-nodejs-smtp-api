const express = require('express');
const bodyParser = require('body-parser');
const nodemailer = require('nodemailer');

const HOST = '0.0.0.0';
const PORT = process.env.APP_PORT || 8080;

var options = {
  host: process.env.SMTP_HOST,
  port: process.env.SMTP_PORT,
  secureConnection: process.env.SMTP_TLS,
  tls: {
    ciphers:'SSLv3'
  }
};

if (process.env.SMTP_USER) {
  options.auth = {
    user: process.env.SMTP_USER,
    pass: process.env.SMTP_PASS
  };
}

const transporter = nodemailer.createTransport(options);

const app = express();
app.use(bodyParser.json());

app.get('/', (req, res) => {
  res.send('OK');
});
app.post('/send', (req, res) => {
  console.debug(req.body);
  
  transporter.sendMail({
    from: req.body.from,
    to: req.body.to,
    subject: req.body.subject,
    html: req.body.message
  }, (error, info) => {
    if (error) {
      console.log(error);
      res.send("Fail");
    } else {
      console.log('Message sent: ' + info.response);
      res.send("Success");
    }
  });
});

app.listen(PORT, HOST);

console.log(process.env);
console.log(`Server running at http://${HOST}:${PORT}/`);
