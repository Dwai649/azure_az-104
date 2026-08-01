const express = require('express');
const router = express.Router();

// Example invoice endpoint
router.post('/', (req, res) => {
  const { customer, items } = req.body;
  const totalAmount = items.reduce((sum, i) => sum + i.quantity * i.price, 0);

  res.json({
    message: 'Invoice generatedn Please proceed',
    customer,
    items,
    totalAmount,
    invoiceId: Math.floor(Math.random() * 100)
  });
});

module.exports = router;