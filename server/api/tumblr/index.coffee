"use strict"

express = require "express"
controller = require "./tumblr.controller"

router = express.Router()

router.get "/", controller.index

module.exports = router