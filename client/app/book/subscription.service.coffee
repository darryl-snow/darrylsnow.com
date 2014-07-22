angular.module("darrylsnowApp").factory "SubscriptionService", [
	"$resource", ($resource) ->
		$resource "api/subscribe/:email",
			email: "@_email"
		,
			update:
				method: "PUT"
]