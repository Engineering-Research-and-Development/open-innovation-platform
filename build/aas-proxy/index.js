const httpProxy = require('http-proxy');
const express = require('express');
const axios = require('axios');

const PORT = 3000;
const TOKEN_ENDPOINT = process.env.TOKEN_ENDPOINT;
const BASIC_AUTH_USER = process.env.BASIC_AUTH_USER;
const BASIC_AUTH_PASS = process.env.BASIC_AUTH_PASS;
const TARGET_URL = process.env.TARGET_URL;

if (!TOKEN_ENDPOINT || !BASIC_AUTH_USER || !BASIC_AUTH_PASS || !TARGET_URL) {
  console.error('Missing required environment variables. Exiting.');
  process.exit(1);
}

const BASIC_AUTH = 'Basic ' + Buffer.from(`${BASIC_AUTH_USER}:${BASIC_AUTH_PASS}`).toString('base64');

let bearerToken = '';

// Function to fetch a new token
async function fetchToken() {
  const params = new URLSearchParams();
  params.append('grant_type', 'client_credentials');
  params.append('scope', '*:create *:read *:update *:delete *:invoke');
  try {
    const response = await axios.post(
      TOKEN_ENDPOINT,
      params,
      {
        headers: {
          'Authorization': BASIC_AUTH,
          'Content-Type': 'application/x-www-form-urlencoded'
        },
      }
    );
    bearerToken = response.data.access_token;
    console.log('Token updated:', bearerToken);
  } catch (error) {
    console.error('Error fetching token:', error.message);
  }
}

// Schedule token updates every 60 minutes
setInterval(fetchToken, 60 * 60 * 1000);

// Fetch the initial token
fetchToken();

// Create the proxy
const proxy = httpProxy.createProxyServer({});
const app = express();

app.use((req, res) => {
  if (!bearerToken) {
    res.status(500).send('Token not available');
    return;
  }

  req.headers['authorization'] = `Bearer ${bearerToken}`; // Add Bearer token
  proxy.web(req, res, { target: TARGET_URL }, (err) => {
    console.error('Proxy error:', err);
    res.status(500).send('Proxy error');
  });
});

// Start the server
app.listen(PORT, () => {
  console.log(`Proxy server running on port ${PORT}`);
});
