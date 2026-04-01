const express = require('express');
const router = express.Router();

// Example purchase endpoint
router.post('/', (req, res) => {
  const { item, quantity, price } = req.body;
  const total = quantity * price;
  res.json({
    message: 'Purchase recorded successfully',
    item,
    quantity,
    total
  });
});

module.exports = router;