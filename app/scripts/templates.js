angular.module("templates", []).run(["$templateCache", function($templateCache) {$templateCache.put("scripts/intro/intro.html","<p>Intro - {{hello}}</p><button resize-panel=\"resize-panel\">button</button>");
$templateCache.put("scripts/skills/skills.html","<div class=\"panel\">Skills</div>");}]);