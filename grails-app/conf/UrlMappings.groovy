class UrlMappings {

	static mappings = {

		/*
		 * Pages without controller
		 */
		//		"/"				(view:"/index")
		"/about"		(view:"/siteinfo/about")
		"/blog"			(view:"/siteinfo/blog")
		"/systeminfo"	(view:"/siteinfo/systeminfo")
		"/contact"		(view:"/siteinfo/contact")
		"/terms"		(view:"/siteinfo/terms")
		"/imprint"		(view:"/siteinfo/imprint")
		"/nextSteps"	(view:"/home/nextSteps")

		/*
		 * Pages with controller
		 * WARN: No domain/controller should be named "api" or "mobile" or "web"!
		 */
		"/"	{
			controller	= 'home'
			action		= { 'index' }
			view		= { 'index' }
		}
		"/$controller/$action?/$id?"{
			constraints { controller(matches:/^((?!(api|mobile|web)).*)$/) }
		}

		/*
		 * System Pages without controller
		 */
		"403"(controller: "errors", action: "error403")
		"500"(controller: "errors", action: "error500")
		"500"(controller: "errors", action: "error403",
		exception: AccessDeniedException)
		"500"(controller: "errors", action: "error403",
		exception: NotFoundException)
	}
}
