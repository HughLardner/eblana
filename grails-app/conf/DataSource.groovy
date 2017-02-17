dataSource {
	pooled = true
	driverClassName = "com.mysql.jdbc.Driver"
	//username = "Eblana"
	//password = "Awe6YgHfr"
	//Awe6YgHfr
}
hibernate {
	cache.use_second_level_cache = true
	cache.use_query_cache = false
	cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory' // Hibernate 3
	//    cache.region.factory_class = 'org.hibernate.cache.ehcache.EhCacheRegionFactory' // Hibernate 4
}

// environment specific settings
environments {
	development {
		dataSource {
			username = "Eblana"
			password = "Awe6YgHfr"
			pooled = true
			dbCreate = "update"
			driverClassName = "com.mysql.jdbc.Driver"
			url = "jdbc:mysql://localhost:3306/eblana?user=Eblana&password=Awe6YgHfr"
			//url = "jdbc:mysql://eblana.cae1e41aqjjr.us-east-1.rds.amazonaws.com:3306/eblana?user=Eblana&password=Awe6YgHfr"
			dialect = org.hibernate.dialect.MySQL5InnoDBDialect
			properties {
				validationQuery = "SELECT 1"
				testOnBorrow = true
				testOnReturn = true
				testWhileIdle = true
				timeBetweenEvictionRunsMillis = 1800000
				numTestsPerEvictionRun = 3
				minEvictableIdleTimeMillis = 1800000
			}
		}
	}
	test {
		dataSource {
			dbCreate = "update"
			url = "jdbc:h2:mem:testDb;MVCC=TRUE;LOCK_TIMEOUT=10000;DB_CLOSE_ON_EXIT=FALSE"
		}
	}
	production {
		dataSource {
			//username = "Eblana"
			username = "e83ccf6mnrnceyel"
			//password = "Awe6YgHfr"
			password = "kj2g3df5kss09jy6"
			pooled = true
			dbCreate = "update"
			driverClassName = "com.mysql.jdbc.Driver"
			//url = "jdbc:mysql://eblana.cae1e41aqjjr.us-east-1.rds.amazonaws.com:3306/eblana?user=Eblana&password=Awe6YgHfr"
			url = "jdbc:mysql://e83ccf6mnrnceyel:kj2g3df5kss09jy6@vlvlnl1grfzh34vj.chr7pe7iynqr.eu-west-1.rds.amazonaws.com:3306/qtqqt3euljtjntrp"
			dialect = org.hibernate.dialect.MySQL5InnoDBDialect
			properties {
				validationQuery = "SELECT 1"
				testOnBorrow = true
				testOnReturn = true
				testWhileIdle = true
				timeBetweenEvictionRunsMillis = 1800000
				numTestsPerEvictionRun = 3
				minEvictableIdleTimeMillis = 1800000
			}
		}
	}

}

