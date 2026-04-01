const express = require('express');
const router = express.Router();

// Example payment endpoint
router.post('/', (req, res) => {
  const { invoiceId, amount, method } = req.body;

  res.json({
    message: 'Payment processed',
    invoiceId,
    amount,
    method,
    status: 'Success'
  });
});

module.exports = router;