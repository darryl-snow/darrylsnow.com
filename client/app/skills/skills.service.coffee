angular.module("darrylsnowApp").factory "SkillsService", [
	"$resource", ($resource) ->
		$resource "api/skills/:skillId",
			skillId: "@_id"
		,
			update:
				method: "PUT"
]