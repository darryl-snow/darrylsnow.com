"use strict"

express = require "express"
controller = require "./subscriptions.controller"

router = express.Router()

router.post "/", controller.create

module.exports = router