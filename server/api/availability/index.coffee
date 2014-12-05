"use strict"

express = require "express"
controller = require "./availability.controller"
auth = require "../../auth/auth.service"

router = express.Router()

router.get "/", controller.index
router.get "/:date", controller.show
router.post "/", auth.isAuthenticated(), auth.hasRole("admin"), controller.create

module.exports = router