dataSource {
    pooled = true
    driverClassName = "org.hsqldb.jdbcDriver"
    username = "system"
    password = "dragoran"
	dialect = "org.hibernate.dialect.Oracle10gDialect"
}
hibernate {
    cache.use_second_level_cache = false
    cache.use_query_cache = false
    cache.provider_class = 'net.sf.ehcache.hibernate.EhCacheProvider'
}
// environment specific settings
environments {
	development {
		dataSource {
			pooled = true
			dbCreate = "update" // one of 'create', 'create-drop','update'
			url = "jdbc:oracle:thin:@127.0.0.1:1521:XE"
			driverClassName = "oracle.jdbc.OracleDriver"
			username = "system"
			password = "dragoran"
			def dialect = org.hibernate.dialect.Oracle10Dialect.class
		}
	}
    test {
        dataSource {
            dbCreate = "update"
            url = "jdbc:hsqldb:mem:testDb"
        }
    }
    production {
		dataSource {
			pooled = true
			dbCreate = "" // one of 'create', 'create-drop','update'
			url = "jdbc:oracle:thin:@ittdb1.arcs.ac.at:1522:oemikat"
			driverClassName = "oracle.jdbc.OracleDriver"
			username = "emikatsys"
			password = "emikatsys"
		}
    }
}
