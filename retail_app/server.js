const express = require('express');
const bodyParser = require('body-parser');

const purchaseRoutes = require('./routes/purchase');
const invoiceRoutes = require('./routes/invoice');
const paymentRoutes = require('./routes/payment');

const app = express();
app.use(bodyParser.json());

// Routes
app.use('/purchase', purchaseRoutes);
app.use('/invoice', invoiceRoutes);
app.use('/payment', paymentRoutes);

// Root endpoint
app.get('/', (req, res) => {
  res.send('Retail Solution API - Purchasing, Invoicing, Payments');
});

// Azure Web App listens on process.env.PORT
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Retail app running on port ${PORT}`);
});