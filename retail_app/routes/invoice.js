const express = require('express');
const router = express.Router();

// Example invoice endpoint
router.post('/', (req, res) => {
  const { customer, items } = req.body;
  const totalAmount = items.reduce((sum, i) => sum + i.quantity * i.price, 0);

  res.json({
    message: 'Invoice generated',
    customer,
    items,
    totalAmount,
    invoiceId: Math.floor(Math.random() * 10000)
  });
});

module.exports = router;