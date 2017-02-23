class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?(.$format)?"{
			constraints {
				// apply constraints here
			}
		}
		/*
		 * System Pages without controller
		 */
        "/"(view:"/index")
        "500"(view:'/error')
	}
}
