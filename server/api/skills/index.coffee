"use strict"

express = require "express"
controller = require "./skills.controller"

router = express.Router()

router.get "/", controller.index

module.exports = router