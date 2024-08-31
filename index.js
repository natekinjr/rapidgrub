const express = require('express');
const axios = require('axios');
const bodyParser = require('body-parser');

const app = express();
app.use(bodyParser.json());

const consumerKey = 'k7CdfAKrnxxG4n9LA5vl91BPPA8w9X7GlLOZXBMbabrXMifA';
const consumerSecret = 'vmvKug7WwR6yODq2X3wumGd1YYIEQg0j47Y6L4yLacKgVV3BouTN73p9de1uqzko';

// Get OAuth token
app.get('/mpesa/token', async (req, res) => {
    const auth = Buffer.from(`${consumerKey}:${consumerSecret}`).toString('base64');
    try {
        const response = await axios.get('https://sandbox.safaricom.co.ke/oauth/v1/generate?grant_type=client_credentials', {
            headers: {
                Authorization: `Basic ${auth}`
            }
        });
        res.json(response.data);
    } catch (error) {
        res.status(500).send(error);
    }
});

// Simulate Payment Request (Lipa na Mpesa Online)
app.post('/mpesa/stkpush', async (req, res) => {
    const { phone, amount } = req.body;
    const shortCode = 'YOUR_SHORTCODE';
    const passkey = 'YOUR_PASSKEY';
    const timestamp = new Date().toISOString().replace(/[-T:.Z]/g, '');
    const password = Buffer.from(`${shortCode}${passkey}${timestamp}`).toString('base64');

    try {
        const { data } = await axios.get('https://sandbox.safaricom.co.ke/oauth/v1/generate?grant_type=client_credentials', {
            headers: {
                Authorization: `Basic ${auth}`
            }
        });
        const token = data.access_token;

        const response = await axios.post('https://sandbox.safaricom.co.ke/mpesa/stkpush/v1/processrequest', {
            BusinessShortCode: shortCode,
            Password: password,
            Timestamp: timestamp,
            TransactionType: 'CustomerPayBillOnline',
            Amount: amount,
            PartyA: phone,
            PartyB: shortCode,
            PhoneNumber: phone,
            CallBackURL: 'https://yourcallbackurl.com/callback',
            AccountReference: 'Test123',
            TransactionDesc: 'Payment for Food'
        }, {
            headers: {
                Authorization: `Bearer ${token}`
            }
        });

        res.json(response.data);
    } catch (error) {
        res.status(500).send(error);
    }
});

// Listen on a port
const port = process.env.PORT || 3000;
app.listen(port, () => {
    console.log(`Server running on port ${port}`);
});
