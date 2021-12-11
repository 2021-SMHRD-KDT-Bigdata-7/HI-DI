const express = require('express');
const router = expree.Router();

router.get('/', (req, res, next) =>{
    res.send(new Date());
})

module.exports = router;